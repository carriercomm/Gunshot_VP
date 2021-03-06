{$S-,R-,V-,I-,B-,F+,A-}
{$M 16384, 0, 655360}

{$I APDEFINE.INC}

{******************************************************}
{*                  SIMPRCV.PAS  2.03                 *}
{*      Copyright (c) TurboPower Software 1993.       *}
{*                All rights reserved.                *}
{******************************************************}

program SimpRcv;
  {-Simple receive-fax demo}

uses
  {$IFDEF LeakCheck}                                                   {!!.01}
  LeakChek,                                                            {!!.01}
  {$ENDIF}                                                             {!!.01}
  Dos,
  {$IFDEF UseOPro}
  OpCrt,
  {$ENDIF}
  {$IFDEF UseTPro}
  TpCrt,
  {$ENDIF}
  {$IFDEF StandAlone}
  Crt,
  {$ENDIF}
  {$IFDEF UsePModeDLL}
  ApComD,
  ApFaxD;
  {$ELSE}
  ApMisc,
  ApPort,
  ApUart,
  ApCom,
  ApFaxCvt,
  ApAbsFax,
  ApFax12,
  ApFaxCas;
  {$ENDIF}

const
  CopyrightLine = 'SIMPRCV 2.03 -- receive fax demo   (c)1993 TurboPower Software';
  CName : ComNameType = Com1;
  StatID : PathStr = 'SIMPRCV DEMO';
  BRate : LongInt = 19200;
  FaxBRate : Word = 9600;
  MInit : String[40] = 'ATM0V1X4';
  SetFaxBRate : Boolean = False;
  FaxClass : ClassType = ctClass2;
  ConnectInProg : Boolean = False;
  IrqNum : Byte = 0;
  CommandBaud : LongInt = 0;                                           {!!.01}

