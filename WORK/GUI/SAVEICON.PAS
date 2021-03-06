{$I DEFINES.INC}
UNIT SaveIcon;


INTERFACE


PROCEDURE SaveToBank(InString: String);


IMPLEMENTATION


USES Gr2_Bp,Globals,_Win,BHandler,_Icons,_Text,Gx2_BpVC,Gx2_Bp,Shotgun;


PROCEDURE SaveToBank(InString: String);
VAR  XX,YY         : Word;
     LoopX         : Word;
     LoopY         : Word;
     Counter       : Word;
     Action        : Word;
     Work_Icon30_3 : _Icon30x30;
     Work_Icon16_3 : _Icon16x16;
     AllDone       : Boolean;
BEGIN
     GrDisplayMouse(GrHide);
     NButtons := 0;
     DrawWindow(50,20,530,415,'SAVE ICON TO BANK - '+InString,LoadIconWindow);
     SystemButton(420,365,520,405,1,False,True);
     SystemIcon(424,369,64);
     OutTextXY(460,379,0,255,1,'Cancel');
     XX      := 60;
     YY      := 55;
     Counter := 0;
     CASE CurrentSize OF
     16:  BEGIN
               ASSIGN(FIcon16,ICONDir+InString);
               RESET(FIcon16);
          END;
     30:  BEGIN
               ASSIGN(FIcon30,ICONDir+InString);
               RESET(FIcon30);
          END;
     END;
     AllDone := False;
     REPEAT
           CASE CurrentSize OF
           16:  READ(FIcon16,Work_Icon16_3);
           30:  READ(FIcon30,Work_Icon30_3);
           END;
           INC(Counter);
           SystemButton(XX,YY,XX+35,YY+35,1,False,True);
           CASE CurrentSize OF
           16:  BEGIN
                     gxDisplayVirtual(xx+3,yy+3,xx+18,yy+18,0,IconHdr,0,0);
                     grSetActiveVirtual(IconHdr);
                     grSetVirtual(gxTrue);
                     WITH Work_Icon16_3 DO
                     BEGIN
                      FOR LoopX := 0 TO 15 DO
                       FOR loopY := 0 TO 15 DO
                        IF Matrix[loopX+1,loopY+1]<>255 THEN
                         GrPutPixel(loopX,loopY,Matrix[loopX+1,loopY+1]);
                     END;
                     grSetVirtual(gxFalse);
                     gxVirtualDisplay(IconHdr,0,0,xx+3,yy+3,xx+18,yy+18,0);
                END;
           30:  BEGIN
                     gxDisplayVirtual(xx+3,yy+3,xx+32,yy+32,0,IconHdr,0,0);
                     grSetActiveVirtual(IconHdr);
                     grSetVirtual(gxTrue);
                     WITH Work_Icon30_3 DO
                     BEGIN
                      FOR LoopX := 0 TO 29 DO
                       FOR loopY := 0 TO 29 DO
                        IF Matrix[loopX+1,loopY+1]<>255 THEN
                         GrPutPixel(loopX,loopY,Matrix[loopX+1,loopY+1]);
                     END;
                     grSetVirtual(gxFalse);
                     gxVirtualDisplay(IconHdr,0,0,xx+3,yy+3,xx+32,yy+32,0);
                END;
           END;
           INC(XX,35);
           IF counter=10 THEN
           BEGIN
                Counter := 0;
                INC(YY,35);
                XX := 60;
           END;
           CASE CurrentSize OF
           16:  IF EOF(FIcon16) THEN AllDone := True;
           30:  IF EOF(FIcon30) THEN AllDone := True;
           END;
     UNTIL AllDone;
     CASE CurrentSize OF
     16:  CLOSE(FIcon16);
     30:  CLOSE(FIcon30);
     END;
     GrDisplayMouse(GrShow);
     REPEAT
           Action := MouseHandler(False);
     UNTIL Action<>0;
     KillWindow;
     IF Action<>1 THEN
     BEGIN
          DEC(Action);
          CASE CurrentSize OF
          16:  BEGIN
                    ASSIGN(FIcon16,ICONDir+InString);
                    RESET(FIcon16);
                    SEEK(FIcon16,Action-1);
                    WRITE(FIcon16,Work_Icon16);
                    CLOSE(FIcon16);
               END;
          30:  BEGIN
                    ASSIGN(FIcon30,ICONDir+InString);
                    RESET(FIcon30);
                    SEEK(FIcon30,Action-1);
                    WRITE(FIcon30,Work_Icon30);
                    CLOSE(FIcon30);
               END;
          END;
     END;
END;


END.
