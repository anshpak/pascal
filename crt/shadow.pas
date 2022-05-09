program shadows;
uses crt;
const
        maxwin = 2;
type
        winrecord = record
                xl, yl, xr, yr: byte
                end;
        tmw = array[1..maxwin] of winrecord;
const
        mw: tmw = ((xl: 10; yl: 5; xr: 100; yr: 20),
                (xl: 15; yl: 10; xr: 105; yr: 25));
var
        i: integer;
begin
        textBackGround(Yellow);
        clrscr;
        with mw[2] do
                window(xl, yl, xr, yr);
        textBackGround(DarkGray);
        clrscr;
        with mw[1] do
                window(xl, yl, xr, yr);
        textBackGround(LightCyan);
        clrscr;

        readln;
end.

