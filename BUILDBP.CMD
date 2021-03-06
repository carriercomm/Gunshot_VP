@ECHO OFF

Z:

ECHO CLEAING UP OUTPUT DIRECTORY
DEL /Q Z:\PROGRAMMING\GUNSHOT\EXE\BP\*.*

ECHO COPYING BPC.CFG TO BP DIRECTORY
COPY Z:\PROGRAMMING\GUNSHOT\BPC.CFG Z:\BP\BIN

ECHO.
ECHO COMPILING GCOMPILE.PAS
CD Z:\PROGRAMMING\GUNSHOT\WORK\BIN
Z:\BP\BIN\BPC.EXE GCOMPILE.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

REM REQUIRES GENUS
REM ECHO.
REM ECHO COMPILING GSCALE.PAS
REM CD Z:\PROGRAMMING\GUNSHOT\WORK\BIN
REM Z:\BP\BIN\BPC.EXE GSCALE.PAS
REM IF NOT %ERRORLEVEL% == 0 GOTO END

REM REQUIRES GENUS
REM ECHO.
REM ECHO COMPILING PLAYFLI.PAS
REM CD Z:\PROGRAMMING\GUNSHOT\WORK\BIN
REM Z:\BP\BIN\BPC.EXE PLAYFLI.PAS
REM IF NOT %ERRORLEVEL% == 0 GOTO END

REM REQUIRES GENUS
REM ECHO.
REM ECHO COMPILING PLAYVOC.PAS
REM CD Z:\PROGRAMMING\GUNSHOT\WORK\BIN
REM Z:\BP\BIN\BPC.EXE PLAYVOC.PAS
REM IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING GIP.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\GIP
Z:\BP\BIN\BPC.EXE GIP.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING PAKGIP.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\GIP
Z:\BP\BIN\BPC.EXE PAKGIP.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING UNPAKGIP.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\GIP
Z:\BP\BIN\BPC.EXE UNPAKGIP.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING GSCONFIG.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\GSCONFIG
Z:\BP\BIN\BPC.EXE GSCONFIG.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING GSECHO.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\GSECHO
Z:\BP\BIN\BPC.EXE GSECHO.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING GSEDIT.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\GSEDIT
Z:\BP\BIN\BPC.EXE GSEDIT.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING GSFAXP.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\GSFAX
Z:\BP\BIN\BPC.EXE GSFAXP.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING GSFAXV.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\GSFAX
Z:\BP\BIN\BPC.EXE GSFAXV.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING GSFILE.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\GSFILE
Z:\BP\BIN\BPC.EXE GSFILE.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING GSLIST.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\GSLIST
Z:\BP\BIN\BPC.EXE GSLIST.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

REM REETODO NEEDS WORK, AND PROBABLY NOT NECESSARY ANYWAY SO SKIPPING FOR NOW
REM ECHO.
REM ECHO COMPILING GSMAIL.EXE
REM CD Z:\PROGRAMMING\GUNSHOT\WORK\GSMAIL
REM Z:\BP\BIN\BPC.EXE GSMAIL.PAS
REM IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING GSPACK.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\GSPACK
Z:\BP\BIN\BPC.EXE GSPACK.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

REM REQUIRES GENUS
REM ECHO.
REM ECHO COMPILING GST.EXE
REM CD Z:\PROGRAMMING\GUNSHOT\WORK\GST
REM Z:\BP\BIN\BPC.EXE GST.PAS
REM IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING GSXCOMM.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\GSXCOMM
Z:\BP\BIN\BPC.EXE GSXCOMM.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

REM REQUIRES GENUS
REM ECHO.
REM ECHO COMPILING GSXLOCAL.EXE
REM CD Z:\PROGRAMMING\GUNSHOT\WORK\GSXLOCAL
REM Z:\BP\BIN\BPC.EXE GSXLOCAL.PAS
REM IF NOT %ERRORLEVEL% == 0 GOTO END

REM REQUIRES GENUS
REM ECHO.
REM ECHO COMPILING GUI.EXE
REM CD Z:\PROGRAMMING\GUNSHOT\WORK\GUI
REM Z:\BP\BIN\BPC.EXE GUI.PAS
REM IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING GS.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\GUNSHOT
Z:\BP\BIN\BPC.EXE GS.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING DODIFF.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\NLC
Z:\BP\BIN\BPC.EXE DODIFF.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING NLC.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\NLC
Z:\BP\BIN\BPC.EXE NLC.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING ANSIVIEW.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\UTILS
Z:\BP\BIN\BPC.EXE ANSIVIEW.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING GLAUNCH.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\UTILS
Z:\BP\BIN\BPC.EXE GLAUNCH.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING LINEMON.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\UTILS
Z:\BP\BIN\BPC.EXE LINEMON.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING NODEMSG.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\UTILS
Z:\BP\BIN\BPC.EXE NODEMSG.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING README.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\UTILS
Z:\BP\BIN\BPC.EXE README.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING RIPVIEW.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\UTILS
Z:\BP\BIN\BPC.EXE RIPVIEW.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING ROBOT.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\UTILS
Z:\BP\BIN\BPC.EXE ROBOT.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING GS2GED.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\UTILS
Z:\BP\BIN\BPC.EXE GS2GED.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

ECHO.
ECHO COMPILING GS2TED.EXE
CD Z:\PROGRAMMING\GUNSHOT\WORK\UTILS
Z:\BP\BIN\BPC.EXE GS2TED.PAS
IF NOT %ERRORLEVEL% == 0 GOTO END

REM REQUIRES GENUS
REM ECHO.
REM ECHO COMPILING GSVIEW.EXE
REM CD Z:\PROGRAMMING\GUNSHOT\WORK\UTILS
REM Z:\BP\BIN\BPC.EXE GSVIEW.PAS
REM IF NOT %ERRORLEVEL% == 0 GOTO END

REM REQUIRES GENUS
REM ECHO.
REM ECHO COMPILING YAPP16.EXE
REM CD Z:\PROGRAMMING\GUNSHOT\WORK\YAPP
REM Z:\BP\BIN\BPC.EXE YAPP16.PAS
REM IF NOT %ERRORLEVEL% == 0 GOTO END

:COPY
ECHO.
ECHO BUILD COMPLETE!  HIT A KEY TO COPY EXE FILES OR CTRL-C TO SKIP
PAUSE

CD Z:\PROGRAMMING\GUNSHOT
CALL COPYEXEBP
GOTO END

:END
PAUSE