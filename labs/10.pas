program tenthLab;
uses crt;

procedure getLetters(var t1, t2: text);
var
        alph: string;
        letters: array[1..26] of integer;
        ch: char;
        i: integer;
begin
        alph := 'abcdefghijklmnopqrstuvwxyz';
        for i := 1 to 26 do
                letters[i] := 0;
        while not eof(t1) do begin
                read(t1, ch);
                for i := 1 to 26 do
                        if (ch = alph[i]) or (ch = upcase(alph[i])) then
                                letters[i] := letters[i] + 1;
        end;
        for i := 1 to 26 do
                write(t2, alph[i], ': ', letters[i], #13);
end;

var
        t1, t2: text;

begin
        assign(t1, 'src\poem.txt');
        assign(t2, 'src\letters.txt');
        reset(t1);
        rewrite(t2);
        getLetters(t1, t2);
        close(t2);
        close(t1);
end.
