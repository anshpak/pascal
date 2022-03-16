program sessionResult;
const
        n=5;
        m=3;
type
        student = record
        nameSurname: string[80];
        marks: array[1..n] of byte;
        end;

var
        t: text;
        a: array[1..m] of student;
        i, j: integer;
begin
        assign(t,'src/students.txt');
        rewrite(t);

        a[1].nameSurname:='Andrey Shpak';
        for i:=1 to n do
        begin
                a[1].marks[i]:=9;
        end;
        writeln(a[1].nameSurname);
        for i:=1 to n do
        begin
                writeln(a[1].marks[i]);
        end;

        a[2].nameSurname:='Stepan Mordachev';
        a[2].marks[1]:=9;
        a[2].marks[2]:=8;
        a[2].marks[3]:=2;
        a[2].marks[4]:=10;
        a[2].marks[5]:=4;
        writeln(a[2].nameSurname);
        for i:=1 to n do
        begin
                writeln(a[2].marks[i]);
        end;

        a[3].nameSurname:='Olga Pyshko';
        for i:=1 to n do
        begin
                a[3].marks[i]:=10;
        end;
        writeln(a[3].nameSurname);
        for i:=1 to n do
        begin
                writeln(a[3].marks[i]);
        end;

        {Записываю в текстовый файл}
        for i:=1 to m do
        begin
                writeln(t,a[i].nameSurname);
                for j:=1 to n do
                begin
                        writeln(t, a[i].marks[j]);
                end;
        end;
        close(t);
        readln;
end.