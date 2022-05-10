program changeWin;
uses crt;
const
        maxwin = 3;
type
        winrecord = record
                xl, yl, xr, yr: byte
                end;
        tmw = array[1..maxwin] of winrecord;
var
        i: integer;
        ch: char;
const
        win1: tmw = ((xl: 15; yl: 7; xr: 55; yr: 27),
                (xl: 9; yl: 4; xr: 51; yr: 26),
                (xl: 10; yl: 5; xr: 50; yr: 25));
        win2: tmw = ((xl: 75; yl: 7; xr: 115; yr: 27),
                (xl: 69; yl: 4; xr: 111; yr: 26),
                (xl: 70; yl: 5; xr: 110; yr: 25));
begin
        textBackground(Yellow);
        clrscr;

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

        {Второе окно}
        with win2[3] do
                window(xl, yl, xr, yr);
        textBackground(Red);
        clrscr;

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

        {Первое окно}
        with win1[3] do
                window(xl, yl, xr, yr);
        textBackground(LightCyan);
        clrscr;

        repeat
                ch := readkey;
                if ch = #0 then begin
                        ch := readkey;
                        if (ch = #77) then begin
                                textBackground(Red);
                                clrscr;
                                with win2[3] do
                                        window(xl, yl, xr, yr);
                                textBackground(LightCyan);
                                clrscr;
                        end
                        else if (ch = #75) then begin
                                textBackground(Red);
                                clrscr;
                                with win1[3] do
                                        window(xl, yl, xr, yr);
                                textBackground(LightCyan);
                                clrscr;
                        end;

                        {if (ch >= #72) and (ch <= #80) then
                                c := '*'
                        else
                                c := ' ';
                        case ch of
                                #72, #141: y := y - 1;
                                #80, #145: y := y + 1;
                                #77, #116: x := x + 1;
                                #75, #115: x := x - 1;
                                #49: begin
                                        x := 10;
                                        y := 10;
                                        gotoxy(x, y);
                                end;
                                #50: begin
                                        x := 15;
                                        y := 15;
                                        gotoxy(x, y);
                                end;
                                #51: begin
                                        x := 20;
                                        y := 20;
                                        gotoxy(x, y);
                                end;
                        end;
                        gotoxy(x, y);
                        write(c);}
                end;
        until ch = #27;

        readln;
end.
