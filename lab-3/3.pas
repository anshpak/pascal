program thirdLab;
const
	a=-1;
	b=1;
	h=0.1;
	E=1E-3;
var
	i,n,accuracy:integer;
        x,sum:real;

function f(x:real;var accuracy:integer):real;
var
	k:integer;
        S,a,y:real;
begin
        S:=0;
        k:=2;
        a:=-2*x*x;
        y:=-2*x;
        accuracy:=0;
        while (abs(a) >= E) do
        begin
                S:=S+a;
                a:=a*y/k;
                k:=k+1;
                accuracy:=accuracy+1;
        end;
        f:=S;
end;

procedure printHead;
	begin
		writeln('���������������������������������������������Ŀ':70);
		Writeln('�       x       �      sum      �      n      �':70);
		writeln('���������������������������������������������Ĵ':70);
	end;

procedure printMiddle(x,f:real;n:integer);
	begin
		writeln('�    ':28, x:6:2,'�':6, f:11:6,'�':5,n:7,'�':7);
	end;

procedure printFooter;
	begin
		writeln('�����������������������������������������������':70);
	end;

begin
	n:=trunc((b-a)/h+1);
        x:=a;
        printHead;
                for i:=1 to n do
                begin
                        sum:=x+f(x,accuracy);
                        printMiddle(x,sum,accuracy);
                        x:=x+h;
                end;
       printFooter;
       readln;
end.
