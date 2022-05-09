program okna;
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
const
        mw: tmw = ((xl: 10; yl: 5; xr: 15; yr: 10),
                (xl: 20; yl: 5; xr: 25; yr: 10),
                (xl: 30; yl: 5; xr: 35; yr: 10));
begin
        clrscr;
        for i := 1 to maxwin do begin
                with mw[i] do
                        window(xl, yl, xr, yr);
                clrscr;
                delay(1000);
        end;
        readln;
        for i := 1  to  maxwin  do begin
                with mw[i] do
                        window (xl, yl, xr, yr);
                delay(10000);
                writeln ('old');
        end;
        readln;
end.