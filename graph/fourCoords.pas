program gr;
uses graph;

procedure coordSystem(xl, yh, xr, yd: word);
var
        x0, y0, i: word;
begin
        x0 := (xl + xr) div 2;
        y0 := (yh + yd) div 2;
        line(xl, y0, xr, y0);
        line(x0, yh, x0, yd);
        line(xl, yh, x0 - 8, 10);
        line(x0, yh, x0 + 8, 10);
        line(xr, y0, xr - 8, y0 - 10);
        line(xr, y0, xr - 8, y0 + 10);
        moveto(x0 + 14, yh);
        outtext('y');
        moveto(xr - 14, y0 + 14);
        outtext('x');
        moveto(x0 - 14, y0 + 14);
        outtext('0');
        i := 1;
        while(i * 20 <= yd) do begin
                line(x0 - 4, i * 20, x0 + 4, i * 20);
                inc(i);
        end;
        i := 1;
        while(i * 20 <= xr) do begin
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
        {errorcode := graphresult;
        if errorcode <> grok then begin
                writeln(grapherrormsg(errorcode));
                halt(1);
        end;}
        x0 := getmaxx div 2;
        y0 := getmaxy div 2;
        setcolor(Red);
        setLineStyle(0, 0, 3);
        line(0, y0, getmaxx, y0);
        line(x0, 0, x0, getmaxy);
        setcolor(White);
        coordSystem(x0 div 2, y0 div 2, x0, y0);
        readln;
end.
