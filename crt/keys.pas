program pr_key;
uses crt;
var
        ch : char;
begin
        clrscr;
        repeat
                ch := readkey;
                if ch = #0 then begin
                        ch := readkey;
                end
                else begin
                        write ('char: ');                                      {��䠢�⭮-��஢��}
                        if ch >= #32 then
                                write(ch, '. ')
                        else write('^ ', chr(ord(ch) + 64));                    {�ࠢ���騩 ᨬ���}
                end;
      writeln ('Ascii: ', ord(ch));
        until ch = #27;                                                        {��室 �� esc}
end.
