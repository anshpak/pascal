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
        fTour = file of tour;

procedure showTour(var myTour: tour);
begin
        writeln('Country: ', myTour.country, '.');
        writeln('City: ', myTour.city, '.');
        writeln('Residence: ', myTour.residence, '.');
        writeln('Tour tipe: ', myTour.class, '.');
        writeln('Price: ', myTour.price, '.');
        writeln('Vacancies: ', myTour.vacancies, '.', #10#13);
end;

procedure showTextFile(var t: text);
var
        myTour: tour;
        i: byte;
begin
        while not eof(t) do begin
                readln(t, myTour.country);
                readln(t, myTour.city);
                readln(t, myTour.residence);
                readln(t, myTour.class);
                readln(t, myTour.price);
                readln(t, myTour.vacancies);
                showTour(myTour);
        end;
end;

procedure showTypeFile(var f: fTour);
var
        myTour: tour;
begin
        while not eof(f) do begin
                read(f, myTour);
                showTour(myTour);
        end;
end;

procedure fillTypeFile(var t: text; var f: fTour);
var
        myTour: tour;
begin
        while not eof(t) do begin
                readln(t, myTour.country);
                readln(t, myTour.city);
                readln(t, myTour.residence);
                readln(t, myTour.class);
                readln(t, myTour.price);
                readln(t, myTour.vacancies);
                write(f, myTour);
        end;
end;

var
        t: text;
        f: fTour;
        ch: char;
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
        fillTypeFile(t, f);
        repeat
                ch := readkey;
                case ch of
                        #49: begin
                                reset(t);
                                showTextFile(t);
                        end;
                        #50: begin
                                reset(f);
                                showTypeFile(f);
                        end;
                end;
        until ch = #27;
        close(t);
        readln;
end.
