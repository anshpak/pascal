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

var
        n1, n2: bigNum;
        j: integer;

procedure showNum(n: bigNum);
var
        i: integer;
begin
        for i:=n.len downto 1 do
                write(n.a[i]);
        writeln;
end;

function max(var n1,n2: bigNum): bigNum;
var
        i: integer;
begin
        if (n1.len = n2.len) then
        begin
                i := n1.len - 1;
                while i <> 0 do
                begin
                        if(n1.a[i] >  n2.a[i]) then
                                max := n1
                        else
                                max := n2;
                        i := i - 1;
                end;
        end
        else if (n1.len > n2.len) then
                max := n1
        else
                max := n2;
end;

function min(var n1,n2: bigNum): bigNum;
var
        i: integer;
begin
        if (n1.len = n2.len) then
        begin
                i := n1.len - 1;
                while i <> 0 do
                begin
                        if(n1.a[i] >  n2.a[i]) then
                                min := n2
                        else
                                min := n1;
                        i := i - 1;
                end;
        end
        else if (n1.len > n2.len) then
                min := n2
        else
                min := n1;
end;

function addition(n1, n2: bigNum): bigNum;
var
        i, k, l, p: integer;
        result, x, y: bigNum;
begin
        p := 0;
        y := max(n1, n2);
        x := min(n1, n2);
        if(n1.len >= n2.len) then
        begin
                l := n1.len;
                k := n2.len;
        end
        else
        begin
                k := n1.len;
                l := n2.len;
        end;
        for i := 1 to k do
        begin
                result.a[i] := (x.a[i] + y.a[i] + p) mod 10;
                p := (x.a[i] + y.a[i] + p) div 10;
                {}
                writeln(i);
                writeln('��᫮: ', result.a[i]);
                writeln('���⮪: ', p);
                {}
        end;
        for i := k + 1 to l do
        begin
                result.a[i] := (y.a[i] + p) mod 10;
                p := (y.a[i] + p) div 10;
                {}
                writeln('sdsd��᫮: ', result.a[i]);
                writeln('���⮪: ', p);
                {}
        end;
        if(p = 1) then
                begin
                        l := l + 1;
                        result.a[l] := 1;
                end;
        result.len := l;
        addition := result;
end;

begin
        clrscr;
        n1.len:=3;
        n1.a[1]:=9;
        n1.a[2]:=9;
        n1.a[3]:=9;
        {n1.a[4]:=1;
        n1.a[5]:=2;
        n1.a[6]:=2;
        n1.a[7]:=2;
        n1.a[8]:=2;
        n1.a[9]:=2;
        n1.a[10]:=2;}
        showNum(n1);

        n2.len:=3;
        n2.a[1]:=0;
        n2.a[2]:=0;
        n2.a[3]:=9;
        {n2.a[4]:=2;}
        {n2.a[5]:=2;
        n2.a[6]:=2;
        n2.a[7]:=2;
        n2.a[8]:=2;
        n2.a[9]:=2;
        n2.a[10]:=2;}
        showNum(n2);
        showNum(addition(n1, n2));
        readln;
end.
