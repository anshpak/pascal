program seventhLab;
const
        n=9143;
        x=0.99;
        size=9;
        degrees : array [1..size] of integer = (3, 9, 27, 81, 243, 729, 2187, 6561, 19683);

function getNumLen(num: integer): byte;
var
        strTmp: string;
begin
        str(num, strTmp);
        getNumLen:=Length(strTmp);
end;

function calcExpr(n: integer; x: real): real;
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
                writeln(S);
                a:=(a*i*degrees[getNumLen(i+1)]*(1-x))/((i+1)*degrees[getNumLen(i)]);
        end;
        calcExpr:=S;
end;

begin
        writeln(calcExpr(n, x));
        readln;
end.