program eightLab;
uses crt;
const
        nMax = 2000;
type
        digit = 0..9;
        num = array[1..nMax] of digit;
        bigNum = record
                len: word;
                a: num;
                end;

function initN(path: string): bigNum;
var
        t: text;
        len, a, i: integer;
        temp: bigNum;
begin
        assign(t, path);
        reset(t);
        readln(t, len);
        i := len;
        temp.len := len;
        while not eof(t) do begin
                readln(t, a);
                temp.a[i] := a;
                i := i - 1;
        end;
        initN := temp;
end;

procedure showNum(n: bigNum);
var
        i: integer;
begin
        for i:=n.len downto 1 do
                write(n.a[i]);
        writeln;
end;

function max(var n1, n2: bigNum): bigNum;
var
        i: integer;
begin
        if (n1.len = n2.len) then begin
                i := n1.len;
                while i <> 0 do begin
                        if(n1.a[i] > n2.a[i]) then begin
                                max := n1;
                                exit;
                        end
                        else if (n1.a[i] < n2.a[i]) then begin
                                max := n2;
                                exit;
                        end
                        else begin
                                i := i - 1;
                        end;
                end;
                max := n1;
        end
        else if (n1.len > n2.len) then begin
                max := n1;
                exit;
        end
        else begin
                max := n2;
                exit;
        end;
end;


function min(var n1, n2: bigNum): bigNum;
var
        i: integer;
begin
        if (n1.len = n2.len) then
        begin
                i := n1.len;
                while i <> 0 do
                begin
                        if(n1.a[i] > n2.a[i]) then begin
                                min := n2;
                                exit;
                        end
                        else if(n1.a[i] < n2.a[i]) then begin
                                min := n1;
                                exit;
                        end
                        else begin
                                i := i - 1;
                        end;
                end;
                min := n1;
        end
        else if (n1.len > n2.len) then begin
                min := n2;
                exit;
        end
        else begin
                min := n1;
                exit;
        end;
end;

function addition(n1, n2: bigNum): bigNum;
var
        i, k, l, p: integer;
        result, x, y: bigNum;
begin
        p := 0;
        y := max(n1, n2);
        x := min(n1, n2);
        if(n1.len >= n2.len) then begin
                l := n1.len;
                k := n2.len;
        end
        else begin
                k := n1.len;
                l := n2.len;
        end;
        for i := 1 to k do begin
                result.a[i] := (x.a[i] + y.a[i] + p) mod 10;
                p := (x.a[i] + y.a[i] + p) div 10;
        end;
        for i := k + 1 to l do begin
                result.a[i] := (y.a[i] + p) mod 10;
                p := (y.a[i] + p) div 10;
        end;
        if(p = 1) then begin
                        l := l + 1;
                        result.a[l] := 1;
                end;
        result.len := l;
        addition := result;
end;

function sameQ(n1, n2: bigNum): boolean;
var
        i, n: integer;
        flag: boolean;
begin
        flag := true;
        if (n1.len >= n2.len) then
                n := n1.len
        else
                n := n2.len;
        for i := 1 to n do begin
                if(n1.a[i] <> n2.a[i]) then begin
                        flag := false;
                        break;
                end;
        end;
        sameQ := flag;
end;

function subtraction(n1, n2: bigNum): bigNum;
var
        i, k, l, p: integer;
        res, x, y: bigNum;
begin
        if(sameQ(n1, n2)) then begin
                res.len := 1;
                res.a[1] := 0;
                subtraction := res;
        end
        else begin
                p := 0;
                x := min(n1, n2);
                y := max(n1, n2);
                k := x.len;
                l := y.len;
                for i := 1 to k do begin
                        if(y.a[i] < x.a[i] + p) then begin
                                res.a[i] := 10 + y.a[i] - x.a[i] - p;
                                p := 1;
                        end
                        else begin
                                res.a[i] := y.a[i] - x.a[i] - p;
                                p := 0;
                        end;
                end;
                for i := k + 1 to l do begin
                        if(y.a[i] < p) then begin
                                res.a[i] := 10 + y.a[i] - p;
                                p := 1;
                        end
                        else begin
                                res.a[i] := y.a[i] - p;
                                p := 0;
                        end;
                end;
                res.len := l;
                while(res.a[res.len] = 0) do
                        res.len := res.len - 1;
                subtraction := res;
        end;
end;

function NOD(n1, n2: BigNum): bigNum;
var
        x, y: bigNum;
begin
        if((n2.len = 1) and (n2.a[1] = 0)) then
                NOD := n1
        else begin
                x := min(n1, n2);
                y := max(n1, n2);
                NOD := NOD(x, subtraction(y, x));
        end;
end;

var
        n1, n2: bigNum;
        j: integer;

begin
        clrscr;
        n1 := initN('src\n1.txt');
        showNum(n1);
        n2 := initN('src\n2.txt');
        showNum(n2);
        showNum(NOD(n1, n2));
        readln;
end.
