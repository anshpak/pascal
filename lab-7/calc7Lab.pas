unit calc7lab;

interface
const
        size=9;
        degrees : array [1..size] of integer = (3, 9, 27, 81, 243, 729, 2187, 6561, 19683);
function getNumLen(num: integer):byte;
function calcSum(n: integer; x: real): real;
procedure steps(n: integer; x: real; path: string);

implementation
function getNumLen(num: integer): byte;
var
        strTmp: string;
begin
        str(num, strTmp);
        getNumLen:=Length(strTmp);
end;

function  calcSum(n: integer; x: real): real;
var
        a, t, S: real;
        i: integer;
        iLen: byte;
begin
        S:=0;
        t:=1-x;
        a:=3*t;
        for i:=2 to n do
        begin
                S:=S+a;
                iLen:=getNumLen(i);
                a:=(a*degrees[iLen]*t)/i;
        end;
        calcSum:=S;
end;

procedure steps(n: integer; x: real; path: string);
var
        a, t, S: real;
        i: integer;
        iLen: byte;
        var txt: text;
begin
        assign(txt, path);
        append(txt);
        S:=0;
        t:=1-x;
        a:=3*t;
        for i:=2 to n do
        begin
                S:=S+a;
                iLen:=getNumLen(i);
                a:=(a*degrees[iLen]*t)/i;
                writeln(txt, a:5:3,' ':4, S:5:3,' ':5);
        end;
        close(txt)
end;

end.
