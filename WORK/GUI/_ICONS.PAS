{$I DEFINES.INC}
UNIT _Icons;


INTERFACE


PROCEDURE SystemIcon(x,y,num: Word);
PROCEDURE DrawIcon(x,y,num,size,effect: Word; FName: String);


IMPLEMENTATION


USES Globals,Gx2_Bp,Gx2_BpVC,Gr2_Bp,Fx2_Bp,BsString;


{==========================================================================}
{                                                                          }
{         PLACES AN ICON ON THE SCREEN FOR THE TERMINAL'S SYSTEM           }
{                                                                          }
{==========================================================================}
PROCEDURE SystemIcon(x,y,num: Word);
VAR  LoopX  : Word;
     LoopY  : Word;
     GLib   : GxLib;
BEGIN
     IF ((Num<2) OR (Num>100)) THEN Exit;
     gxOpenLib(gxGXL,GraphicsLibrary,GLib,Nil,0);
     gxLibBuffer(GLib,_String(Num)+'.ICO',0,900,@Icon30);
     gxCloseLib(GLib);
     gxDisplayVirtual(x,y,x+29,y+29,0,IconHdr,0,0);
     grSetActiveVirtual(IconHdr);
     grSetVirtual(gxTrue);
     WITH Icon30 DO
     BEGIN
      FOR LoopX := 0 TO 29 DO
       FOR loopY := 0 TO 29 DO
        IF Matrix[loopX+1,loopY+1]<>255 THEN
         GrPutPixel(loopX,loopY,Matrix[loopX+1,loopY+1]);
     END;
     grSetVirtual(gxFalse);
     gxVirtualDisplay(IconHdr,0,0,x,y,x+29,y+29,0);
END;
{==========================================================================}
{                                                                          }
{         PLACES AN ICON ON THE SCREEN                                     }
{                                                                          }
{==========================================================================}
PROCEDURE DrawIcon(x,y,num,size,effect: Word; FName: String);
VAR  LoopX   : Word;
     LoopY   : Word;
     BB      : Byte;

     PROCEDURE DrawIconWithEffect(x1,y1,x2,y2: Word);
     BEGIN
          fxSetGrain(1,1,1);
          CASE Effect OF
          1:   BEGIN {Blind - Horiz}
                    fxSetDelay(15);
                    fxSetEffect(fxBLIND);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxHORIZ);
               END;
          2:   BEGIN {Blind - Verti}
                    fxSetDelay(15);
                    fxSetEffect(fxBLIND);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxVERT);
               END;
          3:   BEGIN {Crush - Horiz}
                    fxSetDelay(15);
                    fxSetEffect(fxCRUSH);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxHORIZ);
               END;
          4:   BEGIN {Crush - Verti}
                    fxSetDelay(15);
                    fxSetEffect(fxCRUSH);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxVERT);
               END;
          5:   BEGIN {Diagonal - Up/Right}
                    fxSetDelay(5);
                    fxSetEffect(fxDIAGONAL);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxUP+fxRIGHT);
               END;
          6:   BEGIN {Diagonal - Dn/Right}
                    fxSetDelay(5);
                    fxSetEffect(fxDIAGONAL);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxDOWN+fxRIGHT);
               END;
          7:   BEGIN {Diagonal - Up/Left}
                    fxSetDelay(5);
                    fxSetEffect(fxDIAGONAL);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxUP+fxLEFT);
               END;
          8:   BEGIN {Diagonal - Dn/Left}
                    fxSetDelay(5);
                    fxSetEffect(fxDIAGONAL);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxDOWN+fxLEFT);
               END;
          9:   BEGIN {Drip - Up}
                    fxSetDelay(2);
                    fxSetEffect(fxDRIP);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxUP);
               END;
          10:  BEGIN {Drip - Down}
                    fxSetDelay(2);
                    fxSetEffect(fxDRIP);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxDOWN);
               END;
          11:  BEGIN {Explode - In}
                    fxSetDelay(10);
                    fxSetEffect(fxEXPLODE);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxIN);
               END;
          12:  BEGIN {Explode - Out}
                    fxSetDelay(10);
                    fxSetEffect(fxEXPLODE);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxOUT);
               END;
          13:  BEGIN {Interleave - Horiz}
                    fxSetDelay(1);
                    fxSetEffect(fxINTERLEAVE);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxHORIZ);
               END;
          14:  BEGIN {Interleave - Verti}
                    fxSetDelay(1);
                    fxSetEffect(fxINTERLEAVE);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxVERT);
               END;
          15:  BEGIN {Random}
                    fxSetDelay(1);
                    fxSetEffect(fxRANDOM);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxNONE);
               END;
          16:  BEGIN {Sand - Up}
                    fxSetDelay(2);
                    fxSetEffect(fxSAND);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxUP);
               END;
          17:  BEGIN {Sand - Down}
                    fxSetDelay(2);
                    fxSetEffect(fxSAND);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxDOWN);
               END;
          18:  BEGIN {Slide - Up}
                    fxSetDelay(5);
                    fxSetEffect(fxSLIDE);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxUP);
               END;
          19:  BEGIN {Slide - Down}
                    fxSetDelay(5);
                    fxSetEffect(fxSLIDE);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxDOWN);
               END;
          20:  BEGIN {Slide - Left}
                    fxSetDelay(5);
                    fxSetEffect(fxSLIDE);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxLEFT);
               END;
          21:  BEGIN {Slide - Right}
                    fxSetDelay(5);
                    fxSetEffect(fxSLIDE);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxRIGHT);
               END;
          22:  BEGIN {Slide Blind - Horiz}
                    fxSetDelay(1);
                    fxSetEffect(fxSLIDEBLIND);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxHORIZ);
               END;
          23:  BEGIN {Slide Blind - Verti}
                    fxSetDelay(1);
                    fxSetEffect(fxSLIDEBLIND);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxVERT);
               END;
          24:  BEGIN {Slide Weave - Horiz}
                    fxSetDelay(1);
                    fxSetEffect(fxSLIDEWEAVE);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxHORIZ);
               END;
          25:  BEGIN {Slide Weave - Verti}
                    fxSetDelay(1);
                    fxSetEffect(fxSLIDEWEAVE);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxVERT);
               END;
          26:  BEGIN {Spiral - In}
                    fxSetDelay(1);
                    fxSetEffect(fxSPIRAL);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxIN);
               END;
          27:  BEGIN {Spiral - Out}
                    fxSetDelay(1);
                    fxSetEffect(fxSPIRAL);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxOUT);
               END;
          28:  BEGIN {Split - Horiz}
                    fxSetDelay(10);
                    fxSetEffect(fxSPLIT);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxHORIZ);
               END;
          29:  BEGIN {Split - Verti}
                    fxSetDelay(10);
                    fxSetEffect(fxSPLIT);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxVERT);
               END;
          30:  BEGIN {Weave - Horiz}
                    fxSetDelay(10);
                    fxSetEffect(fxWEAVE);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxHORIZ);
               END;
          31:  BEGIN {Weave - Verti}
                    fxSetDelay(10);
                    fxSetEffect(fxWEAVE);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxVERT);
               END;
          32:  BEGIN {Wipe - Up}
                    fxSetDelay(5);
                    fxSetEffect(fxWIPE);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxUP);
               END;
          33:  BEGIN {Wipe - Down}
                    fxSetDelay(5);
                    fxSetEffect(fxWIPE);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxDOWN);
               END;
          34:  BEGIN {Wipe - Left}
                    fxSetDelay(5);
                    fxSetEffect(fxWIPE);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxLEFT);
               END;
          35:  BEGIN {Wipe - Right}
                    fxSetDelay(5);
                    fxSetEffect(fxWIPE);
                    fxVirtualDisplay(IconHdr,0,0,x1,y1,x2,y2,fxRIGHT);
               END;
          END;
     END;

