program seventhLab;
uses calc7Lab;
const
        n=20;
        x=0.35;
var
        t: text;
        answer: string;
begin
        assign(t,'src/calcRes.txt');
        rewrite(t);
        writeln(t, 'n = ', n, ';');
        writeln(t, 'x = ', x, ';');
        writeln(t, 'Sum = ', calcSum(n, x),';');
        close(t);
        writeln('��� �㦭� �������� �஬������ ���᫥���? (yes)');
        readln(answer);
        if answer = 'yes' then
        begin
                assign(t,'src/steps.txt');
                rewrite(t);
	        writeln(t, 'a': 3, 'sum':10);
                close(t);
                steps(n, x, 'src/steps.txt');
        end;
        write('������ �믮����. ��������, �஢���� 䠩� calcRes.txt');
        readln;
end.


