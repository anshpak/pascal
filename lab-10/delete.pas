program test;
uses crt;
type
        letters = array['a'..'z'] of integer;

procedure getLetters(st: string);
var
        ch, p: char;
        i: byte;
        alphabet: letters;
begin
        for ch := 'a' to 'z' do
                alphabet[ch] := 0;

        i := ord(st[0]);
        while i <> 0 do begin
                p := st[i];
                inc(alphabet[p]);
                i := i - 1;
        end;

        for ch := 'a' to 'z' do begin
                write(ch, ': ', alphabet[ch]);
                writeln;
        end;
end;

var
        st: string;
begin
        st := 'oueyvfilwevfwihswdsefwouegfwouef';
        getLetters(st);
        readln;
end.