program findKSymbols;
const
        k=15;
        n=10;
        L=200;
        alph='abcdefghijklmnopqrstvwxyz';
var
        t: text;
        f: file of char;
        i:integer;
        a: char;

procedure writeAlphToTxt(tPath: string);
var
        t: text;
        i: integer;
begin
        assign(t,tPath);
        rewrite(t);
        for i:=1 to L do
        begin
                if i mod 26 = 0 then
                        continue;
                writeln(t,alph[i mod 26]);
        end;
        close(t);
end;

procedure writeTxtToDat(tPath, fPath: string);
var
        t: text;
        f: file of char;
        a: char;
begin
        assign(t,tPath);
        assign(f,fPath);
        reset(t);
        rewrite(f);
        while not eof(t) do
        begin
                readln(t,a);
                write(f,a);
        end;
        close(f);
        close(t);
end;

procedure getWord(fPath: string;n, k: integer);
var
        f: file of char;
begin
        assign(f,fPath);
        reset(f);
        seek(f,n-1);
        while not eof(f) do
        begin
                read(f,a);
                if filepos(f) = n+k+1 then
                        break;
                write(a);
        end;
        close(f);
end;

begin
        {Записываю алфавит в текстовый файл}
        writeAlphToTxt('src/symbols.txt');
        {Записываю данные из текстового в типизированный}
        writeTxtToDat('src/symbols.txt','src/symbols.dat');
        {Слово длиной k символов, начиная с n-й позиции}
        getWord('src/symbols.dat',n,k);
        readln;
end.