program seventhLab;
uses calc7Lab;
const
        n=11;
        x=0.91;
var
        t: text;
begin
        assign(t,'src/calcRes.txt');
        rewrite(t);
        writeln(t, 'n = ', n, ';');
        writeln(t, 'x = ', x, ';');
        writeln(t, 'Sum = ', calcSum(n, x),';');
        writeln(t, 'Steps:');
	writeln(t, 'a': 3, 'sum':10);
        close(t);
        steps(n, x, 'src/calcRes.txt');
        write('������ �믮����. ��������, �஢���� 䠩� calcRes.txt');
        readln;
end.



