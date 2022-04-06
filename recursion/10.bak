program ten;
const
        n=2;
        m=1;

function Ack(n, m: word):word;
var
        r: word;
begin
        if n=0 then Ack:=m+1
        else
                if m=0 then
                        Ack:=Ack(n-1,1)
        else
        begin
                r:=Ack(n,m-1);
                Ack:=Ack(n-1,r);
        end;
end;

begin
        writeln(Ack(n,m));
        readln;
end.
