program firstTaskKr;
const
        n=200;
        k=113;
var
        t: text;
        i, a: integer;
        temp: string;
begin
        assign(t,'squares.txt');
        {�����뢠� �᫠ � ������ �� 1 �� n � ⥪�⮢� 䠩�}
        {rewrite(t);
        for i:=1 to n do
        begin
                writeln(t,i*i);
        end;
        close(t);}
        {���뢠� 䠩� ��� �⥭�� � �஢����, ��� ����ᠫ��� �᫠}
        {reset(t);
        while not eof(t) do
        begin
                readln
                (t,a);
                readln;
                writeln(a);
        end;
        close(t);}
        {��宦� k-� ����}
        reset(t);
        i:=1;
        while not eof(t) do
        begin
                readln(t,a);
                if(a=k*k) then
                begin
                        writeln(a);
                        break;
                end;
        end;
        readln;
end.
