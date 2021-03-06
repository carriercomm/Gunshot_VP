{$S-,R-,V-,I-,B-,F+,O-,A-}

{$IFDEF WIN32}
{Conditional defines that may affect this unit}
{$I APDEFINE.INC}
{$ENDIF}

unit FastW1;
  {-Fast screen writing routines (last update 6/7/90)}
  {-Updated for Protected Mode operation 6/19/92}

interface

uses
  Dpmi,
  Dos;

const
  frTL = 0;
  frBL = 1;
  frTR = 2;
  frBR = 3;
  frTT = 4;
  frBB = 5;
  frLL = 6;
  frRR = 7;
type
  DisplayType = (Monochrome, CGA, EGA, MCGA, VGA);
  FrameCharType = frTL..frRR;
  FrameArray = array[FrameCharType] of Char;
const
  FrameChars : FrameArray = '�Ը��ͳ�';
var
  BaseOfScreen : Word;            {Base address of video memory}
  WaitForRetrace : Boolean;       {Check for snow on color cards?}
  ScreenWidth : Word;
  ScreenHeight : Word;
  VideoSegment : Word;
  VideoMode : Byte;

procedure FastWrite(St : String; Row, Col, Attr : Byte);
  {-Writes St at Row,Col in Attr (video attribute) without snow}

