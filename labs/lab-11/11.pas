program eleventhLab;
uses crt, tourAgency;

var
        t: text;
        f: fTour;
        ch: char;
        country, city, residence, class, change: sType;
        price: word;
        vacancies, n, variant, changeNum, delNum, fieldNum: byte;

begin
        clrscr;
        assign(t, 'tour-agency.txt');
        assign(f, 'tour-agency.dat');
        reset(t);
        rewrite(f);
        fillTypeFile(t, f); {Копирую все данные из текстового в типизированный файл}
        showMenu;
        repeat
                n := filesize(f);
                ch := readkey;
                case ch of
                        #49: begin
                                clrscr;
                                seek(f, 0);
                                showTypeFile(f);
                                showBack;
                        end;
                        #50: begin
                                clrscr;
                                writeln('Vvedite stranu:');
                                readln(country);
                                writeln('Vvedite gorod:');
                                readln(city);
                                writeln('Vvedite mesto prozhivaniya:');
                                readln(residence);
                                writeln('Vvedite tip (wellnes, commercial):');
                                readln(class);
                                writeln('Vvedite tsenu:');
                                readln(price);
                                writeln('Vvedite kolichestvo svobodnyh mest:');
                                readln(vacancies);
                                seek(f, n);
                                addTour(f, country, city, residence, class, price, vacancies);
                                showBack;
                        end;
                        #51: begin
                                clrscr;
                                writeln('Kakoy tur hotite izmenit?');
                                readln(changeNum);
                                while (changeNum < 1) or (changeNum > n) do begin
                                        writeln('Vybirite tur ot 1 do ', n);
                                        readln(changeNum);
                                end;
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
                                showBack;
                        end;
                        #52: begin
                                seek(f, 0);
                                clrscr;
                                writeln('Kakoy tur hotite udalit?');
                                readln(delNum);
                                while (delNum < 1) or (delNum > n) do begin
                                        writeln('Vybirite tur ot 1 do ', n);
                                        readln(delNum);
                                end;
                                delTour(f, delNum);
                                showBack;
                        end;
                        #53: begin
                                seek(f, 0);
                                clrscr;
                                showCommercial(f);
                                showBack;
                        end;
                        #54: begin
                                seek(f, 0);
                                clrscr;
                                showWellness(f);
                                showBack;
                        end;
                        #55: begin
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
