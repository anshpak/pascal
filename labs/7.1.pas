program seventhLab;
const
        n=15;
        size=9;
        degrees : array [1..size] of integer = (3, 9, 27, 81, 243, 729, 2187, 6561, 19683);

function getNumLen(num: byte): byte;
var
        strTmp: string;
begin
        str(num, strTmp);
        getNumLen:=Length(strTmp);
end;

procedure calcExpr(n: byte);
var

begin

end;

begin

        readln;
end.