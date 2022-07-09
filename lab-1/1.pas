program firstLab;

var
	a,b,h,n,i:integer;
	x:real;

function f1(x:real):real;
	begin
		f1:=67/5+(5*x)/7;
	end;

function f2(x:real):real;
	begin
		f2:=26/11-(28*x)/11-(4*x*x)/11;
	end;

function f3(x:real):real;
	begin
		f3:=5.85+sqrt(6+x-x*x);
	end;

function f4(x:real):real;
	begin
		f4:=7.3+sin(Pi*x/2);
	end;

function f5(x:real):real;
	begin
		f5:=3.3-sqr(-9+x)+x;
	end;

function f(x:real):real;
	begin
		if(x>=-12) then
			if(x<=5) then
				f:=f1(x)
			else if(x<=2) then
				f:=f2(x)
		else if(x<=1) then
			f:=f3(x)
		else if(x<=7) then
			f:=f4(x)
		else if(x<=12) then
			f:=f5(x);
	end;

procedure printHead;
	begin
		writeln('ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ¿':70);
		Writeln('³      x      ³      y      ³':70);
		writeln('ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄ´':70);
	end;

procedure printMiddle(x,f:real);
	begin
		writeln('³   ':45, x:5:1, '     ³     ':10, f:5:2, '   ³':4);
	end;

procedure printFooter;
	begin
		writeln('ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÙ':70);
	end;

begin
	a:=-12;
	x:=a;
	b:=12;
	h:=1;
	n:=((b-a) div h) + 1;
	printHead();
	for i:= 1 to n do
		begin
			printMiddle(x, f(x));
			x := x + 1;
		end;
	printFooter;
	readln;
end.
