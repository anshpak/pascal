program seventhLab;
const
        n=37;
        x=0.5;
        size=9;
        degrees : array [1..size] of integer = (3, 9, 27, 81, 243, 729, 2187, 6561, 19683);

function getNumLen(num: integer): byte;
var
        strTmp: string;
begin
        str(num, strTmp);
        getNumLen:=Length(strTmp);
end;

procedure printHead;
	begin
		writeln('ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿':56);
		Writeln('³           a           ³          sum          ³':56);
		writeln('ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´':56);
	end;

procedure printMiddle(a, S:real);
	begin
		writeln('³    ':12, a:6:14,'³':4, S:19:14,'³':5);
	end;

procedure printFooter;
	begin
		writeln('ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ':56);
	end;

procedure calcWriteExpr(n: integer; x: real);
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
                printMiddle(a, S);
        end;
end;

begin
        printHead;
        calcWriteExpr(n, x);
        printFooter;
        readln;
end.