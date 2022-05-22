program eleventhLab;
uses crt;
type
        tour = record
                country: string[30]; {Страна}
                city: string[30]; {Город}
                residence: string[30]; {Место проживания (отель или дом отдыха)}
                class: string[30]; {Характер тура (коммерческий, оздоровительный и т. д.)}
                price: word; {Цена}
                vacancies: byte; {Количество свободных мест}
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
        {Задачи:}
        {Выбрать коммерческие туры.
        Выбрать туры отдыха.
        Выбрать три самых дорогих тура.
        Выбрать три самых дешевых тура.}
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
