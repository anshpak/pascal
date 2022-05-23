program kontrolnayaRabota;
{$R-}
uses graph;
type
        titem = integer;
        elements = array [1..1] of titem;
        ptrRow = ^elements;
        rows = array [1..1] of ptrRow;
        matrix = ^rows;

procedure initArr(var arr: matrix; m, n: byte; var t: text);
var
        i, j: byte;
begin
        for i := 1 to m do
                for j := 1 to n do
                        read(t, arr^[i]^[j]);
end;

procedure showArr(var arr: matrix; m, n: byte);
var
        i, j: byte;
begin
        for i := 1 to m do begin
                for j := 1 to n do
                        write(arr^[i]^[j], ' ');
                writeln;
        end;
end;

var
        t1, t2: text;
        m, n: byte;     {Если квадратная, то n}
        myArr: matrix;
        i, j: byte;
begin
        assign(t1, 'size.txt');
        assign(t2, 'matrix.txt');
        reset(t1);
        reset(t2);
        readln(t1, m);
        readln(t1, n);

        getMem(myArr, m * sizeOf(rows));
        for i := 1 to m do
                getMem(myArr^[i], n * sizeof(elements));

        initArr(myArr, m, n, t2);
        showArr(myArr, m, n);

        for i := 1 to m do
                freeMem(myArr^[i], n * sizeof(elements));
        freeMem(myArr, m * sizeOf(rows));

        close(t2);
        close(t1);
        readln;
end.
