program eleventhLab;
uses crt;
type
        tour = record
                country: string[30]; {��࠭�}
                city: string[30]; {��த}
                residence: string[30]; {���� �஦������ (�⥫� ��� ��� ����)}
                class: string[30]; {��ࠪ�� ��� (�������᪨�, ����஢�⥫�� � �. �.)}
                price: word; {����}
                vacancies: byte; {������⢮ ᢮������ ����}
        end;

procedure showFile(var t: text);
var
        strTemp: string[30];
        i: byte;
begin
        while not eof(t) do begin
                readln(t, strTemp);
                writeln('Country: ', strTemp, '.');
                readln(t, strTemp);
                writeln('City: ', strTemp, '.');
                readln(t, strTemp);
                writeln('Residence: ', strTemp, '.');
                readln(t, strTemp);
                writeln('Tour tipe: ', strTemp, '.');
                readln(t, strTemp);
                writeln('Price: ', strTemp, '.');
                readln(t, strTemp);
                writeln('Vacancies: ', strTemp, '.');
        end;
end;

var
        t: text;
        f: file of tour;
begin
        {�����:}
        {����� �������᪨� ����.
        ����� ���� ����.
        ����� �� ᠬ�� ��ண�� ���.
        ����� �� ᠬ�� ��襢�� ���.}
        clrscr;
        assign(t, 'tour-agency.txt');
        assign(f, 'tour-agency.dat');
        reset(t);
        rewrite(f);
        showFile(t);
        close(t);
        readln;
end.
