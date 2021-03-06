{$I DEFINES.INC}
UNIT Saver;


INTERFACE


USES ApTimer;


VAR  SaverTimer    : EventTimer;
     SaverActive   : Boolean;
     SaverAdvance  : EventTimer;
     BannerAdvance : EventTimer;
     SaverX        : Word;
     SaverY        : Word;
     SaverCurXY    : Word;
     SaverCurB     : Byte;
     WhichSaver    : Byte;


PROCEDURE CheckSaver;
PROCEDURE KillSaver;


IMPLEMENTATION


USES BsMulti,SaveScrn,Crt,FastW1,Globals,Time,BsString,BsTime,BsKeys,BsVideo;


PROCEDURE KillSaver;
BEGIN
     IF NOT(Mailer2Info.UseBlanker) THEN Exit;
     IF SaverActive THEN
     BEGIN
          RestoreScreen(93);
          FastWrite(_PadRight(_DayOfWeek+' '+_GetPrettyDate,27),Window2+5,23,ShotgunColours.SGMailTimeDateData);
          FastWrite(_PadRight(_GetPrettyTime,8),Window2+5,9,ShotgunColours.SGMailTimeDateData);
          GotoXYAbs(SaverCurXY);
          IF NOT(DialWindowActive) THEN _ShowCursor;
          NewTimerSecs(SaverTimer,Mailer2Info.BlankerTimeout);
          SaverActive := False;
     END
     ELSE
     BEGIN
          NewTimerSecs(SaverTimer,Mailer2Info.BlankerTimeout);
          TimeSlice;
     END;
END;


