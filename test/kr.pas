Unit kr;
{$R-}
interface
type
        titem = word;
        elements = array [1..1] of titem;
        ptrRow = ^elements;
        rows = array [1..1] of ptrRow;
        matrix = ^rows;

procedure initArr(var arr: matrix; n: byte; var t: text);
procedure showArr(var arr: matrix; n: byte);
function getGeometric(var arr: matrix; n: byte): real;
procedure findNearest(var arr: matrix; result: ptrRow; n: byte);

implementation

procedure initArr(var arr: matrix; n: byte; var t: text);
var
        i, j: byte;
begin
        for i := 1 to n do
                for j := 1 to n do
                        read(t, arr^[i]^[j]);
end;

procedure showArr(var arr: matrix; n: byte);
var
        i, j: byte;
begin
        for i := 1 to n do begin
                for j := 1 to n do
                        write(arr^[i]^[j], ' ');
                writeln;
        end;
end;

function getGeometric(var arr: matrix; n: byte): real;
var
        i, j: byte;
        sum: integer;

begin
        sum := 0;
        for i := 1 to n do
                for j := 1 to n do
                        sum := sum + arr^[i]^[j];
        getGeometric := sqrt(sqrt(sqrt(sum)));
end;

procedure findNearest(var arr: matrix; result: ptrRow; n: byte);
var
        i, j: byte;
        geom: real;
        temp: real;
        min : word;
begin
        geom := getGeometric(arr, n);
        for i := 1 to n do begin
                temp := abs(geom - arr^[i]^[1]);
                min := arr^[i]^[1];
                for j := 1 to n do begin
                        if(temp > abs(geom - arr^[i]^[j])) then begin
                                temp := abs(geom - arr^[i]^[j]);
                                min := arr^[i]^[j];
                        end;
                end;
                result^[i] := min;
        end;
end;

end.