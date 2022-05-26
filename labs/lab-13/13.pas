Program therteenthLab;
uses graph, crt;
const
        xLeft = 200;
        yLeft = 300;
        dx = 12;
        dMove = 50;
        nWhite = 7;
        nRed = 5;
type
        whiteLine = array[1..nWhite * 2] of word;
        redLine = array[1..nRed * 2] of word;
var
        gd, gm: integer;
        size: longint;
        picture: pointer;

procedure flag (xLeft, yLeft: word; dx: word);
const
        whLnWdth = 10;
        redLnWdth = 4;
var
        i, xRight, yRight, xCenter, yCenter: word;
        whitePts: whiteLine;
        redPts: redLine;
begin
        clrscr;
        xRight := xLeft + 9 * dx div 2 * 3;
        yRight := yLeft + 9 * dx;
        setFillStyle(SolidFill, Blue);
        bar(xLeft, yLeft, xRight, yRight);

        {��ࢠ� ����� �����}
        whitePts[1] := xLeft;
        whitePts[2] := yLeft;
        whitePts[3] := xLeft + whLnWdth;
        whitePts[4] := yLeft;
        whitePts[5] := xRight;
        whitePts[6] := yRight - whLnWdth;
        whitePts[7] := xRight;
        whitePts[8] := yRight;
        whitePts[9] := xRight - whLnWdth;
        whitePts[10] := yRight;
        whitePts[11] := xLeft;
        whitePts[12] := yLeft + whLnWdth;
        whitePts[13] := xLeft;
        whitePts[14] := yLeft;

        setFillStyle(SolidFill, White);
        FillPoly(nWhite, whitePts);

        {���� ����� �����}
        whitePts[1] := xLeft;
        whitePts[2] := yRight;
        whitePts[3] := xLeft;
        whitePts[4] := yRight - whLnWdth;
        whitePts[5] := xRight - whLnWdth;
        whitePts[6] := yLeft;
        whitePts[7] := xRight;
        whitePts[8] := yLeft;
        whitePts[9] := xRight;
        whitePts[10] := yLeft + whLnWdth;
        whitePts[11] := xLeft + whLnWdth;
        whitePts[12] := yRight;
        whitePts[13] := xLeft;
        whitePts[14] := yRIght;

        FillPoly(nWhite, whitePts);

        {��ࢠ� ��᭠� �����}
        xCenter := xLeft + (xRight - xLeft) div 2;
        yCenter := yLeft + (yRight - yLeft) div 2;
        redPts[1] := xLeft;
        redPts[2] := yLeft;
        redPts[3] := xCenter;
        redPts[4] := yCenter;
        redPts[5] := xCenter - redLnWdth;
        redPts[6] := yCenter + redLnWdth;
        redPts[7] := xLeft - redLnWdth;
        redPts[8] := yLeft + redLnWdth;
        redPts[9] := xLeft;
        redPts[10] := yLeft;

        setFillStyle(SolidFill, Red);
        FillPoly(nRed, redPts);

        {���� ��᭠� �����}
        redPts[1] := xRight;
        redPts[2] := yLeft;
        redPts[3] := xCenter;
        redPts[4] := yCenter;
        redPts[5] := xCenter - redLnWdth;
        redPts[6] := yCenter - redLnWdth;
        redPts[7] := xRight - redLnWdth;
        redPts[8] := yLeft - redLnWdth;
        redPts[9] := xRight;
        redPts[10] := yLeft;

        setFillStyle(SolidFill, Red);
        FillPoly(nRed, redPts);

        {����� ��᭠� �����}
        {redPts[1] := xCenter;
        redPts[2] := yCenter;
        redPts[3] := xLeft;
        redPts[4] := yRight - redLnWdth;
        redPts[5] := xLeft;
        redPts[6] := yRight;
        redPts[7] := xCenter;
        redPts[8] := yCenter + redLnWdth + 3; {�����஬}
        {redPts[9] := xCenter;
        redPts[10] := yCenter;

        setFillStyle(SolidFill, Red);
        FillPoly(nRed, redPts);}

        {SetFillStyle(SolidFill, White);
        for i:= 1 to 4 do
                bar(XLeft, YLeft + dx * (2 * i - 1) + 1, XLeft + 9 * dx  div 2 * 3 , YLeft + dx * (2 * i));

        SetFillStyle(SolidFill, Blue);
        bar(XLeft, YLeft, XLeft + 5 * dx, YLeft + 5 * dx);

        SetFillStyle(SolidFill, White);
        bar(XLeft, YLeft + dx * 2 + 1,XLeft + 5 * dx,YLeft + dx * 3);

        SetFillStyle(SolidFill, White);
        bar(XLeft + dx * 2 + 1,YLeft, XLeft + 3 * dx,YLeft + dx * 5);}
end;

var
        st:string;
begin
        gd := 9;
        gm := 2;
        initgraph(gd, gm, '');

        SetFillStyle(SolidFill, LightGray);
        bar(XLeft - 15, 20, XLeft - 5 , YLeft + 150);
        Size := ImageSize(XLeft, YLeft, XLeft + 9 * dx  div 2 * 3 ,YLeft + 9 * dx);
        GetMem(Picture, Size);
        Flag(XLeft, YLeft,  dx);
        {GetImage(XLeft, YLeft, XLeft + 9 * dx  div 2 * 3 ,YLeft + 9 * dx, Picture^);
        str(size, st);
        outtextxy(20, 20, st);
        PutImage(XLeft, YLeft, Picture^, 0);
        delay(75*2);
        while YLeft  > 50  do begin
                PutImage(XLeft, YLeft, Picture^, xorPut);
                outtextxy(20, yleft, 'Ok');

                YLeft := Yleft - dMove;
                PutImage(XLeft, YLeft, Picture^, xorput);
                delay(500);
        end;}
        readln;
end.