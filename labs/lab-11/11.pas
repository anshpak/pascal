program eleventhLab;
uses crt, tourAgency;
const
        maxwin = 3;
type
        winrecord = record
                xl, yl, xr, yr: byte
                end;
        tmw = array[1..maxwin] of winrecord;
const
        win1: tmw = ((xl: 13; yl: 4; xr: 115; yr: 13),
                (xl: 9; yl: 2; xr: 111; yr: 12),
                (xl: 10; yl: 3; xr: 110; yr: 11));
        win2: tmw = ((xl: 13; yl: 17; xr: 115; yr: 29),
                (xl: 9; yl: 15; xr: 111; yr: 28),
                (xl: 10; yl: 16; xr: 110; yr: 27));

procedure firstWin;
begin
        {Тень первого окна}
        with win1[1] do
                window(xl, yl, xr, yr);
        textBackground(DarkGray);
        clrscr;

        {обводка первого окна}
        with win1[2] do
                window(xl, yl, xr, yr);
        textBackground(White);
        clrscr;
        textColor(Black);
        write(' Tour Agency');
        {Если изменить размер окон, вручную придется менять вывод этих точек.}
        write('...':90);

        {Первое окно}
        with win1[3] do
                window(xl, yl, xr, yr);
        textBackground(LightCyan);
        clrscr;
        textColor(Black);
end;

procedure secondWin;
begin
        {Тень второго окна}
        with win2[1] do
                window(xl, yl, xr, yr);
        textBackground(DarkGray);
        clrscr;

        {обводка второго окна}
        with win2[2] do
                window(xl, yl, xr, yr);
        textBackground(White);
        clrscr;
        textColor(Black);
        write(' Result');
        {Если изменить размер окон, вручную придется менять вывод этих точек.}
        write('...':95);

        {Второе окно}
        with win2[3] do
                window(xl, yl, xr, yr);
        textBackground(LightCyan);
        clrscr;
        textColor(Black);
end;

var
        t: text;
        f: fTour;
        ch: char;
        country, city, residence, class, change: sType;
        price: word;
        vacancies, n, variant, changeNum, delNum, fieldNum: byte;

begin   textBackground(Yellow);
        clrscr;
        assign(t, 'tour-agency.txt');
        assign(f, 'tour-agency.dat');
        reset(t);
        rewrite(f);
        fillTypeFile(t, f); {Копирую все данные из текстового в типизированный файл}
        firstWin;
        showMenu;
        repeat
                n := filesize(f);
                ch := readkey;
                case ch of
                        #49: begin
                                seek(f, 0);
                                secondWin;
                                showTypeFile(f);
                                firstWin;
                                showMenu;
                        end;
                        #50: begin
                                secondWin;
                                writeln('Vvedite stranu:');
                                readln(country);
                                clrscr;
                                writeln('Vvedite gorod:');
                                readln(city);
                                clrscr;
                                writeln('Vvedite mesto prozhivaniya:');
                                readln(residence);
                                clrscr;
                                writeln('Vvedite tip (wellnes, commercial):');
                                readln(class);
                                clrscr;
                                writeln('Vvedite tsenu:');
                                readln(price);
                                clrscr;
                                writeln('Vvedite kolichestvo svobodnyh mest:');
                                readln(vacancies);
                                clrscr;
                                writeln('Tur uspeshno dobavlen!');
                                seek(f, n);
                                addTour(f, country, city, residence, class, price, vacancies);
                                firstWin;
                                showMenu;
                        end;
                        #51: begin
                                secondWin;
                                writeln('Kakoy tur hotite izmenit?');
                                readln(changeNum);
                                while (changeNum < 1) or (changeNum > n) do begin
                                        clrscr;
                                        writeln('Nuzhno vybrat tur ot 1 do ', n);
                                        readln(changeNum);
                                end;
                                clrscr;
                                writeln('Kakoy parametr tura hotite izmenit?');
                                writeln('1 - strana');
                                writeln('2 - gorod');
                                writeln('3 - mesto prozhivaniya');
                                writeln('4 - tip');
                                writeln('5 - tsena');
                                writeln('6 - kolichestvo svobodnyh mest');
                                readln(variant);
                                case variant of
                                        1: begin
                                                clrscr;
                                                writeln('Vvedite stranu:');
                                                readln(change);
                                                fieldNum := 1;
                                        end;
                                        2: begin
                                                clrscr;
                                                writeln('Vvedite gorod:');
                                                readln(change);
                                                fieldNum := 2;
                                        end;
                                        3: begin
                                                clrscr;
                                                writeln('Vvedite mesto prozhivaniya:');
                                                readln(change);
                                                fieldNum := 3;
                                        end;
                                        4: begin
                                                clrscr;
                                                writeln('Vvedite tip:');
                                                readln(change);
                                                fieldNum := 4;
                                        end;
                                        5: begin
                                                clrscr;
                                                writeln('Vvedite tsenu:');
                                                readln(change);
                                                fieldNum := 5;
                                        end;
                                        6: begin
                                                clrscr;
                                                writeln('Vvedite kolichestvo svobodnyh mest:');
                                                readln(change);
                                                fieldNum := 6;
                                        end;
                                end;
                                seek(f, 0);
                                editTour(f, change, changeNum, fieldNum);
                                clrscr;
                                writeln('Tur uspeshno otredactirovan!');
                                firstWin;
                                showMenu;
                        end;
                        #52: begin
                                secondWin;
                                seek(f, 0);
                                writeln('Kakoy tur hotite udalit?');
                                readln(delNum);
                                while (delNum < 1) or (delNum > n) do begin
                                        clrscr;
                                        writeln('Nuzhno vybirat tur ot 1 do ', n);
                                        readln(delNum);
                                end;
                                delTour(f, delNum);
                                clrscr;
                                writeln('Tur byl udalen!');
                                firstWin;
                                showMenu;
                        end;
                        #53: begin
                                seek(f, 0);
                                secondWin;
                                showCommercial(f);
                                firstWin;
                                showMenu;
                        end;
                        #54: begin
                                seek(f, 0);
                                secondWin;
                                showWellness(f);
                                firstWin;
                                showMenu;
                        end;
                        #55: begin
                                seek(f, 0);
                                secondWin;
                                showExpensive(f);
                                firstWin;
                                showMenu;
                        end;
                end;
        until ch = #27;
        close(t);
end.