procedure FastWriteNA(St : String; Row, Col : Byte);
  {-Writes St at Row,Col without snow, but doesn't change video attributes}

procedure ChangeAttribute(Number : Word; Row, Col, Attr : Byte);
  {-Changes Number video attributes to Attr starting at Row,Col}

procedure MoveFromScreen(var Source, Dest; Length : Word);
  {-Moves Length words from Source (video memory) to Dest without snow}

procedure MoveToScreen(var Source, Dest; Length : Word);
  {-Moves Length words from Source to Dest (video memory) without snow}

function CurrentDisplay : DisplayType;
  {-Returns type of the currently active display}

procedure ReinitFastWrite;
  {-Initializes WaitForRetrace and BaseOfScreen. Called automatically before
    program starts.}

function SaveWindow(XLow, YLow, XHigh, YHigh : Byte; Allocate : Boolean;
                    var Covers : Pointer) : Boolean;
  {-Allocate buffer space if requested and save window contents}

procedure RestoreWindow(XLow, YLow, XHigh, YHigh : Byte;
                        Deallocate : Boolean; var Covers : Pointer);
  {-Restore screen contents and deallocate buffer space if requested}

procedure FrameWindow(LeftCol, TopRow, RightCol, BotRow : Word;
                      FAttr, HAttr : Byte; Header : String);
  {-Draws a frame around a window}

procedure WhereXYAbs(var XY : Word);
  {-Return the absolute (not window relative) coordinates of cursor}

procedure GotoXY(X, Y : Word);
  {-Position cursor at absolute coordinates X, Y}

procedure GotoXYAbs(XY : Word);
  {-Position cursor at absolute coordinates X, Y}

procedure HideCursor;
  {-Hide the cursor}

procedure ShowCursor;
  {-Display a normal cursor}

implementation

{$IFDEF WIN32}
uses
  VPSysLow;
{$ENDIF}

type
  BufPtr = ^BufferArray;
  BufferArray = array[0..MaxInt] of Char;

{$IFDEF MSDOS}
  {$L FASTW1}
{$ENDIF}

  {$F+}
  procedure FastWrite(St : String; Row, Col, Attr : Byte);
    {-Writes St at Row,Col in Attr (video attribute) without snow}
{$IFDEF MSDOS}
  external {FASTW1} ;
{$ENDIF}
{$IFDEF WIN32}
  begin
    SysWrtCharStrAtt(@St[1], Length(St), Col - 1, Row - 1, Attr);
  end;
{$ENDIF}

  procedure FastWriteNA(St : String; Row, Col : Byte);
    {-Writes St at Row,Col without snow, but doesn't change video attributes}
{$IFDEF MSDOS}
  external {FASTW1} ;
{$ENDIF}
{$IFDEF WIN32}
  begin
    WriteLn('REETODO FASTW1 FastWriteNA'); Halt;
  end;
{$ENDIF}

  procedure ChangeAttribute(Number : Word; Row, Col, Attr : Byte);
    {-Changes Number video attributes to Attr starting at Row,Col}
{$IFDEF MSDOS}
  external {FASTW1} ;
{$ENDIF}
{$IFDEF WIN32}
  begin
    WriteLn('REETODO FASTW1 ChangeAttribute'); Halt;
  end;
{$ENDIF}

  procedure MoveFromScreen(var Source, Dest; Length : Word);
    {-Moves Length words from Source (video memory) to Dest without snow}
{$IFDEF MSDOS}
  external {FASTW1} ;
{$ENDIF}
{$IFDEF WIN32}
  begin
    WriteLn('REETODO FASTW1 MoveFromScreen'); Halt;
  end;
{$ENDIF}

  procedure MoveToScreen(var Source, Dest; Length : Word);
    {-Moves Length words from Source to Dest (video memory) without snow}
{$IFDEF MSDOS}
  external {FASTW1} ;
{$ENDIF}
{$IFDEF WIN32}
  begin
    WriteLn('REETODO FASTW1 MoveToScreen'); Halt;
  end;
{$ENDIF}

  function CurrentDisplay : DisplayType;
    {-Returns type of the currently active display}
{$IFDEF MSDOS}
  external {FASTW1} ;
{$ENDIF}
{$IFDEF WIN32}
  begin
    CurrentDisplay := VGA;
  end;
{$ENDIF}

  function CurrentVideoMode : Byte;
    {-Returns current video mode}
{$IFDEF MSDOS}
  external {FASTW1} ;
{$ENDIF}
{$IFDEF WIN32}
  begin
    CurrentVideoMode := 3; // CO80
  end;
{$ENDIF}
  {$F-}

  procedure ReinitFastWrite;
    {-Initializes WaitForRetrace and BaseOfScreen}
  begin                           {InitFastWrite}
    {initialize WaitForRetrace and BaseOfScreen}
    if CurrentVideoMode = 7 then
      BaseOfScreen := MonoSele       {Mono}
    else
      BaseOfScreen := ColorSele;     {Color}
    WaitForRetrace := (CurrentDisplay = CGA);
  end;                            {InitFastWrite}


  function SaveWindow(XLow, YLow, XHigh, YHigh : Byte; Allocate : Boolean;
                      var Covers : Pointer) : Boolean;
    {-Allocate buffer space if requested and save window contents}
  var
    CoversP : BufPtr absolute Covers;
    WordsPerRow : Word;
    BufBytes : Word;
    SrcPos : Word;
    DestPos : Word;
    Row : Word;
  begin
    {assume success}
    SaveWindow := True;

    {compute number of words to move per row}
    WordsPerRow := Succ(XHigh-XLow);

    if Allocate then begin
      {compute bytes needed for screen buffer}
      BufBytes := (WordsPerRow*Succ(YHigh-YLow)) shl 1;

      {make sure enough memory is available}
      if MaxAvail < LongInt(BufBytes) then begin
        SaveWindow := False;
        Exit;
      end
      else
        {allocate the screen buffer}
        GetMem(CoversP, BufBytes);
    end;

    {save current contents to the screen buffer}
    DestPos := 0;
    SrcPos := (Pred(YLow)*ScreenWidth+Pred(XLow)) shl 1;
    for Row := YLow to YHigh do begin
{$IFDEF MSDOS}
      MoveFromScreen(Mem[VideoSegment:SrcPos], CoversP^[DestPos], WordsPerRow);
{$ENDIF}
{$IFDEF WIN32}
  WriteLn('REETODO FASTW1 SaveWindow'); Halt;
{$ENDIF}
      Inc(SrcPos, ScreenWidth shl 1);
      Inc(DestPos, WordsPerRow shl 1);
    end;
  end;

  procedure RestoreWindow(XLow, YLow, XHigh, YHigh : Byte;
                          Deallocate : Boolean; var Covers : Pointer);
    {-Restore screen contents and deallocate buffer space if requested}
  var
    CoversP : BufPtr absolute Covers;
    WordsPerRow : Word;
    SrcPos : Word;
    DestPos : Word;
    Row : Word;
  begin
    {compute number of words to move per row}
    WordsPerRow := Succ(XHigh-XLow);

    {Restore current contents to the screen buffer}
    DestPos := 0;
    SrcPos := (Pred(YLow)*ScreenWidth+Pred(XLow)) shl 1;
    for Row := YLow to YHigh do begin
{$IFDEF MSDOS}
      MoveToScreen(CoversP^[DestPos], Mem[VideoSegment:SrcPos], WordsPerRow);
{$ENDIF}
{$IFDEF WIN32}
  WriteLn('REETODO FASTW1 RestoreWindow'); Halt;
{$ENDIF}
      Inc(SrcPos, ScreenWidth shl 1);
      Inc(DestPos, WordsPerRow shl 1);
    end;

    {deallocate buffer space if requested}
    if Deallocate then begin
      FreeMem(CoversP, (WordsPerRow*Succ(YHigh-YLow)) shl 1);
      CoversP := nil;
    end;
  end;

  procedure FrameWindow(LeftCol, TopRow, RightCol, BotRow : Word;
                        FAttr, HAttr : Byte; Header : String);
    {-Draws a frame around a window}
  var
    HeaderLen : Byte absolute Header;
    Row, Width, HeaderPos : Word;

    function CharStr(C : Char; Len : Byte) : String;
      {-Returns a string of C for Len}
    var
      S : String;
    begin
      FillChar(S[1], Len, C);
      S[0] := Char(Len);
      CharStr := S;
    end;

  begin
    {calculate width of window}
    Width := RightCol-LeftCol-1;

    {draw the upper border}
    FastWrite(FrameChars[frTL], TopRow, LeftCol, FAttr);
    FastWrite(CharStr(FrameChars[frTT], Width), TopRow, LeftCol+1, FAttr);
    FastWrite(FrameChars[frTR], TopRow, RightCol, FAttr);

    {draw the header}
    if HeaderLen > 0 then begin
      if HeaderLen > Width then
        HeaderLen := Width;
      HeaderPos := (Width-HeaderLen) shr 1;
      FastWrite(Header, TopRow, LeftCol+HeaderPos+1, HAttr);
    end;

    {draw the vertical bars}
    for Row := Succ(TopRow) to Pred(BotRow) do begin
      FastWrite(FrameChars[frLL], Row, LeftCol, FAttr);
      FastWrite(FrameChars[frRR], Row, RightCol, FAttr);
    end;

    {draw the bottom border}
    FastWrite(FrameChars[frBL], BotRow, LeftCol, FAttr);
    FastWrite(CharStr(FrameChars[frBB], Width), BotRow, LeftCol+1, FAttr);
    FastWrite(FrameChars[frBR], BotRow, RightCol, FAttr);
  end;

{$IFDEF MSDOS}
  procedure WhereXYAbs(var XY : Word);
    {-Return the absolute (not window relative) coordinates of cursor}
  var
    Regs : Registers;
  begin
    with Regs do begin
      AH := 3;
      BH := 0;
      Intr($10, Regs);
      XY := DX;
    end;
  end;
{$ENDIF}
{$IFDEF WIN32}
  procedure WhereXYAbs(var XY : Word);
    {-Return the absolute (not window relative) coordinates of cursor}
  var
    X, Y: SmallWord;
  begin
    SysGetCurPos(X, Y);
    XY := X + (Y SHL 8);
  end;
{$ENDIF}

  procedure GotoXY(X, Y : Word);
  begin
    GotoXYAbs((X - 1) + ((Y - 1) SHL 8));
  end;
  
{$IFDEF MSDOS}
  procedure GotoXYAbs(XY : Word);
    {-Position cursor at absolute coordinates X, Y}
  var
    Regs : Registers;
  begin
    with Regs do begin
      AH := 2;
      BH := 0;
      DX := XY;
      Intr($10, Regs);
    end;
  end;
{$ENDIF}
{$IFDEF WIN32}
  procedure GotoXYAbs(XY : Word);
    {-Return the absolute (not window relative) coordinates of cursor}
  begin
    SysTVSetCurPos(XY AND $00FF, (XY AND $FF00) SHR 8);
  end;
{$ENDIF}

{$IFDEF MSDOS}
  procedure SetCursorSize(Startline, EndLine : Byte);
    {-Set the cursor start and end scan lines}
  begin
    asm
      mov   ch,StartLine
      mov   cl,EndLine
      mov   ah,1
      push  bp
      int   10h
      pop   bp
    end;
  end;
{$ENDIF}
{$IFDEF WIN32}
  procedure SetCursorSize(Startline, EndLine : Byte);
    {-Set the cursor start and end scan lines}
  begin
    WriteLn('REETODO FASTW1 SetCursorSize'); Halt;
  end;
{$ENDIF}

  procedure HideCursor;
    {-Hide the cursor}
  begin
    SetCursorSize($20, 0);
  end;

  procedure ShowCursor;
    {-Display a normal cursor}
  var
    ScanLines : Word;
  begin
    if VideoMode = 7 then
      ScanLines := $0B0C
    else
      ScanLines := $0607;
    SetCursorSize(Hi(ScanLines), Lo(ScanLines));
  end;

var
{$IFDEF MSDOS}
  Regs : Registers;
{$ENDIF}
  SHByte : Byte; {absolute $40 : $84;}

begin
{$IFDEF MSDOS}
  SHByte := Byte(Ptr(BiosDataSele, $84)^);

  ReinitFastWrite;

  {Set ScreenWidth and get video mode}
  with Regs do begin
    AH := $0F;
    Intr($10, Regs);
    ScreenWidth := AH;
    VideoMode := AL;
  end;

  ScreenHeight := 25;   {assume 25 lines}
  {determine video type}
  with Regs do begin
    AX := $1A00;
    Intr($10, Regs);
    if AL = $1A then begin
      {this is VGA or MCGA}
      {Get ScreenHeight from BIOS data area}
      ScreenHeight := SHByte + 1;
    end
    else begin
      {check for EGA}
      BX := $FF10;
      CX := $FFFF;
      AX := $1200;
      if CX <> $FFFF then
        if BH in [0, 1] then
          {this is an EGA}
          {Get ScreenHeight from BIOS data area}
          ScreenHeight := SHByte + 1
    end;
  end;
{$ENDIF}
{$IFDEF WIN32}
  ReinitFastWrite;
  ScreenWidth := 80; // REETODO
  ScreenHeight := 25; // REETODO
  VideoMode := 3; // CO80
{$ENDIF}

  {Set VideoSegment}
  if VideoMode = 7 then
    VideoSegment := MonoSele
  else
    VideoSegment := ColorSele;
end.
