program ninethLab;
uses crt;

function power(num: real; n: integer): real;
var
        i: integer;
        p: real;
begin
        p := 1;
        for i := 1 to n do
                p := p * num;
        power := p;
end;

function integrateTan(n : integer; x: real): real;
begin
        if (n = 0) then
                integrateTan := x
        else if(n = 1) then
                integrateTan := -ln(abs(cos(x)))
        else
                integrateTan := power(sin(x) / cos(x), n - 1) / (n - 1) - integrateTan(n - 2, x);
end;

const
        a = -Pi / 4;
        b = Pi / 6;
        n = 25;
var
        res: real;
        t: text;
begin
        res := integrateTan(n, b) - integrateTan(n, a);
        assign(t, 'src\integr.txt');
        rewrite(t);
        writeln(t, 'Dlya promezhutka:');
        writeln(t, 'a =', a:8:4, ',');
        writeln(t, 'b =', b:8:4, ',');
        writeln(t, 'stepeni n = ', n, ',');
        writeln(t, 'Integral ot tg^n poschitaetsya takim obrazom: ');
        writeln(t);
        writeln(t, a:8:4);
        writeln(t, '    _');
        writeln(t, '   | ');
        writeln(t, '   |  tg(x)^', n, ' =', res:8:4);
        writeln(t, '  _|');
        writeln(t);
        writeln(t, b:8:4);
        close(t);      {Krasivo}
        readln;
end.



