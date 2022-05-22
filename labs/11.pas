program temp;
{$R-}
uses crt;
const
        maxwin = 3;
type
        letter = record
                counter: integer;
                symbol: char;
        end;
        letters = array['a'..'z'] of letter;
        winrecord = record
                xl, yl, xr, yr: byte
                end;
        tmw = array[1..maxwin] of winrecord;
const
        win1: tmw = ((xl: 15; yl: 7; xr: 55; yr: 27),
                (xl: 9; yl: 4; xr: 51; yr: 26),
                (xl: 10; yl: 5; xr: 50; yr: 25));
        win2: tmw = ((xl: 75; yl: 7; xr: 115; yr: 27),
                (xl: 69; yl: 4; xr: 111; yr: 26),
                (xl: 70; yl: 5; xr: 110; yr: 25));

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
        {�᫨ ����������� �஢���� ࠡ��� ��楤���.}
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
                        {�� ���� �ॡ�� �஢�ન.
                        ��祬�-� �஡�� ��⠥��� ᨬ�����,
                        ����� ��室���� � ��䠢��.}                                                 {1}
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

        {��� ��������� �஢�ப.}
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

var
        t1, t2: text;
begin
        clrscr;
        assign(t1, 'src\poem.txt');
        assign(t2, 'src\letters.txt');
        reset(t1);
        rewrite(t2);
        getLetters(t1, t2);

        reset(t1);
        reset(t2);

        textBackground(Yellow);
        clrscr;

        {���� ��ࢮ�� ����}
        with win1[1] do
                window(xl, yl, xr, yr);
        textBackground(DarkGray);
        clrscr;

        {������� ��ࢮ�� ����}
        with win1[2] do
                window(xl, yl, xr, yr);
        textBackground(White);
        clrscr;

        {��ࢮ� ����}
        with win1[3] do
                window(xl, yl, xr, yr);
        textBackground(5);
        clrscr;

        textBackGround(5);
        textColor(0);
        writeFromFile(t1);

        {���� ��ண� ����}
        with win2[1] do
                window(xl, yl, xr, yr);
        textBackground(DarkGray);
        clrscr;

        {������� ��ண� ����}
        with win2[2] do
                window(xl, yl, xr, yr);
        textBackground(White);
        clrscr;

        {��஥ ����}
        with win2[3] do
                window(xl, yl, xr, yr);
        textBackground(5);
        clrscr;

        textBackGround(5);
        textColor(0);
        writeFromFile(t2);

        close(t2);
        close(t1);
        readln;
end.
