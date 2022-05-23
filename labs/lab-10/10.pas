program tenthLab;
uses crt, poem;
const
        maxwin = 3;
type
        winrecord = record
                xl, yl, xr, yr: byte
                end;
        tmw = array[1..maxwin] of winrecord;
const
        win1: tmw = ((xl: 13; yl: 4; xr: 68; yr: 29),
                (xl: 9; yl: 2; xr: 64; yr: 28),
                (xl: 10; yl: 3; xr: 63; yr: 27));
        win2: tmw = ((xl: 74; yl: 4; xr: 115; yr: 29),
                (xl: 70; yl: 2; xr: 111; yr: 28),
                (xl: 71; yl: 3; xr: 110; yr: 27));
var
        t1, t2: text;
begin
        clrscr;
        assign(t1, 'poem.txt');
        assign(t2, 'letters.txt');
        reset(t1);
        rewrite(t2);
        getLetters(t1, t2);

        reset(t1);
        reset(t2);

        textBackground(Yellow);
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
        textColor(Black);
        write(' poem.txt');
        {Если изменить размер окон, вручную придется менять вывод этих точек.}
        write('...':46);

        {Первое окно}
        with win1[3] do
                window(xl, yl, xr, yr);
        textBackground(LightCyan);
        clrscr;
        textColor(Black);
        writeFromFile(t1);

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
        write(' letters.txt');
        {Если изменить размер окон, вручную придется менять вывод этих точек.}
        write('...':29);

        {Второе окно}
        with win2[3] do
                window(xl, yl, xr, yr);
        textBackground(LightCyan);
        clrscr;
        textColor(Black);
        writeFromFile(t2);

        close(t2);
        close(t1);
        readln;
end.
