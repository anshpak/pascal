program firstTaskKr;
const
        n=200;
var
        t: text;
        i, a: integer;
        temp: string;
begin
        assign(t,'squares.txt');

        rewrite(t);
        for i:=1 to n do
        begin
                writeln(t,i*i);
        end;
        close(t);

        reset(t);
        while not eof(t) do
        begin
                readln
                (t,i);
                readln;
                writeln(i);
        end;
        close(t);
        readln;
end.
