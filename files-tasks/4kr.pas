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
begin
        assign(t,'src/symbols.txt');
        assign(f,'src/symbols.dat');
        rewrite(t);
        rewrite(f);
        {�����뢠� ��䠢�� � ⥪�⮢� 䠩�}
        for i:=1 to L do
        begin
                if i mod 26 = 0 then
                        continue;
                writeln(t,alph[i mod 26]);
        end;
        close(t);
        {�����뢠� ����� �� ⥪�⮢��� � ⨯���஢����}
        reset(t);
        while not eof(t) do
        begin
                readln(t,a);
                write(f,a);
        end;
        close(t);
        {����� ������ k ᨬ�����, ��稭�� � n-� ����樨}
        seek(f,n-1);
        while not eof(f) do
        begin
                read(f,a);
                if filepos(f) = n+k+1 then
                        break;
                write(a);
        end;
        close(f);
        readln;
end.