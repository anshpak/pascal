unit calc7lab;

interface
const
        size=9;
        degrees : array [1..size] of integer = (3, 9, 27, 81, 243, 729, 2187, 6561, 19683);
function getNumLen(num: integer):byte;
procedure printHead(path: string);
procedure printMiddle(a, S:real; path: string);
procedure calcWriteExpr(n: integer; x: real; path: string);

implementation
function getNumLen(num: integer): byte;
var
        strTmp: string;
begin
        str(num, strTmp);
        getNumLen:=Length(strTmp);
end;

procedure printHead(path: string);
var
        t: text;
begin
        assign(t, path);
        rewrite(t);
	writeln(t, '            a                      sum           ':56);
        close(t);
end;

procedure printMiddle(a, S:real; path: string);
var
        t: text;
begin
        assign(t, path);
        append(t);
        writeln(t, '     ':12, a:6:14,' ':4, S:19:14,' ':5);
        close(t)
end;

procedure calcWriteExpr(n: integer; x: real; path: string);
var
        a, S: real;
        i: integer;
        iLen: byte;
begin
        S:=0;
        a:=3*(1-x);
        for i:=1 to n do
        begin
                S:=S+a;
                a:=(a*i*degrees[getNumLen(i+1)]*(1-x))/((i+1)*degrees[getNumLen(i)]);
                printMiddle(a, S, path);
        end;
end;

end.