PROCEDURE CheckSaver;
VAR  Loop : Word;

     PROCEDURE DrawSaver;
     VAR  ForeC   : Byte;
          BackC   : Byte;
          TheAttr : Byte;
     BEGIN
          REPEAT
                BackC := Random(7);
          UNTIL (BackC<>SaverCurB);
          SaverCurB := BackC;
          ForeC := BackC+8;
          TheAttr := (BackC*16)+ForeC;
          SaverX := Random(59)+1;
          SaverY := Random((NumLines-3))+1;
          IF MailerInfo.HandleFaxes THEN
          BEGIN
            CASE WhichSaver OF
            0:   BEGIN
                   FastWrite('旼컴컴컴컴컴컴컴컴컴�',SaverY,SaverX,TheAttr);
                   FastWrite('� SGMail Waiting... �',SaverY+1,SaverX,TheAttr);
                   FastWrite('읕컴컴컴컴컴컴컴컴컴�',SaverY+2,SaverX,TheAttr);
                 END;
            1:   BEGIN
                   IF ThereAreMsgs THEN
                   BEGIN
                     FastWrite('旼컴컴컴컴컴컴컴컴컴�',SaverY,SaverX,TheAttr);
                     FastWrite('� YOU HAVE MAIL.... �',SaverY+1,SaverX,TheAttr);
                     FastWrite('읕컴컴컴컴컴컴컴컴컴�',SaverY+2,SaverX,TheAttr);
                   END
                   ELSE
                   BEGIN
                     FastWrite('旼컴컴컴컴컴컴컴컴컴�',SaverY,SaverX,TheAttr);
                     FastWrite('� No New Mail...... �',SaverY+1,SaverX,TheAttr);
                     FastWrite('읕컴컴컴컴컴컴컴컴컴�',SaverY+2,SaverX,TheAttr);
                   END;
                 END;
            2:   BEGIN
                   IF ThereAreFaxes THEN
                   BEGIN
                     FastWrite('旼컴컴컴컴컴컴컴컴컴�',SaverY,SaverX,TheAttr);
                     FastWrite('� YOU HAVE FAXES... �',SaverY+1,SaverX,TheAttr);
                     FastWrite('읕컴컴컴컴컴컴컴컴컴�',SaverY+2,SaverX,TheAttr);
                   END
                   ELSE
                   BEGIN
                     FastWrite('旼컴컴컴컴컴컴컴컴컴�',SaverY,SaverX,TheAttr);
                     FastWrite('� No New Faxes..... �',SaverY+1,SaverX,TheAttr);
                     FastWrite('읕컴컴컴컴컴컴컴컴컴�',SaverY+2,SaverX,TheAttr);
                   END;
                 END;
            3:   BEGIN
                   FastWrite('旼컴컴컴컴컴컴컴컴컴�',SaverY,SaverX,TheAttr);
                   FastWrite('� Mail Calls: '+_PadRight(_String(LCallers.MailCalls),6)+'�',SaverY+1,SaverX,TheAttr);
                   FastWrite('읕컴컴컴컴컴컴컴컴컴�',SaverY+2,SaverX,TheAttr);
                 END;
            4:   BEGIN
                   FastWrite('旼컴컴컴컴컴컴컴컴컴�',SaverY,SaverX,TheAttr);
                   FastWrite('� BBS Calls: '+_PadRight(_String(LCallers.BBSCalls),7)+'�',SaverY+1,SaverX,TheAttr);
                   FastWrite('읕컴컴컴컴컴컴컴컴컴�',SaverY+2,SaverX,TheAttr);
                 END;
            5:   BEGIN
                   FastWrite('旼컴컴컴컴컴컴컴컴컴�',SaverY,SaverX,TheAttr);
                   FastWrite('� Fax Calls: '+_PadRight(_String(LCallers.FaxCalls),7)+'�',SaverY+1,SaverX,TheAttr);
                   FastWrite('읕컴컴컴컴컴컴컴컴컴�',SaverY+2,SaverX,TheAttr);
                 END;
            END;
            NewTimerSecs(SaverAdvance,5);
            INC(WhichSaver);
            IF WhichSaver=6 THEN WhichSaver := 0;
          END
          ELSE
          BEGIN
            CASE WhichSaver OF
            0:   BEGIN
                   FastWrite('旼컴컴컴컴컴컴컴컴컴�',SaverY,SaverX,TheAttr);
                   FastWrite('� SGMail Waiting... �',SaverY+1,SaverX,TheAttr);
                   FastWrite('읕컴컴컴컴컴컴컴컴컴�',SaverY+2,SaverX,TheAttr);
                 END;
            1:   BEGIN
                   IF ThereAreMsgs THEN
                   BEGIN
                     FastWrite('旼컴컴컴컴컴컴컴컴컴�',SaverY,SaverX,TheAttr);
                     FastWrite('� YOU HAVE MAIL.... �',SaverY+1,SaverX,TheAttr);
                     FastWrite('읕컴컴컴컴컴컴컴컴컴�',SaverY+2,SaverX,TheAttr);
                   END
                   ELSE
                   BEGIN
                     FastWrite('旼컴컴컴컴컴컴컴컴컴�',SaverY,SaverX,TheAttr);
                     FastWrite('� No New Mail...... �',SaverY+1,SaverX,TheAttr);
                     FastWrite('읕컴컴컴컴컴컴컴컴컴�',SaverY+2,SaverX,TheAttr);
                   END;
                 END;
            2:   BEGIN
                   FastWrite('旼컴컴컴컴컴컴컴컴컴�',SaverY,SaverX,TheAttr);
                   FastWrite('� Mail Calls: '+_PadRight(_String(LCallers.MailCalls),6)+'�',SaverY+1,SaverX,TheAttr);
                   FastWrite('읕컴컴컴컴컴컴컴컴컴�',SaverY+2,SaverX,TheAttr);
                 END;
            3:   BEGIN
                   FastWrite('旼컴컴컴컴컴컴컴컴컴�',SaverY,SaverX,TheAttr);
                   FastWrite('� BBS Calls: '+_PadRight(_String(LCallers.BBSCalls),7)+'�',SaverY+1,SaverX,TheAttr);
                   FastWrite('읕컴컴컴컴컴컴컴컴컴�',SaverY+2,SaverX,TheAttr);
                 END;
            END;
            NewTimerSecs(SaverAdvance,5);
            INC(WhichSaver);
            IF WhichSaver=4 THEN WhichSaver := 0;
          END;
     END;

BEGIN
     IF NOT(Mailer2Info.UseBlanker) THEN Exit;
     IF NOT(SaverActive) THEN
     BEGIN
          IF TimerExpired(SaverTimer) THEN
          BEGIN
               WhereXYAbs(SaverCurXY);
               SaveScreen(93);
               _HideCursor;
               TextBackGround(0);
               TextColor(7);
               FOR Loop := 1 TO NumLines DO FastWrite(_PadRight('',80),Loop,1,7);
               DrawSaver;
               SaverActive := True;
          END
          ELSE TimeSlice;
     END
     ELSE
     BEGIN
          IF TimerExpired(SaverAdvance) THEN
          BEGIN
               FastWrite('                     ',SaverY,SaverX,7);
               FastWrite('                     ',SaverY+1,SaverX,7);
               FastWrite('                     ',SaverY+2,SaverX,7);
               DrawSaver;
          END
          ELSE TimeSlice;
     END;
END;


END.
