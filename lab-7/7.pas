program seventhLab;
uses calc7Lab;
const
        n=12;
        x=5;
var
        t: text;
        answer: string;
begin
        assign(t,'calcRes.txt');
        rewrite(t);
        writeln(t, 'n = ', n, ';');
        writeln(t, 'x = ', x, ';');
        writeln(t, 'Sum = ', calcSum(n, x),';');
        close(t);
        writeln('Вам нужно показать промежуточные вычисления? (yes)');
        readln(answer);
        if answer = 'yes' then
        begin
                assign(t,'steps.txt');
                rewrite(t);
	        writeln(t, 'a': 3, 'sum':10);
                close(t);
                steps(n, x, 'steps.txt');
        end;
        write('Подсчет выполнен. Пожалуйста, проверьте файл calcRes.txt');
        readln;
end.



