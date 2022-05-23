program kontrolnayaRabota;
uses graph;

var
        t1, t2: text;
        m, n: byte;     {Если квадратная, то просто n}
begin
        assign(t1, 'size.txt');
        assign(t2, 'matrix.txt');

        close(t2);
        close(t1);
end.