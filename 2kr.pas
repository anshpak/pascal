program findKDigits;
const
        k=100;
        n=88;
        L=200;
var
        t: text;
        f: file of integer;
        i, a: integer;
begin
        {�������� ����묨 digits.txt}
        assign(t,'digits.txt');
        rewrite(t);
        for i:=1 to L do
        begin
                writeln(t,i);
        end;
        close(t);
        {��९��뢠� ����� �� digits.txt � digits.dat}
        assign(f,'digits.dat');
        assign(t,'digits.txt');
        rewrite(f);
        reset(t);
        while not eof(t) do
        begin
                read(t,a);
                write(f,a);
        end;
        close(t);
        {k ����� ����� ���, ��稭�� � n-� ����樨}
        seek(f,n-1);
        while not eof(f) do
        begin
                read(f,a);
                if(a=n+k+1) then
                        break;
                writeln(a);
        end;
        close(f);
        readln;
end.