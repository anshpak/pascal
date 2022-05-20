program temp;
{$R-}
uses crt;
type
        letter = record
                counter: integer;
                symbol: char;
        end;
        letters = array['a'..'z'] of letter;

procedure countLetters(var mas: letters; st: string);
var
        alphabet: set of 'a'..'z';
        ch: char;
        i: integer;
begin
        alphabet := [];
        for ch := 'a' to 'z' do
                alphabet := alphabet + [ch];
        for i := 1 to length(st) do begin
                ch := lowercase(st[i]);
                if (ch in alphabet) then
                        inc(mas[ch].counter);
        end;
end;

procedure getLetters(var t1, t2: text);
var
        ch: char;
        poem: letters;
        strTemp: string;
begin
        for ch := 'a' to 'z' do begin
                poem[ch].counter := 0;
                poem[ch].symbol := ch;
        end;
        while not eof(t1) do begin
                writeln('*');
                readln(t1, strTemp);
                countLetters(poem, strTemp);
        end;

        for ch := 'a' to 'z' do
                writeln(t2, poem[ch].symbol, ': ', poem[ch].counter);

        for ch := 'a' to 'z' do begin
                write(poem[ch].counter, ' ');
                write(poem[ch].symbol, ' ');
        end;
end;


var
        t1, t2: text;
begin
        clrscr;
        assign(t1, 'src\poem.txt');
        assign(t2, 'src\letters.txt');
        reset(t1);
        rewrite(t2);
        getLetters(t1, t2);
        close(t2);
        close(t1);
        readln;
end.