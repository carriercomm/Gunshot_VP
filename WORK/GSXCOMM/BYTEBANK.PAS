{$I DEFINES.INC}
UNIT ByteBank;


INTERFACE


PROCEDURE DepositBytes;
PROCEDURE WithdrawBytes;


IMPLEMENTATION


USES Screens,KeyInput,Globals,BsLog,BsString,Gfx;


PROCEDURE DepositBytes;
VAR  tttt : longint;
     Code : Integer;
BEGIN
     System_Prompt('',94);
     Get_Enter;
     IF Fields[1].Text<>'' THEN
     BEGIN
          VAL(Fields[1].Text,tttt,code);
          IF (tttt>UserAccess.daily_bytes) THEN
          BEGIN
               System_Prompt(_String(UserAccess.daily_bytes),95);
               Get_Enter;
          END
          ELSE IF ((tttt+UserRecord.ByteBankBalance)>system_info.BBank_Max) THEN
          BEGIN
               System_Prompt(_String(system_info.BBank_Max),96);
               Get_Enter;
          END
          ELSE
          BEGIN
               bsWriteLog('Using the byte bank - Deposit of '+_String(tttt)+' bytes',True);
               DEC(UserRecord.DLBytesRemaining,tttt);
               INC(UserRecord.ByteBankBalance,tttt);
          END;
     END;
END;


PROCEDURE WithdrawBytes;
VAR  tttt : longint;
     Code : Integer;
BEGIN
     System_Prompt('',97);
     Get_Enter;
     IF Fields[1].Text<>'' THEN
     BEGIN
          VAL(Fields[1].Text,tttt,code);
          IF (tttt>UserRecord.ByteBankBalance) THEN
          BEGIN
               System_Prompt(_String(UserRecord.ByteBankBalance),98);
               Get_Enter;
          END
          ELSE IF ((tttt+UserRecord.ByteBankWithdrawls)>system_info.BBank_Trans) THEN
          BEGIN
               System_Prompt(_String(UserRecord.ByteBankWithdrawls),99);
               Get_Enter;
          END
          ELSE
          BEGIN
               bsWriteLog('Using the byte bank - Withdrawl of '+_String(tttt)+' bytes',True);
               INC(UserRecord.DLBytesRemaining,tttt);
               DEC(UserRecord.ByteBankBalance,tttt);
               INC(UserRecord.ByteBankWithdrawls,tttt);
          END;
     END;
END;


END.