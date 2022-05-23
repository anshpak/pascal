unit poem;
{$R-}
interface

type
        letter = record
                counter: integer;
                symbol: char;
        end;
        letters = array['a'..'z'] of letter;

procedure swap(var x, y: letter);
procedure sortArr(var mas: letters);
procedure countLetters(var mas: letters; st: string);
procedure getLetters(var t1, t2: text);
procedure writeFromFile(var t: text);

implementation

procedure swap(var x, y: letter);                                                                      {3}
var
        t: letter;
begin
        t := x;
        x := y;
        y := t;
end;

procedure sortArr(var mas: letters);
var
        c, h: char;
begin
        for c := 'a' to 'y' do begin                                                                    {2}
                for h := 'a' to chr(ord('z') - ord(c) + 96) do
                        if mas[h].counter < mas[chr(ord(h) + 1)].counter then begin
                                swap(mas[h], mas[chr(ord(h) + 1)]);
                        end;
        {Если понадобится проверить работу процедуры.}
        {for h := 'a' to 'z' do begin
                write(mas[h].symbol, ' ');
                write(mas[h].counter, ' ');
                writeln;
        end;
        writeln('***************');
        readln;}
        end;
end;

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
                if (ch in alphabet) then begin
                        {Это место требует проверки.
                        Почему-то пробел считается символом,
                        который находится в алфавите.}                                                 {1}
                        {writeln('Simvol ', ch, ' prisutstvuet v alfavite.');
                        readln;}
                        inc(mas[ch].counter);
                end;
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
                readln(t1, strTemp);
                countLetters(poem, strTemp);
        end;

        {Для возможных проверок.}
        {for ch := 'a' to 'z' do begin
                write(poem[ch].symbol, ' ');
                write(poem[ch].counter, ' ');
                writeln;
        end;
        readln;}

        sortArr(poem);

        {for ch := 'a' to 'z' do begin
                write(poem[ch].symbol, ' ');
                write(poem[ch].counter, ' ');
                writeln;
        end;
        readln;}

        ch := 'a';
        repeat
                writeln(t2, poem[ch].symbol, ': ', poem[ch].counter);
                inc(ch);
        until (poem[ch].counter = 0) or (ch = 'z');
end;

procedure writeFromFile(var t: text);
var
        i: integer;
        str: string;
begin
        while not eof(t) do begin
                readln(t, str);
                writeln(str);
        end;
end;

end.
