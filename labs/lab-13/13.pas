Program therteenthLab;
uses graph, crt;
const
        xLeft = 200;
        yLeft : word = 300;
        dx = 12;
        dMove = 50;
        nWhite = 7;
        nRed = 5;
type
        whiteLine = array[1..nWhite * 2] of word;
        redLine = array[1..nRed * 2] of word;

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
        fillPoly(nWhite, whitePts);

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

        fillPoly(nWhite, whitePts);

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
        fillPoly(nRed, redPts);

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

        fillPoly(nRed, redPts);

        {����� ��᭠� �����}
        redPts[1] := xLeft;
        redPts[2] := yRight;
        redPts[3] := xCenter;
        redPts[4] := yCenter;
        redPts[5] := xCenter + redLnWdth;
        redPts[6] := yCenter + redLnWdth;
        redPts[7] := xLeft + redLnWdth;
        redPts[8] := yRight + redLnWdth;
        redPts[9] := xLeft;
        redPts[10] := yRight;

        fillPoly(nRed, redPts);

        {��⢥��� ��᭠� �����}
        redPts[1] := xRight;
        redPts[2] := yRight;
        redPts[3] := xCenter;
        redPts[4] := yCenter;
        redPts[5] := xCenter + redLnWdth;
        redPts[6] := yCenter - redLnWdth;
        redPts[7] := xRight + redLnWdth;
        redPts[8] := yRight - redLnWdth;
        redPts[9] := xRight;
        redPts[10] := yRight;

        fillPoly(nRed, redPts);

        {����ࠫ�� ���� �����}
        setFillStyle(SolidFill, White);
        bar(xCenter - whLnWdth, yLeft, xCenter + whLnWdth, yRight);
        bar(xLeft, yCenter - whLnWdth, xRight, yCenter + whLnWdth);

        {����ࠫ�� ���� �����}
        setFillStyle(SolidFill, Red);
        {������� ࠧ��� �� ᥡ�}
        bar(xCenter - redLnWdth - 2, yLeft, xCenter + redLnWdth + 2, yRight);
        bar(xLeft, yCenter - redLnWdth - 2, xRight, yCenter + redLnWdth + 2);

        {����� ����� 㣫� ����� �����}
        setFillStyle(SolidFill, Black);
        bar(xLeft - whLnWdth, yLeft + whLnWdth, xLeft, yLeft);
        bar(xRight - whLnWdth, yLeft - whLnWdth, xRight, yLeft);
        bar(xLeft + whLnWdth, yRight + whLnWdth, xLeft, yRight);
        bar(xRight + whLnWdth, yRight - whLnWdth, xRight, yRight);
end;

var
        gd, gm: integer;
        size: longint;
        picture: pointer;
        xRight, yRight: word;
begin
        gd := 9;
        gm := 2;
        initgraph(gd, gm, '');
        flag(xLeft, yLeft, dx);
        setFillStyle(SolidFill, LightGray);
        bar(xLeft - 15, 20, xLeft - 5 , yLeft + 150);


        size := imageSize(xLeft, yLeft, xLeft + 9 * dx  div 2 * 3, yLeft + 9 * dx);
        getMem(picture, size);
        getImage(xLeft, yLeft, xLeft + 9 * dx  div 2 * 3, yLeft + 9 * dx, Picture^);
        putImage(xLeft, yLeft, Picture^, 0);
        while yLeft  > 50  do begin
                putImage(xLeft, yLeft, Picture^, xorPut);
                yLeft := yleft - dMove;
                putImage(xLeft, yLeft, Picture^, xorPut);
    end;



        {while YLeft  > 50  do begin
                outtextxy(20, yleft, 'Ok');
                delay(100);
                setFillStyle(SolidFill, 0);
                bar(xLeft, yLeft, xLeft + 9 * dx  div 2 * 3 ,YLeft + 9 * dx);
                yLeft := yleft - dMove;
                flag(xLeft, yLeft,  dx);
                setFillStyle(SolidFill, LightGray);
                bar(xLeft - 15, 20, xLeft - 5 , yLeft + 150);
        end;}
        readln;
end.
