Program therteenthLab;
uses graph, crt;
type
        figure = array[1..14] of word;
var
        gd, gm: integer;
        size: longint;
        picture: pointer;

const
        xLeft : word = 200;
        yLeft : word = 300;
        dx: word = 10;
        dMove : word = 50;

procedure flag (xLeft, yLeft: word; dx: word);
const
        whLnWdth = 7;
var
        i, xRight, yRight: word;
        points: figure;
begin
        clrscr;
        xRight := xLeft + 9 * dx div 2 * 3;
        yRight := yLeft + 9 * dx;
        setFillStyle(SolidFill, Blue);
        bar(xLeft, yLeft, xRight, yRight);

        {Первая белая линия}
        points[1] := xLeft;
        points[2] := yLeft;
        points[3] := xLeft + whLnWdth;
        points[4] := yLeft;
        points[5] := xRight;
        points[6] := yRight - whLnWdth;
        points[7] := xRight;
        points[8] := yRight;
        points[9] := xRight - whLnWdth;
        points[10] := yRight;
        points[11] := xLeft;
        points[12] := yLeft + whLnWdth;
        points[13] := xLeft;
        points[14] := yLeft;

        setFillStyle(SolidFill, White);
        FillPoly(7, points);

        {Вторая белая линия}
        points[1] := xLeft;
        points[2] := yRight;
        points[3] := xLeft;
        points[4] := yRight - whLnWdth;
        points[5] := xRight - whLnWdth;
        points[6] := yLeft;
        points[7] := xRight;
        points[8] := yLeft;
        points[9] := xRight;
        points[10] := yLeft + whLnWdth;
        points[11] := xLeft + whLnWdth;
        points[12] := yRight;
        points[13] := xLeft;
        points[14] := yRIght;

        FillPoly(7, points);

        {mas[1] := XLeft;
        mas[2] := YLeft;
        mas[3] := (XLeft + 9 * dx  div 2 * 3) ;
        mas[4] := (YLeft + 9 * dx) ;
        mas[5] := XLeft + 9 * dx  div 2 * 3;
        mas[6] := YLeft + 9 * dx - 7;
        mas[7] := XLeft + 9 * dx  div 2 * 3;
        mas[8] := YLeft + 9 * dx;
        mas[9] := XLeft + 9 * dx  div 2 * 3 - 7;
        mas[10] := YLeft + 9 * dx;
        mas[11] := XLeft;
        mas[12] := YLeft + 7;
        mas[13] := XLeft;
        mas[14] := YLeft;

        setFillStyle(SolidFill, Red);
        FillPoly(7, mas);}

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
