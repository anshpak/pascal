program tenthLab;
uses crt;
type
        symbols = record
                count: array[1..26] of integer;
                ch: array[1..26] of char;
        end;
const
        alph = 'abcdefghijklmnopqrstuvwxyz';

procedure getLetters(var t1, t2: text);
var
        letters: symbols;
        ch: char;
        i, p, lastIter: byte;
        temp: integer;
begin
        for i := 1 to 26 do
                letters.count[i] := 0;
        for i := 1 to 26 do
                letters.ch[i] := alph[i];
        while not eof(t1) do begin
                read(t1, ch);
                p := pos(ch, alph);
                if p <> 0 then
                        inc(letters.count[p]);
        end;
        {for i := 1 to 26 do
                write(t2, letters.ch[i], ': ', letters.count[i], #13);}
        while temp <> 0 do begin
                temp := 0;
                for i := 1 to 26 do
                        if temp < letters.count[i] then begin
                                temp := letters.count[i];
                                lastIter := i;
                                end;
                if temp <> 0 then begin
                        writeln(letters.ch[lastIter], ': ', temp);
                        write(t2, letters.ch[lastIter], ': ', letters.count[lastIter], #13);
                        end;
                letters.count[lastIter] := 0;
        end;
        readln;
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
end.
