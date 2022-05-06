program gr;
uses graph;

procedure drawCoordSyst(xMin, yMin, xMax, yMax: word);
var
        x0, y0, i, margin: word;
begin
        margin := 20; {Отступ}
        x0 := xMin + (xMax - xMin) div 2; {Центр по x}
        y0 := yMin + (yMax - yMin) div 2; {Центр по y}
        line(xMin + margin, y0, xMax - margin, y0); {Ось x}
        line(x0, yMin + margin, x0, yMax - margin); {Ось y}
        line(x0, yMin + margin, x0 - 8, yMin + margin + 10); {Стрелки}
        line(x0, yMin + margin, x0 + 8, yMin + margin + 10);
        line(xMax - margin, y0, xMax - margin - 8, y0 - 10);
        line(xMax - margin, y0, xMax - margin  - 8, y0 + 10);
        moveto(x0 + 14, yMin + margin); {Подписываю оси}
        outtext('y');
        moveto(xMax - margin - 14, y0 + 14);
        outtext('x');
        moveto(x0 - 14, y0 + 14);
        outtext('0');
        i := 1; {Деления}
        while(y0 + i * 20 < yMax - margin) do begin
                line(x0 - 4, y0 - i * 20, x0 + 4, y0 - i * 20);
                line(x0 - 4, y0 + i * 20, x0 + 4, y0 + i * 20);
                inc(i);
        end;
        i := 1;
        while(x0 + i * 20 < xMax - margin) do begin
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
        initGraph(gd, gm, '');
        x0 := getmaxx div 2;
        y0 := getmaxy div 2;
        setColor(Red);
        setLineStyle(0, 0, 3);
        line(0, y0, getmaxx, y0);
        line(x0, 0, x0, getmaxy);
        setColor(Blue);
        drawCoordSyst(0, 0, x0, y0);
        setColor(Yellow);
        drawCoordSyst(x0, 0, getmaxx, y0);
        setColor(Green);
        drawCoordSyst(0, y0, x0, getmaxy);
        setColor(LightCyan);
        drawCoordSyst(x0, y0, getmaxx, getmaxy);
        readln;
end.