BEGIN
     CASE Size OF
     16:  BEGIN
               ASSIGN(FIcon16,ICONDir+FName);
               {$I-}RESET(FIcon16);{$I+}
               IF IOResult=0 THEN
               BEGIN
                    SEEK(FIcon16,Num-1);
                    READ(FIcon16,Icon16);
                    CLOSE(FIcon16);
                    gxDisplayVirtual(x,y,x+15,y+15,0,IconHdr,0,0);
                    grSetActiveVirtual(IconHdr);
                    grSetVirtual(gxTrue);
                    WITH Icon16 DO
                    BEGIN
                     FOR LoopX := 0 TO 15 DO
                      FOR loopY := 0 TO 15 DO
                       IF Matrix[loopX+1,loopY+1]<>255 THEN
                        GrPutPixel(loopX,loopY,Matrix[loopX+1,loopY+1]);
                    END;
                    grSetVirtual(gxFalse);
                    IF Effect=0 THEN gxVirtualDisplay(IconHdr,0,0,x,y,x+15,y+15,0)
                                ELSE DrawIconWithEffect(x,y,x+15,y+15);
               END;
          END;
     30:  BEGIN
               ASSIGN(FIcon30,ICONDir+FName);
               {$I-}RESET(FIcon30);{$I+}
               IF IOResult=0 THEN
               BEGIN
                    SEEK(FIcon30,Num-1);
                    READ(FIcon30,Icon30);
                    CLOSE(FIcon30);
                    gxDisplayVirtual(x,y,x+29,y+29,0,IconHdr,0,0);
                    grSetActiveVirtual(IconHdr);
                    grSetVirtual(gxTrue);
                    WITH Icon30 DO
                    BEGIN
                     FOR LoopX := 0 TO 29 DO
                      FOR loopY := 0 TO 29 DO
                       IF Matrix[loopX+1,loopY+1]<>255 THEN
                        GrPutPixel(loopX,loopY,Matrix[loopX+1,loopY+1]);
                    END;
                    grSetVirtual(gxFalse);
                    IF Effect=0 THEN gxVirtualDisplay(IconHdr,0,0,x,y,x+29,y+29,0)
                                ELSE DrawIconWithEffect(x,y,x+29,y+29);
               END;
          END;
     END;
END;


END.
