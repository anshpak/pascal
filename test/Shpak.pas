program kontrolnayaRabota;
{$R-}
uses crt, graph, kr;

var
        t1, t2: text;
        n, i, j: byte;
        myArr: matrix;
        gd, gm, xc, yc,
        height, width, mHeight, mWidth,
        x1, x2, y1, y2: integer;
        strTmp, digit: string;
        myAnswer: ptrRow;
begin
        clrscr;
        gd := 0;
        initgraph(gd, gm, '');
        assign(t1, 'size.txt');
        assign(t2, 'matrix.txt');
        reset(t1);
        reset(t2);
        readln(t1, n);

        getMem(myAnswer, n * sizeOf(titem));

        getMem(myArr, n * sizeOf(rows));
        for i := 1 to n do
                getMem(myArr^[i], n * sizeof(elements));

        initArr(myArr, n, t2);
        showArr(myArr, n);

        {writeln(getGeometric(myArr, n));}
        findNearest(myArr, myAnswer, n);

        for i := 1 to n do
                writeln(myAnswer^[i]);

        close(t2);
        close(t1);

        str(n, strTmp);

        setTextStyle(GothicFont, Horizdir, 10);
        setTextJustify(1, 1);
        outTextXY(getMaxX div 2, 100, 'Matrix');
        outTextXY(getMaxX div 2, 200, strTmp + ' x ' + strTmp);

        setTextStyle(1, Horizdir, 3);
        setTextJustify(0, 0);
        setColor(4);

        {300 - потому что это примерный отступ от текста выше}
        xc := getMaxX div 2;
        yc := ((getMaxY - 200) div 2) + 200;

        height := textHeight('A');
        width := textWidth('A');
        mWidth := (n * width) * 3;   {3 - выделяю под число места в строке}
        mheight := n * height;
        x1 := xc - mwidth div 2;
        y1 := yc - mheight div 2;
        x2 := xc + mwidth div 2;
        y2 := yc + mheight div 2 + 50; {Если размеры матрицы поменять, вручную нужно изменить прибавляемое значение}

        setFillStyle(SolidFill, LightGray);
        setColor(Red);
        rectangle(x1 + 40, y1, x2, y2);

        setColor(Yellow);

        for i := 1 to n do begin
                strTmp := '';
                for j := 1 to n do begin
                        str(myArr^[i]^[j]: 3, digit);
                        strTmp := strTmp + digit;
                end;
                outtextXY(x1, y1 + i * 30, strTmp);
        end;

        setColor(Red);
        Rectangle(x2 + 90, y1, x2 + 130, y2);

        SetColor(Blue);
        for i := 1 to n do begin

                str(myAnswer^[i]: 3, digit);
                outtextXY(x2 + 50, y1 + i * 30, digit);
        end;

        readln;
        closeGraph;
        freeMem(myAnswer, n * sizeOf(titem));
        for i := 1 to n do
                freeMem(myArr^[i], n * sizeof(elements));
        freeMem(myArr, n * sizeOf(rows));
end.
