program cover;
uses crt;
var
        i: byte;
begin
        for i := 1 to 12 do begin
                clrscr;
                textbackground(5);
                window(i * 10 - 10 + 2, 1, i * 10, 50);
                clrscr;
        end;
        clrscr;
        textbackground(3);
        window(60, 25, 90, 55);
        clrscr;
        readln;
end.