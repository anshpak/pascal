program coordSystem;
uses graph;

var
        gd, gm, errorcode: integer;
        x, y, x0, y0, i: word;
begin
        gd := 0;
        initgraph(gd, gm, '');
        x0 := getmaxx div 2;
        y0 := getmaxy div 2;
        line(0, y0, getmaxx, y0);
        line(x0, 0, x0, getmaxy);
        line(x0, 0, x0 - 8, 10);
        line(x0, 0, x0 + 8, 10);
        line(getmaxx, y0, getmaxx - 8, y0 - 10);
        line(getmaxx, y0, getmaxx - 8, y0 + 10);
        moveto(x0 + 14, 0);
        outtext('y');
        moveto(getmaxx - 14, y0 + 14);
        outtext('x');
        moveto(x0 - 14, y0 + 14);
        outtext('0');
        i := 1;
        while(y0 + i * 20 < getmaxy) do begin
                {����� �뫮 �������� �᫮��� ���� y0 - i * 20 > 0, �� ��� �����筮�, ⠪ ��� ����� �������
                ᨬ����筮 � �ᮢ���� �४����� � ����� ���殢, ����� �㤥� ���⨣��� ���ᨬ��쭠� �࠭��}
                line(x0 - 4, y0 - i * 20, x0 + 4, y0 - i * 20);
                line(x0 - 4, y0 + i * 20, x0 + 4, y0 + i * 20);
                inc(i);
        end;
        i := 1;
        while(x0 + i * 20 <= getmaxx ) do begin
                line(x0 + 20 * i, y0 - 4, x0 + 20 * i, y0 + 4);
                line(x0 - 20 * i, y0 - 4, x0 - 20 * i, y0 + 4);
                inc(i);
        end;
        readln;
end.
