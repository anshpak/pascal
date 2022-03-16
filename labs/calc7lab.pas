unit calc7lab;
interface
function getNumLen(num:integer):byte;
function expToPower(num:real;power:byte):real;
function getCalcResAndPrint(num:integer; x:real):real;
procedure printHead;
procedure printMiddle(numerator:real;denumenator:integer);
procedure printFooter;

implementation
function getNumLen(num:integer):byte;
var
        strTmp:string;
begin
        str(num,strTmp);
        getNumLen:=Length(strTmp);
end;

function expToPower(num:real;power:byte):real;
var
        i:byte;
        res:real;
begin
        res:=1;
        for i:=1 to power do
                res:=res*num;
        expToPower:=res;
end;

function getCalcResAndPrint(num:integer; x:real):real;
var
        i:byte;
        res,t,fakeresult:real;
begin
        res:=0;
        fakeresult:=0;
        t:=3*(1-x);
        {‚¥àå â ¡«¨æë}
        printHead;
        for i:=1 to num do
        begin
                {‘¥à¥¤¨­  â ¡«¨æë}
                printMiddle(t,i);
                {}
                res:=res+t;
                t:=t*(expToPower(3,getNumLen(i))*(1-x)*i)/(i+1);
        end;
        {¨§ â ¡«¨æë}
        printFooter;
        getCalcResAndPrint:=res;
end;

procedure printHead;
	begin
		writeln('ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿':70);
		Writeln('³  ‡­ ¬¥­ â¥«ì  ³   —¨á«¨â¥«ì   ³':70);
		writeln('ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´':70);
	end;

procedure printMiddle(numerator:real;denumenator:integer);
	begin
		writeln('³    ':42, denumenator:4,'³':8, numerator:12,'³':4);
	end;

procedure printFooter;
	begin
		writeln('ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ':70);
	end;

end.
