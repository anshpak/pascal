program kr;
uses crt;
type
        ptrNode = ^node;
        node = record
                data: longint;
                ptrNext: ptrNode;
                end;
        tmas = array[1..1] of longint;
        massiv = ^tmas;
        {$r-}

procedure createList(var first: ptrNode; n: integer; stopN: longint);
var
        cur: ptrNode;
        i: integer;
        temp: longint;
begin
        randomize;
        new(cur);
        cur^.data := random(1000000);
        cur^.ptrNext := first;
        first := cur;
        i := 1;
        while (i <> n) do
        begin
                temp := random(1000000);
                if(temp = stopN) then
                        break;
                new(cur);
                cur^.data := temp;
                cur^.ptrNext := first;
                first := cur;
                i := i + 1;
        end;
end;

procedure writeLToFile(path: string; var first: ptrNode);
var
        f: file of longint;
        cur: ptrNode;
begin
        assign(f, path);
        rewrite(f);
        cur := first;
        while(cur <> Nil) do
        begin
                write(f, cur^.data);
                cur := cur^.ptrNext;
        end;
        close(f);
end;

function ifOdd(num: longint): boolean;
var
        s, x: longint;
begin
        s := 0;
        x := num;
        while(x <> 0) do
        begin
                s := s + (x mod 10);
                x := x div 10;
        end;
        if (s mod 2 = 1) then
                ifOdd := true
        else
                ifOdd := false;
end;

function getOddAmount(var first: ptrNode): integer;
var
        cur: ptrNode;
        i: integer;
begin
        cur := first;
        i := 0;
        while(cur <> NIL) do
        begin
                if(ifOdd(cur^.data)) then
                        i := i + 1;
                cur := cur^.ptrNext;
        end;
        getOddAmount := i;
end;

procedure delList(var first: ptrNode);
var
        cur: ptrNode;
begin
        if(first = NIL) then
                writeln('Список пуст, удалять нечего')
        else
                while(first <> NIL) do begin
                        cur := first;
                        first := first^.ptrNext;
                        dispose(cur);
                end;
end;

procedure fillMas(var odd, even: massiv; var first: ptrNode);
var
        cur: ptrNode;
        i, j, m: integer;
begin
        cur := first;
        i := 1;
        j := 1;
        m := 1;
        while(cur <> NIL) do
        begin
                if(ifOdd(cur^.data)) then
                begin
                        odd^[j] := cur^.data;
                        j := j + 1;
                        i := i + 1;
                end
                else
                begin
                        even^[m] := cur^.data;
                        m := m + 1;
                        i := i + 1;
                end;
                cur := cur^.ptrNext;
        end;
end;

procedure showMas(var mas: massiv; size: integer);
var
        i: integer;
begin
        for i := 1 to size do
        begin
                writeln(mas^[i]);
        end;
end;

const
        n = 30;
        stopN = 200;

var
        first: ptrNode;
        Odd, Even: massiv;
        l, k: integer;
begin
        clrscr;
        createList(first, n, stopN);
        writeLToFile('Numbers.dat', first);
        l := getOddAmount(first);
        k := n - l;
        getmem(Odd, l * sizeof(longint));
        getmem(Even, k * sizeof(longint));
        fillMas(Odd, Even, first);
        textbackground(5);
        textcolor(6);
        window(10, 5, 60, 10 + l);
        delay(1000);
        clrscr;
        writeln('Summa cifr nechetnye:');
        showMas(Odd, l);
        textbackground(6);
        textcolor(5);
        window(60, 5, 100, 10 + k);
        clrscr;
        writeln('Summa cifr chetnye:');
        showMas(Even, k);
        freemem(Even, k * sizeof(longint));
        freemem(Odd, l * sizeof(longint));
        delList(first);
        readln;
end.
