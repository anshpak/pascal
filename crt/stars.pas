program udrl;
uses crt;
var
        x, y: integer;
        ch, c: char;
begin
        clrscr;
        x := 15;
        y := 15;
        gotoxy(x, y);
        write('*');
        repeat
                ch := readkey;
                if ch = #0 then begin
                        ch := readkey;
                        if (ch >= #72) and (ch <= #80) then
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
                        write(c);
                end;
        until ch = #27;
        readln;
end.
