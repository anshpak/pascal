program eleventhLab;
uses crt;
type
        sType = string[30];
        tour = record
                country: sType; {Страна}
                city: sType; {Город}
                residence: sType; {Место проживания (отель или дом отдыха)}
                class: sType; {Характер тура (коммерческий, оздоровительный и т. д.)}
                price: word; {Цена}
                vacancies: byte; {Количество свободных мест}
        end;
        fTour = file of tour;

procedure showMenu;
begin
        writeln('Vibirite optsiy:');
        writeln('1 - zapisat v tipizirovaniy file');
        writeln('2 - prochitat tipizirovanyi file');
        writeln('3 - dobavit tour');
        writeln('4 - redaktirovat tour');
        writeln('5 - udalit tour');
        writeln('6 - pokazat kommercheskiye');
        writeln('7 - pokazat otdyha');
        writeln('8 - try samih dorogix toura');
        writeln('Nazhmite klavishu ESC shtoby zaconchit rabotu...');
end;

procedure showBack;
begin
        writeln('*********************************************');
        writeln('Nazhmite klavishu 0, shtoby pokazat menu');
        writeln('Nazhmite klavishu ESC shtoby zaconchit rabotu...');
end;

procedure showTour(var myTour: tour);
begin
        write(myTour.country, '. ');
        write(myTour.city, '. ');
        write(myTour.residence, '. ');
        write(myTour.class, '. ');
        write(myTour.price, '. ');
        write(myTour.vacancies, '.', #10#13);
end;

{Для отладки}
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

procedure addTour(var f: fTour; country, city, residence, class: sType; price: word; vacancies: byte);
var
        myTour: tour;
begin
        myTour.country := country;
        myTour.city := city;
        myTour.residence := residence;
        myTour.class := class;
        myTour.price := price;
        myTour.vacancies := vacancies;
        write(f, myTour);
end;

procedure editTour(var f: fTour; change: sType; tourNum, fieldNum: byte);
var
        myTour, tempTour: tour;
        fTemp: fTour;
        numTmp: integer;
begin
        assign(fTemp, 'temp.dat');
        rewrite(fTemp);
        while filePos(f) <> tourNum - 1  do begin
                read(f, tempTour);
                write(fTemp, tempTour);
        end;

        read(f, myTour);
        case fieldNum of
                1: myTour.country := change;
                2: myTour.city := change;
                3: myTour.residence := change;
                4: myTour.class := change;
                5: begin
                        val(change, numTmp);
                        myTour.price := numTmp;
                end;
                6: begin
                        val(change, numTmp);
                        myTour.vacancies := numTmp;
                end;
        end;

        write(fTemp, myTour);

        while not eof(f) do begin
                read(f, tempTour);
                write(fTemp, tempTour);
        end;

        seek(f, 0);
        seek(fTemp, 0);
        truncate(f);
        while not eof(fTemp) do begin
                read(fTemp, tempTour);
                write(f, tempTour);
        end;

        close(fTemp);
        erase(fTemp);
end;

procedure delTour(var f: fTour; tourNum: byte);
var
        fTemp: fTour;
        tempTour: tour;
begin
        seek(f, 0);
        assign(fTemp, 'temp.dat');
        rewrite(fTemp);
        while filePos(f) <> tourNum - 1  do begin
                read(f, tempTour);
                write(fTemp, tempTour);
        end;

        seek(f, filePos(f) + 1);

        while not eof(f) do begin
                read(f, tempTour);
                write(fTemp, tempTour);
        end;

        seek(f, 0);
        seek(fTemp, 0);
        truncate(f);
        while not eof(fTemp) do begin
                read(fTemp, tempTour);
                write(f, tempTour);
        end;

        close(fTemp);
        erase(fTemp);
end;

procedure showCommercial(var f: fTour);
var
        myTour: tour;
begin
        while not eof(f) do begin
                read(f, myTour);
                if (myTour.class = 'commercial') then
                        showTour(myTour);
        end;
end;

procedure showWellness(var f: fTour);
var
        myTour: tour;
begin
        while not eof(f) do begin
                read(f, myTour);
                if (myTour.class = 'wellness') then
                        showTour(myTour);
        end;
end;

procedure popMaxPrice(var f: fTour);
var
        myTour, tempTour: tour;
        imax : byte;
begin
        seek(f, 0);

        read(f, tempTour);
        myTour := tempTour;

        while not eof(f) do begin
                read(f, tempTour);
                if (tempTour.price > myTour.price) then begin
                        myTour := tempTour;
                        imax := filePos(f);
                end;
        end;

        showTour(myTour);
        delTour(f, imax);
end;

procedure showExpensive(var f: fTour);
var
        myTour, tempTour: tour;
        fTmp: fTour;
        max, max1, max2: word;
        imax, imax1, imax2: byte;
begin
        assign(fTmp, 'ftmp.dat');
        rewrite(fTmp);
        while not eof(f) do begin
                read(f, tempTour);
                write(fTmp, tempTour);
        end;

        popMaxPrice(fTmp);
        popMaxPrice(fTmp);
        popMaxPrice(fTmp);

        close(fTmp);
        erase(fTmp);
end;

var
        t: text;
        f: fTour;
        ch: char;
        country, city, residence, class, change: sType;
        price: word;
        vacancies, variant, changeNum, delNum, fieldNum: byte;

begin
        clrscr;
        assign(t, 'tour-agency.txt');
        assign(f, 'tour-agency.dat');
        reset(t);
        rewrite(f);
        showMenu;
        repeat
                ch := readkey;
                case ch of
                        #49: begin
                                reset(t);
                                clrscr;
                                fillTypeFile(t, f);
                                showBack;
                        end;
                        #50: begin
                                seek(f, 0);
                                clrscr;
                                showTypeFile(f);
                                showBack;
                        end;
                        #51: begin
                                clrscr;
                                writeln('Enter the country of a tour:');
                                readln(country);
                                writeln('Enter the city of a tour:');
                                readln(city);
                                writeln('Enter the residence of a tour:');
                                readln(residence);
                                writeln('Enter the type of a tour:');
                                readln(class);
                                writeln('Enter the price of a tour:');
                                readln(price);
                                writeln('Enter the number of vacancies of a tour:');
                                readln(vacancies);
                                seek(f, fileSize(f));
                                addTour(f, country, city, residence, class, price, vacancies);
                                showBack;
                        end;
                        #52: begin
                                clrscr;
                                writeln('Kakoy tour hotite izmenit?');
                                readln(changeNum);
                                writeln('Kakoy parametr toura hotite izmenyat?');
                                writeln('1 - country');
                                writeln('2 - city');
                                writeln('3 - residence');
                                writeln('4 - type');
                                writeln('5 - price');
                                writeln('6 - vacancies');
                                readln(variant);
                                case variant of
                                        1: begin
                                                clrscr;
                                                writeln('Vvedite country:');
                                                readln(change);
                                                fieldNum := 1;
                                        end;
                                        2: begin
                                                clrscr;
                                                writeln('Vvedite city:');
                                                readln(change);
                                                fieldNum := 2;
                                        end;
                                        3: begin
                                                clrscr;
                                                writeln('Vvedite residence:');
                                                readln(change);
                                                fieldNum := 3;
                                        end;
                                        4: begin
                                                clrscr;
                                                writeln('Vvedite type:');
                                                readln(change);
                                                fieldNum := 4;
                                        end;
                                        5: begin
                                                clrscr;
                                                writeln('Vvedite price:');
                                                readln(change);
                                                fieldNum := 5;
                                        end;
                                        6: begin
                                                clrscr;
                                                writeln('Vvedite vacncies:');
                                                readln(change);
                                                fieldNum := 6;
                                        end;
                                end;
                                seek(f, 0);
                                editTour(f, change, changeNum, fieldNum);
                                showBack;
                        end;
                        #53: begin
                                seek(f, 0);
                                clrscr;
                                writeln('Kakoy tour hotite udalit?');
                                readln(delNum);
                                delTour(f, delNum);
                                showBack;
                        end;
                        #54: begin
                                seek(f, 0);
                                clrscr;
                                showCommercial(f);
                                showBack;
                        end;
                        #55: begin
                                seek(f, 0);
                                clrscr;
                                showWellness(f);
                                showBack;
                        end;
                        #56: begin
                                seek(f, 0);
                                clrscr;
                                showExpensive(f);
                        end;
                        #48: begin
                                clrscr;
                                showMenu;
                        end;
                end;
        until ch = #27;
        close(t);
end.
