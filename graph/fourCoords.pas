program gr;
uses graph;

procedure coordSystem(xMin, yMin, xMax, yMax: word);
var
        x0, y0, i: word;
begin
        x0 := xMax div 2;
        y0 := yMax div 2;
        line(xMin, y0, xMax, y0);
        line(x0, yMin, x0, yMax);
        line(x0, yMin, x0 - 8, yMin + 10);
        line(x0, yMin, x0 + 8, yMin + 10);
        line(xMax, y0, xMax - 8, y0 - 10);
        line(xMax, y0, xMax - 8, y0 + 10);
        moveto(x0 + 14, yMin);
        outtext('y');
        moveto(xMax - 14, y0 + 14);
        outtext('x');
        moveto(x0 - 14, y0 + 14);
        outtext('0');
        i := 1;
        while(y0 + i * 20 < yMax) do begin
                line(x0 - 4, y0 - i * 20, x0 + 4, y0 - i * 20);
                line(x0 - 4, y0 + i * 20, x0 + 4, y0 + i * 20);
                inc(i);
        end;
        i := 1;
        while(x0 + i * 20 < xMax ) do begin
                line(x0 + 20 * i, y0 - 4, x0 + 20 * i, y0 + 4);
                line(x0 - 20 * i, y0 - 4, x0 - 20 * i, y0 + 4);
                inc(i);
        end;
end;

var
        gd, gm, errorcode: integer;
        x, y, x0, y0, i: word;
begin
        gd := 0;
        initgraph(gd, gm, '');
        x0 := getmaxx div 2;
        y0 := getmaxy div 2;
        setcolor(Red);
        setLineStyle(0, 0, 3);
        line(0, y0, getmaxx, y0);
        line(x0, 0, x0, getmaxy);
        setcolor(White);
        coordSystem(0, 0, x0, y0);
        readln;
end.
