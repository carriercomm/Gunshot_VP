{$I DEFINES.INC}
UNIT DefPal;


INTERFACE


PROCEDURE SetDefaultPalette;


IMPLEMENTATION


USES Gx2_BpVC,Gx2_Bp,Globals;


PROCEDURE SetDefaultPalette;
VAR  Error    : Integer;
     Ct       : Word;
BEGIN
     Error := gxGetConvertPalette(GxPAL5,@P256);
     Ct    := 0;
     {Basic Palette}
     P256[Ct] := 0;  INC(ct);  P256[Ct] := 0;  INC(ct);  P256[Ct] := 0;  INC(ct);
     P256[Ct] := 0;  INC(ct);  P256[Ct] := 0;  INC(ct);  P256[Ct] := 42; INC(ct);
     P256[Ct] := 0;  INC(ct);  P256[Ct] := 42; INC(ct);  P256[Ct] := 0;  INC(ct);
     P256[Ct] := 0;  INC(ct);  P256[Ct] := 42; INC(ct);  P256[Ct] := 42; INC(ct);
     P256[Ct] := 42; INC(ct);  P256[Ct] := 0;  INC(ct);  P256[Ct] := 0;  INC(ct);
     P256[Ct] := 42; INC(ct);  P256[Ct] := 0;  INC(ct);  P256[Ct] := 42; INC(ct);
     P256[Ct] := 42; INC(ct);  P256[Ct] := 21; INC(ct);  P256[Ct] := 0;  INC(ct);
     P256[Ct] := 42; INC(ct);  P256[Ct] := 42; INC(ct);  P256[Ct] := 42; INC(ct);
     P256[Ct] := 21; INC(ct);  P256[Ct] := 21; INC(ct);  P256[Ct] := 21; INC(ct);
     P256[Ct] := 21; INC(ct);  P256[Ct] := 21; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 21; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 21; INC(ct);
     P256[Ct] := 21; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 21; INC(ct);  P256[Ct] := 21; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 21; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 21; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 63; INC(ct);
     {Purple}
     P256[Ct] := 15; INC(ct);  P256[Ct] := 3;  INC(ct);  P256[Ct] := 12; INC(ct);
     P256[Ct] := 18; INC(ct);  P256[Ct] := 6;  INC(ct);  P256[Ct] := 15; INC(ct);
     P256[Ct] := 21; INC(ct);  P256[Ct] := 9;  INC(ct);  P256[Ct] := 18; INC(ct);
     P256[Ct] := 24; INC(ct);  P256[Ct] := 12; INC(ct);  P256[Ct] := 21; INC(ct);
     P256[Ct] := 28; INC(ct);  P256[Ct] := 16; INC(ct);  P256[Ct] := 25; INC(ct);
     P256[Ct] := 32; INC(ct);  P256[Ct] := 20; INC(ct);  P256[Ct] := 29; INC(ct);
     P256[Ct] := 36; INC(ct);  P256[Ct] := 24; INC(ct);  P256[Ct] := 33; INC(ct);
     P256[Ct] := 40; INC(ct);  P256[Ct] := 28; INC(ct);  P256[Ct] := 37; INC(ct);
     P256[Ct] := 44; INC(ct);  P256[Ct] := 32; INC(ct);  P256[Ct] := 41; INC(ct);
     P256[Ct] := 48; INC(ct);  P256[Ct] := 36; INC(ct);  P256[Ct] := 45; INC(ct);
     P256[Ct] := 52; INC(ct);  P256[Ct] := 40; INC(ct);  P256[Ct] := 49; INC(ct);
     P256[Ct] := 56; INC(ct);  P256[Ct] := 44; INC(ct);  P256[Ct] := 53; INC(ct);
     P256[Ct] := 58; INC(ct);  P256[Ct] := 46; INC(ct);  P256[Ct] := 55; INC(ct);
     P256[Ct] := 60; INC(ct);  P256[Ct] := 48; INC(ct);  P256[Ct] := 57; INC(ct);
     P256[Ct] := 62; INC(ct);  P256[Ct] := 50; INC(ct);  P256[Ct] := 59; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 54; INC(ct);  P256[Ct] := 60; INC(ct);
     {Blues}
     P256[Ct] := 0; INC(ct);  P256[Ct] := 0;  INC(ct);  P256[Ct] := 18; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 0;  INC(ct);  P256[Ct] := 23; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 0;  INC(ct);  P256[Ct] := 28; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 0;  INC(ct);  P256[Ct] := 33; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 0;  INC(ct);  P256[Ct] := 38; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 0;  INC(ct);  P256[Ct] := 43; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 0;  INC(ct);  P256[Ct] := 48; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 0;  INC(ct);  P256[Ct] := 53; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 0;  INC(ct);  P256[Ct] := 58; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 0;  INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 8;  INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 15; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 20; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 25; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 30; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 35; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 40; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 45; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 50; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 55; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 60; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 63; INC(ct);
     {Dusty Blues}
     P256[Ct] := 7;  INC(ct);  P256[Ct] := 10; INC(ct);  P256[Ct] := 31; INC(ct);
     P256[Ct] := 12; INC(ct);  P256[Ct] := 15; INC(ct);  P256[Ct] := 41; INC(ct);
     P256[Ct] := 17; INC(ct);  P256[Ct] := 20; INC(ct);  P256[Ct] := 41; INC(ct);
     P256[Ct] := 22; INC(ct);  P256[Ct] := 25; INC(ct);  P256[Ct] := 46; INC(ct);
     P256[Ct] := 27; INC(ct);  P256[Ct] := 30; INC(ct);  P256[Ct] := 51; INC(ct);
     P256[Ct] := 32; INC(ct);  P256[Ct] := 35; INC(ct);  P256[Ct] := 56; INC(ct);
     P256[Ct] := 37; INC(ct);  P256[Ct] := 40; INC(ct);  P256[Ct] := 61; INC(ct);
     P256[Ct] := 41; INC(ct);  P256[Ct] := 48; INC(ct);  P256[Ct] := 63; INC(ct);

     P256[Ct] := 15; INC(ct);  P256[Ct] := 0; INC(ct);  P256[Ct] := 30; INC(ct);
     P256[Ct] := 20; INC(ct);  P256[Ct] := 0; INC(ct);  P256[Ct] := 35; INC(ct);
     P256[Ct] := 25; INC(ct);  P256[Ct] := 0; INC(ct);  P256[Ct] := 40; INC(ct);
     P256[Ct] := 30; INC(ct);  P256[Ct] := 0; INC(ct);  P256[Ct] := 45; INC(ct);
     P256[Ct] := 35; INC(ct);  P256[Ct] := 0; INC(ct);  P256[Ct] := 50; INC(ct);
     P256[Ct] := 45; INC(ct);  P256[Ct] := 0; INC(ct);  P256[Ct] := 60; INC(ct);
     P256[Ct] := 50; INC(ct);  P256[Ct] := 0; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 55; INC(ct);  P256[Ct] := 25; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 58; INC(ct);  P256[Ct] := 31; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 35; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 40; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 45; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 50; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 55; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 60; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 18; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 5; INC(ct);  P256[Ct] := 22; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 10; INC(ct);  P256[Ct] := 27; INC(ct);  P256[Ct] := 5; INC(ct);
     P256[Ct] := 15; INC(ct);  P256[Ct] := 32; INC(ct);  P256[Ct] := 10; INC(ct);
     P256[Ct] := 20; INC(ct);  P256[Ct] := 37; INC(ct);  P256[Ct] := 15; INC(ct);
     P256[Ct] := 25; INC(ct);  P256[Ct] := 42; INC(ct);  P256[Ct] := 20; INC(ct);
     P256[Ct] := 30; INC(ct);  P256[Ct] := 47; INC(ct);  P256[Ct] := 25; INC(ct);
     P256[Ct] := 35; INC(ct);  P256[Ct] := 52; INC(ct);  P256[Ct] := 30; INC(ct);
     P256[Ct] := 40; INC(ct);  P256[Ct] := 57; INC(ct);  P256[Ct] := 35; INC(ct);
     P256[Ct] := 45; INC(ct);  P256[Ct] := 62; INC(ct);  P256[Ct] := 40; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 20; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 25; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 30; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 35; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 40; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 45; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 50; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 55; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 60; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 5; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 26; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 34; INC(ct);
     P256[Ct] := 18; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 43; INC(ct);
     P256[Ct] := 40; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 48; INC(ct);
     P256[Ct] := 52; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 54; INC(ct);
     P256[Ct] := 58; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 55; INC(ct);
     P256[Ct] := 20; INC(ct);  P256[Ct] := 0; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 25; INC(ct);  P256[Ct] := 0; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 30; INC(ct);  P256[Ct] := 0; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 34; INC(ct);  P256[Ct] := 0; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 38; INC(ct);  P256[Ct] := 0; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 42; INC(ct);  P256[Ct] := 0; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 46; INC(ct);  P256[Ct] := 0; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 50; INC(ct);  P256[Ct] := 0; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 54; INC(ct);  P256[Ct] := 0; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 58; INC(ct);  P256[Ct] := 0; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 62; INC(ct);  P256[Ct] := 0; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 22; INC(ct);  P256[Ct] := 22; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 32; INC(ct);  P256[Ct] := 32; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 35; INC(ct);  P256[Ct] := 35; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 43; INC(ct);  P256[Ct] := 43; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 45; INC(ct);  P256[Ct] := 45; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 52; INC(ct);  P256[Ct] := 52; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 57; INC(ct);  P256[Ct] := 57; INC(ct);
     P256[Ct] := 20; INC(ct);  P256[Ct] := 9; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 25; INC(ct);  P256[Ct] := 14; INC(ct);  P256[Ct] := 5; INC(ct);
     P256[Ct] := 30; INC(ct);  P256[Ct] := 19; INC(ct);  P256[Ct] := 10; INC(ct);
     P256[Ct] := 35; INC(ct);  P256[Ct] := 24; INC(ct);  P256[Ct] := 15; INC(ct);
     P256[Ct] := 40; INC(ct);  P256[Ct] := 29; INC(ct);  P256[Ct] := 20; INC(ct);
     P256[Ct] := 45; INC(ct);  P256[Ct] := 34; INC(ct);  P256[Ct] := 25; INC(ct);
     P256[Ct] := 50; INC(ct);  P256[Ct] := 39; INC(ct);  P256[Ct] := 30; INC(ct);
     P256[Ct] := 55; INC(ct);  P256[Ct] := 44; INC(ct);  P256[Ct] := 35; INC(ct);
     P256[Ct] := 60; INC(ct);  P256[Ct] := 49; INC(ct);  P256[Ct] := 40; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 52; INC(ct);  P256[Ct] := 43; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 55; INC(ct);  P256[Ct] := 48; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 57; INC(ct);  P256[Ct] := 50; INC(ct);
     P256[Ct] := 29; INC(ct);  P256[Ct] := 12; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 37; INC(ct);  P256[Ct] := 16; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 41; INC(ct);  P256[Ct] := 18; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 48; INC(ct);  P256[Ct] := 18; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 53; INC(ct);  P256[Ct] := 18; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 56; INC(ct);  P256[Ct] := 21; INC(ct);  P256[Ct] := 3; INC(ct);
     P256[Ct] := 59; INC(ct);  P256[Ct] := 24; INC(ct);  P256[Ct] := 6; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 28; INC(ct);  P256[Ct] := 10; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 32; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 38; INC(ct);  P256[Ct] := 10; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 43; INC(ct);  P256[Ct] := 10; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 49; INC(ct);  P256[Ct] := 18; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 52; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 54; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 56; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 58; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 60; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 0; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 10; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 20; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 30; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 40; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 50; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 15; INC(ct);  P256[Ct] := 15; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 20; INC(ct);  P256[Ct] := 20; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 25; INC(ct);  P256[Ct] := 25; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 30; INC(ct);  P256[Ct] := 30; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 35; INC(ct);  P256[Ct] := 35; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 40; INC(ct);  P256[Ct] := 40; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 45; INC(ct);  P256[Ct] := 45; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 50; INC(ct);  P256[Ct] := 50; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 55; INC(ct);  P256[Ct] := 55; INC(ct);
     P256[Ct] := 0; INC(ct);  P256[Ct] := 60; INC(ct);  P256[Ct] := 60; INC(ct);
     P256[Ct] := 30; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 41; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 50; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 52; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 63; INC(ct);
     P256[Ct] := 40; INC(ct);  P256[Ct] := 0; INC(ct);  P256[Ct] := 25; INC(ct);
     P256[Ct] := 43; INC(ct);  P256[Ct] := 0; INC(ct);  P256[Ct] := 27; INC(ct);
     P256[Ct] := 46; INC(ct);  P256[Ct] := 1; INC(ct);  P256[Ct] := 29; INC(ct);
     P256[Ct] := 53; INC(ct);  P256[Ct] := 2; INC(ct);  P256[Ct] := 34; INC(ct);
     P256[Ct] := 59; INC(ct);  P256[Ct] := 8; INC(ct);  P256[Ct] := 36; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 12; INC(ct);  P256[Ct] := 40; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 20; INC(ct);  P256[Ct] := 41; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 25; INC(ct);  P256[Ct] := 44; INC(ct);
     P256[Ct] := 62; INC(ct);  P256[Ct] := 31; INC(ct);  P256[Ct] := 47; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 35; INC(ct);  P256[Ct] := 49; INC(ct);
     P256[Ct] := 62; INC(ct);  P256[Ct] := 44; INC(ct);  P256[Ct] := 56; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 49; INC(ct);  P256[Ct] := 60; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 10; INC(ct);  P256[Ct] := 10; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 15; INC(ct);  P256[Ct] := 15; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 20; INC(ct);  P256[Ct] := 20; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 25; INC(ct);  P256[Ct] := 25; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 30; INC(ct);  P256[Ct] := 30; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 35; INC(ct);  P256[Ct] := 35; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 40; INC(ct);  P256[Ct] := 40; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 45; INC(ct);  P256[Ct] := 45; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 50; INC(ct);  P256[Ct] := 50; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 55; INC(ct);  P256[Ct] := 55; INC(ct);
     P256[Ct] := 20; INC(ct);  P256[Ct] := 20; INC(ct);  P256[Ct] := 0;  INC(ct);
     P256[Ct] := 25; INC(ct);  P256[Ct] := 25; INC(ct);  P256[Ct] := 0;  INC(ct);
     P256[Ct] := 30; INC(ct);  P256[Ct] := 30; INC(ct);  P256[Ct] := 0;  INC(ct);
     P256[Ct] := 35; INC(ct);  P256[Ct] := 35; INC(ct);  P256[Ct] := 5;  INC(ct);
     P256[Ct] := 40; INC(ct);  P256[Ct] := 40; INC(ct);  P256[Ct] := 10; INC(ct);
     P256[Ct] := 45; INC(ct);  P256[Ct] := 45; INC(ct);  P256[Ct] := 15; INC(ct);
     P256[Ct] := 50; INC(ct);  P256[Ct] := 50; INC(ct);  P256[Ct] := 20; INC(ct);
     P256[Ct] := 55; INC(ct);  P256[Ct] := 55; INC(ct);  P256[Ct] := 25; INC(ct);
     P256[Ct] := 60; INC(ct);  P256[Ct] := 60; INC(ct);  P256[Ct] := 30; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 40; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 50; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 58; INC(ct);
     P256[Ct] := 0;  INC(ct);  P256[Ct] := 10; INC(ct);  P256[Ct] := 0;  INC(ct);
     P256[Ct] := 0;  INC(ct);  P256[Ct] := 17; INC(ct);  P256[Ct] := 0;  INC(ct);
     P256[Ct] := 10; INC(ct);  P256[Ct] := 20; INC(ct);  P256[Ct] := 10; INC(ct);
     P256[Ct] := 15; INC(ct);  P256[Ct] := 25; INC(ct);  P256[Ct] := 15; INC(ct);
     P256[Ct] := 20; INC(ct);  P256[Ct] := 30; INC(ct);  P256[Ct] := 20; INC(ct);
     P256[Ct] := 25; INC(ct);  P256[Ct] := 35; INC(ct);  P256[Ct] := 25; INC(ct);
     P256[Ct] := 30; INC(ct);  P256[Ct] := 40; INC(ct);  P256[Ct] := 30; INC(ct);
     P256[Ct] := 35; INC(ct);  P256[Ct] := 45; INC(ct);  P256[Ct] := 35; INC(ct);
     P256[Ct] := 40; INC(ct);  P256[Ct] := 50; INC(ct);  P256[Ct] := 40; INC(ct);
     P256[Ct] := 45; INC(ct);  P256[Ct] := 55; INC(ct);  P256[Ct] := 45; INC(ct);
     P256[Ct] := 50; INC(ct);  P256[Ct] := 60; INC(ct);  P256[Ct] := 50; INC(ct);
     P256[Ct] := 55; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 55; INC(ct);
     P256[Ct] := 25; INC(ct);  P256[Ct] := 15; INC(ct);  P256[Ct] := 0;  INC(ct);
     P256[Ct] := 30; INC(ct);  P256[Ct] := 20; INC(ct);  P256[Ct] := 5;  INC(ct);
     P256[Ct] := 35; INC(ct);  P256[Ct] := 25; INC(ct);  P256[Ct] := 10; INC(ct);
     P256[Ct] := 40; INC(ct);  P256[Ct] := 30; INC(ct);  P256[Ct] := 15; INC(ct);
     P256[Ct] := 45; INC(ct);  P256[Ct] := 35; INC(ct);  P256[Ct] := 20; INC(ct);
     P256[Ct] := 50; INC(ct);  P256[Ct] := 40; INC(ct);  P256[Ct] := 25; INC(ct);
     P256[Ct] := 55; INC(ct);  P256[Ct] := 45; INC(ct);  P256[Ct] := 30; INC(ct);
     P256[Ct] := 60; INC(ct);  P256[Ct] := 50; INC(ct);  P256[Ct] := 35; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 55; INC(ct);  P256[Ct] := 40; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 60; INC(ct);  P256[Ct] := 45; INC(ct);
     {Grays}
     P256[Ct] := 2;  INC(ct);  P256[Ct] := 2;  INC(ct);  P256[Ct] := 2;  INC(ct);
     P256[Ct] := 5;  INC(ct);  P256[Ct] := 5;  INC(ct);  P256[Ct] := 5;  INC(ct);
     P256[Ct] := 8;  INC(ct);  P256[Ct] := 8;  INC(ct);  P256[Ct] := 8;  INC(ct);
     P256[Ct] := 10; INC(ct);  P256[Ct] := 10; INC(ct);  P256[Ct] := 10; INC(ct);
     P256[Ct] := 12; INC(ct);  P256[Ct] := 12; INC(ct);  P256[Ct] := 12; INC(ct);
     P256[Ct] := 14; INC(ct);  P256[Ct] := 14; INC(ct);  P256[Ct] := 14; INC(ct);
     P256[Ct] := 16; INC(ct);  P256[Ct] := 16; INC(ct);  P256[Ct] := 16; INC(ct);
     P256[Ct] := 18; INC(ct);  P256[Ct] := 18; INC(ct);  P256[Ct] := 18; INC(ct);
     P256[Ct] := 20; INC(ct);  P256[Ct] := 20; INC(ct);  P256[Ct] := 20; INC(ct);
     P256[Ct] := 22; INC(ct);  P256[Ct] := 22; INC(ct);  P256[Ct] := 22; INC(ct);
     P256[Ct] := 24; INC(ct);  P256[Ct] := 24; INC(ct);  P256[Ct] := 24; INC(ct);
     P256[Ct] := 26; INC(ct);  P256[Ct] := 26; INC(ct);  P256[Ct] := 26; INC(ct);
     P256[Ct] := 28; INC(ct);  P256[Ct] := 28; INC(ct);  P256[Ct] := 28; INC(ct);
     P256[Ct] := 30; INC(ct);  P256[Ct] := 30; INC(ct);  P256[Ct] := 30; INC(ct);
     P256[Ct] := 32; INC(ct);  P256[Ct] := 32; INC(ct);  P256[Ct] := 32; INC(ct);
     P256[Ct] := 34; INC(ct);  P256[Ct] := 34; INC(ct);  P256[Ct] := 34; INC(ct);
     P256[Ct] := 36; INC(ct);  P256[Ct] := 36; INC(ct);  P256[Ct] := 36; INC(ct);
     P256[Ct] := 38; INC(ct);  P256[Ct] := 38; INC(ct);  P256[Ct] := 38; INC(ct);
     P256[Ct] := 40; INC(ct);  P256[Ct] := 40; INC(ct);  P256[Ct] := 40; INC(ct);
     P256[Ct] := 42; INC(ct);  P256[Ct] := 42; INC(ct);  P256[Ct] := 42; INC(ct);
     P256[Ct] := 44; INC(ct);  P256[Ct] := 44; INC(ct);  P256[Ct] := 44; INC(ct);
     P256[Ct] := 46; INC(ct);  P256[Ct] := 46; INC(ct);  P256[Ct] := 46; INC(ct);
     P256[Ct] := 48; INC(ct);  P256[Ct] := 48; INC(ct);  P256[Ct] := 48; INC(ct);
     P256[Ct] := 50; INC(ct);  P256[Ct] := 50; INC(ct);  P256[Ct] := 50; INC(ct);
     P256[Ct] := 52; INC(ct);  P256[Ct] := 52; INC(ct);  P256[Ct] := 52; INC(ct);
     P256[Ct] := 54; INC(ct);  P256[Ct] := 54; INC(ct);  P256[Ct] := 54; INC(ct);
     P256[Ct] := 56; INC(ct);  P256[Ct] := 56; INC(ct);  P256[Ct] := 56; INC(ct);
     P256[Ct] := 58; INC(ct);  P256[Ct] := 58; INC(ct);  P256[Ct] := 58; INC(ct);
     P256[Ct] := 61; INC(ct);  P256[Ct] := 61; INC(ct);  P256[Ct] := 61; INC(ct);
     P256[Ct] := 63; INC(ct);  P256[Ct] := 63; INC(ct);  P256[Ct] := 63; INC(ct);
     Error := gxSetConvertPalette(GxPAL5,@P256);
     Error := GxSetDisplayPalette(@P256);
     {Grayscale palette}
     FillChar(G256,SizeOf(G256),0);
     FOR Ct := 678 TO 767 DO G256[Ct] := P256[Ct];
END;


END.