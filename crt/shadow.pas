program shadows;
uses crt;
const
        maxwin = 2;
        maxedges = 4;
type
        winrecord = record
                xl, yl, xr, yr: byte
                end;
        tmw = array[1..maxwin] of winrecord;
        edges = array[1..maxedges] of winrecord;
const
        mw: tmw = ((xl: 10; yl: 5; xr: 100; yr: 20),
                (xl: 18; yl: 7; xr: 108; yr: 22));
        sides: edges = ((xl: 9; yl: 4; xr: 101; yr: 4),
                (xl: 9; yl: 21; xr: 101; yr: 21),
                (xl: 9; yl: 5; xr: 9; yr: 20),
                (xl: 101; yl: 5; xr: 101; yr: 20));
var
        i: integer;
        M: word;
begin
        textBackGround(Yellow);
        clrscr;
        with mw[2] do
                window(xl, yl, xr, yr);
        textBackGround(DarkGray);
        clrscr;

        {Верхняя грань окна}
        with sides[1] do
                window(xl, yl, xr, yr);
        textBackGround(White);
        clrscr;

        with sides[2] do
                window(xl, yl, xr, yr);
        textBackGround(White);
        clrscr;

        with sides[3] do
                window(xl, yl, xr, yr);
        textBackGround(White);
        clrscr;

        with sides[4] do
                window(xl, yl, xr, yr);
        textBackGround(White);
        clrscr;

        with mw[1] do
                window(xl, yl, xr, yr);
        textBackGround(LightCyan);
        clrscr;

        readln;
end.