var
  P : PortRecPtr;
  R : FaxRecPtr;

  procedure AbortMsg(S : String);
    {-Display message and halt}
  begin
    {$IFDEF Tracing}
    DumpTraceHex('SIMPRCV.TRC');
    {$ENDIF}

    WriteLn(S);
    Halt(1);
  end;

  function Long2Str(L : LongInt) : string;
    {-Convert a long/word/integer/byte/shortint to a string}
  var
    S : string;
  begin
    Str(L, S);
    Long2Str := S;
  end;

  procedure MyErrorProc(P : Pointer; var StatusCode : Word);
  {$IFDEF UsePModeDLL} Export; {$ENDIF}
  var
    AP : PortRecPtr absolute P;
  begin
    if (StatusCode mod 10000) <> ecUserAbort then
      WriteLn(^M^J'Error: ', StatusStr(StatusCode mod 10000));
  end;

  function MyAbort : Boolean;
  {$IFDEF UsePModeDLL} Export; {$ENDIF}
  begin
    MyAbort := False;
    if KeyPressed then
      if ReadKey = #27 then
        MyAbort := True;
  end;

  procedure MyStatus(FP : FaxRecPtr; Starting, Ending : Boolean);
  {$IFDEF UsePModeDLL} Export; {$ENDIF}
  const
    First : Boolean = True;
    LastProgress : Word = 0;
  var
    Pages : Word;
    Page : Word;
    Bytes : LongInt;
    Total : LongInt;
    BPS : LongInt;
    Res : Boolean;
    ECM : Boolean;
    Progress : Word;
  begin
    {Check for errors first}
    if (GetAsyncStatus <> ecOk) and not Ending then
      {Do nothing, we'll display an error message after FaxReceive aborts}
      Exit;

    {No errors, show current progress. Show most progress values only once}
    Progress := GetFaxProgress(FP);
    if Progress <> LastProgress then begin
      First := True;
      if LastProgress = fpGetPage then
        WriteLn;
      LastProgress := Progress;
    end else
      First := False;

    if Starting then begin
      WriteLn('-----------------');
      WriteLn('First status call');
    end else if Ending then begin
      WriteLn(^M^J'Last status call');
      WriteLn('----------------')
    end else with C12ReceiveFaxPtr(FP)^ do begin
      {Exit if we've already shown this status}
      if not First and (Progress <> fpGetPage) then
          Exit;

      case Progress of
        fpWaiting :
          WriteLn('Waiting for call');
        fpAnswer :
          WriteLn('Answering incoming call');
        fpIncoming:
          WriteLn('Incoming call is fax');
        fpGotRemoteID :
          WriteLn('Call from '+GetRemoteID(FP));
        fpSessionParams :
          begin
            GetSessionParams(FP, BPS, Res, ECM);
            Write('Session capabilities: ', BPS, ' bps');
            if Res then
              Write(',  high resolution')
            else
              Write(',  standard resolution');
            if ECM then
              WriteLn(',  ECM')
            else
              WriteLn(',  no ECM');
          end;
        fpGetPage:
          begin
            if FaxClass = ctCas then
              GetPageInfoCas(FP, Pages, Page, Bytes, Total)
            else
              GetPageInfoC12(FP, Pages, Page, Bytes, Total);
            if (FaxClass <> ctCAS) and First then begin
              First := False;
              if Page = 1 then
                WriteLn('Receiving fax file ', GetFaxName(FP));
            end;
            Write(^M'Receiving page ', Page, ' data: ', Bytes);
            ClrEol;
          end;
        fpGetPageResult :
          if GetLastPageStatus(FP) then
            WriteLn('Page accepted')
          else
            WriteLn('Page rejected');
        fpCheckMorePages :
          WriteLn('Checking for more pages');
        fpGetHangup:
          WriteLn('Disconnecting');
        fpGotHangup:
          WriteLn('Waiting for next call');
      end;
    end;
  end;

  procedure MyFaxLog(FP : FaxRecPtr;
                     Number : String;
                     FName : PathStr;
                     Log : TLogFaxCode);
  {$IFDEF UsePModeDLL} Export; {$ENDIF}
  var
    FLog : Text;
    F : File;
  begin
    Assign(FLog, 'SIMPRCV.HIS');
    Append(FLog);
    if IOResult = 2 then
      ReWrite(FLog);
    if IOResult <> 0 then
      Exit;
    case Log of
      lfaxReceiveStart :
        begin
          WriteLn(FLog);
          WriteLn(FLog, TodayString, ' ', NowString,
                        ' -- start fax receive: ', FName,
                        '  from ', GetRemoteID(FP));
        end;
      lfaxReceiveOk :
        WriteLn(FLog, TodayString, ' ', NowString,
                      ' -- end fax receive: ', FName);
      lfaxReceiveSkip :
        WriteLn(FLog, TodayString, ' ', NowString,
                      ' -- fax rejected from ', GetRemoteID(FP));
      lfaxReceiveFail :
        WriteLn(FLog, TodayString, ' ', NowString,
                      ' -- fail fax receive(', GetAsyncStatus, '): ', FName);
    end;
    Close(FLog);
    if IOResult <> 0 then ;
  end;

  function MyAcceptFax(FP : FaxRecPtr; RemoteName : Str20) : Boolean;
  {$IFDEF UsePModeDLL} Export; {$ENDIF}
  begin
    MyAcceptFax := True;

    (*
    {Demo of conditionally refusing faxes. This line refuses a fax if}
    {it comes from the 'SatisFaxtion 300' station}
    MyAcceptFax := RemoteName <> 'SatisFAXtion 300';
    *)
  end;

  procedure ShowHelp;
    {-Display cmd line params options and halt}
  begin
    WriteLn('Usage: SIMPRCV ComPort [options]');
    WriteLn('  /I StationID   Set Station ID');
    WriteLn('  /B Baud        Set port baud rate (4800, 7200, 9600, 19200; default=19200)');
    WriteLn('  /L LowBaud     Set low baud rate for modem init (same as above; default=none)'); {!!.01}
    WriteLn('  /F FaxBPS      Set fax BPS rate (2400, 4800, 7200, 9600, 12000, 14400;');
    WriteLn('                                   default=9600)');
    WriteLn('  /M InitString  Set modem initialization string');
    WriteLn('  /S FaxClass    Set fax class (1, 2, A(uto); default=2');
    WriteLn('  /X             Pick up fax connection already in progress');
    WriteLn('  /?             Display help screen');
    Halt(0);
  end;

  procedure Abend(S : String);
  begin
    WriteLn(S);
    Halt(1);
  end;

  procedure ParseCmdLine;
  var
    S : String;
    I : Integer;
    C : Integer;
    GotC : Boolean;

    function NextS : String;
    begin
      Inc(I);
      NextS := ParamStr(I);
    end;

    function GetDelimited : String;
    var
      S, SPart: String[20];
    begin
      Inc(I);
      S := ParamStr(I);
      if S[1] = '"' then begin
        Delete(S, 1, 1);
        while (S[Length(S)] <> '"') and (I < ParamCount) do begin
          Inc(I);
          SPart := ParamStr(I);
          S := S + ' ' + SPart;
        end;
        Dec(Byte(S[0]));
      end;
      GetDelimited := S;
    end;



  begin
    I := 1;
    GotC := False;
    while I <= ParamCount do begin
      S := ParamStr(I);
      if S[1] = '?' then
        ShowHelp;
      if S[1] in ['/','-'] then begin
        case Upcase(S[2]) of
          'I' :
           StatID := GetDelimited;
          'B' :
            begin
              Val(NextS, BRate, C);
              if C <> 0 then
                BRate := 19200;
            end;
          'L' :                                                        {!!.01}
            begin                                                      {!!.01}
              Val(NextS, CommandBaud, C);                              {!!.01}
              if C <> 0 then                                           {!!.01}
                CommandBaud := 0;                                      {!!.01}
            end;                                                       {!!.01}
          'F' :
            begin
              Val(NextS, FaxBRate, C);
              if C <> 0 then
                FaxBRate := 9600;
              SetFaxBRate := True;
            end;
          'M' :
            MInit := NextS;
          'S' : {set fax class}
            begin
              S := NextS;
              case Upcase(S[1]) of
                '1' : FaxClass := ctClass1;
                '2' : FaxClass := ctClass2;
                'A' : FaxClass := ctDetect;
                'C' : FaxClass := ctCAS;
                else ShowHelp;
              end;
            end;
          'X' :
            ConnectInProg := True;
          'Q' :
            Val(NextS, IrqNum, C);
          else
            ShowHelp;
        end;
      end else begin
        GotC := True;
        case S[1] of
          '1': CName := Com1;
          '2': CName := Com2;
          '3': CName := Com3;
          '4': CName := Com4;
          else ShowHelp;
        end;
      end;
      Inc(I);
    end;

    if not GotC and (FaxClass <> ctCas) then
      ShowHelp;
  end;

  procedure ReceiveFaxClass12;
    {-Receive a fax from a Class 1 or 2 modem}
  var
    Class : Char;
    Model, Chip, Rev : String;
  begin
    {$IFDEF Tracing}
    InitTracing(30000);
    {$ENDIF}

    if IrqNum <> 0 then begin
      SetUart(CName, 0, IrqNum, IrqNum+8);
      if (CName = Com3) or (CName = Com4) then
        PS2DetectMode := PS2Ignore;
    end;

    if ConnectInProg then
      InitPortKeep(P, CName, 8192, 2048)
    else
      InitPort(P, CName, BRate, NoParity, 8, 1, 8192, 2048, DefPortOptions); {!!.01}
    if P = nil then
      AbortMsg('Failed to initialize com port');

    SetAbortFunc(P, MyAbort);
    SetErrorProc(P, MyErrorProc);

    InitC12ReceiveFax(R, StatID, P);
    if R = nil then
      AbortMsg('Failed to initialize fax record');

    SetFaxNameFunc(R, FaxNameCount);
    SetFaxStatusProc(R, MyStatus);
    SetFaxLogProc(R, MyFaxLog);
    SetAcceptFaxFunc(R, MyAcceptFax);
    SetModemInit(R, MInit);
    SetAnswerOnRing(R, 1);

    if CommandBaud <> 0 then                                           {!!.01}
      SetInitBaudRate(R, CommandBaud, 0);                              {!!.01}

    if not ConnectInProg then begin
      {Assure we have a ClassI/II modem}
      WriteLn('Identifying modem...');
      if GetModemInfo(R, Class, Model, Chip, Rev, True) then begin
        if Class = 'B' then                                            {!!.02}
          WriteLn('Highest class: 2.0')                                {!!.02}
        else                                                           {!!.02}
          WriteLn('Highest class: ', Class);
        WriteLn('Chip: ', Chip);
        WriteLn('Model: ', Model);
        WriteLn('Revision: ', Rev);
        WriteLn;
        if Class = '1' then
          FaxClass := ctClass1;
      end else
        AbortMsg('Unable to identify modem');

      {Set desired class}
      FaxClass := SetClassType(R, FaxClass);
      case FaxClass of
        ctClass1 : WriteLn('Fax class is set to Class 1');
        ctClass2 : WriteLn('Fax class is set to Class 2');
        ctCAS    : WriteLn('Fax class is CAS');
        else begin
          WriteLn('Failed to set fax class');
          Exit;
        end;
      end;

      if SetFaxBRate then
        SetModemFeatures(R, FaxBRate, '0');

      {Start receiving faxes}
      WriteLn('Ready to receive, waiting for first fax');
    end else begin
      WriteLn('Connecting to fax call already in progress');
      SetOneFax(R, True);
      if SetClassType(R, ctClass2) <> ctClass2 then ;
      SetConnectState(R);
    end;
    FaxReceiveC12(R);
    case GetAsyncStatus of
      ecOk,
      ecUserAbort       : WriteLn('Fax receive session ended');
      ecFaxVoiceCall    : WriteLn('Incoming voice call');
      ecFaxDataCall     : WriteLn('Incoming data call');
      ecFaxInitError    : WriteLn('Error initializing modem');
      ecFaxTrainError   : WriteLn('Error during training');
      ecFaxSessionError : begin
                            WriteLn('Error during session');
                            WriteLn('Hangup result was ', GetHangupResult(R));
                          end;
      else                WriteLn(StatusStr(GetAsyncStatus));
    end;
    DoneC12ReceiveFax(R);
    DonePort(P);

    {$IFDEF Tracing}
    DumpTraceHex('SIMPRCV.TRC');
    {$ENDIF}
  end;

  procedure ReceiveFaxCAS;
    {-Receive faxes from a CAS faxmodem}
  var
    Rings : Word;
  begin
    {Init fax object}
    InitCasFax(R, StatID);
    if R = nil then
      AbortMsg('Could not initialize CAS fax record, status = ' +
                Long2Str(GetAsyncStatus));

    {Set an abort hook just for CAS}
    SetCASAbortFunc(R, MyAbort);
    SetFaxStatusProc(R, MyStatus);
    SetFaxLogProc(R, MyFaxLog);
    Rings := 1;
    GetSetAutoReceive(R, Rings, 1);

    {Force a DCX extension}
    FaxFileExt := 'DCX';

    FaxReceiveCas(R);
    case GetAsyncStatus of
      ecOk, ecUserAbort :
        WriteLn('Finished with FAX receive');
      ecFileRejected :
        WriteLn('Incoming fax was rejected');
      ecFaxNoConnect :
        WriteLn('Modem reported NO CARRIER');
      else begin
        WriteLn('Error: ', GetAsyncStatus:4);
        WriteLn('Last CAS function (decimal): ', LastCasFunc);
        WriteLn('Last CAS return value (decimal): ', LastCasReturn);
      end;
    end;

    Rings := 0;
    GetSetAutoReceive(R, Rings, 1);
    DoneCasFax(R);
  end;

begin
  WriteLn(CopyrightLine);

  Assign(Output, '');
  Rewrite(Output);

  ParseCmdLine;

  if FaxClass = ctCAS then
    ReceiveFaxCAS
  else
    ReceiveFaxClass12;
end.

