program linkedList;
uses crt;
type
        ptrNode = ^node;
        node = record
                data: integer;
                ptrNext: ptrNode;
                end;

procedure createList(var first, last: ptrNode; data: integer);
var
        cur: ptrNode;
begin
        new(cur);
        cur^.data := data;
        cur^.ptrNext := first;
        first := cur;
        last := cur;
end;

function findNode(var first: ptrNode; n: byte): ptrNode;
var
        i: byte;
        cur: ptrNode;
begin
        i := 1;
        cur := first;
        while ((i <> n) and (cur <> NIL)) do
        begin
                cur := cur^.ptrNext;
                i := i + 1;
        end;
        findNode := cur;
end;

function getLen(var first: ptrNode): byte;
var
        cur: ptrNode;
        i: byte;
begin
        i := 0;
        cur := first;
        while(cur <> NIL) do
        begin
                i := i + 1;
                cur := cur^.ptrNext;
        end;
        getLen := i;
end;

procedure addL(var first, last: ptrNode; data: integer);
var
        cur: ptrNode;
begin
        if(first = NIL) then
                createList(first, last, data)
        else
        begin
                new(cur);
                cur^.data := data;
                cur^.ptrNext := last^.ptrNext;
                last^.ptrNext := cur;
                last := cur;
        end;
end;

procedure addF(var first, last: ptrNode; data: integer);
var
        cur: ptrNode;
begin
        if(first = NIL) then
                createList(first, last, data)
        else
        begin
                new(cur);
                cur^.data := data;
                cur^.ptrNext := first;
                first := cur;
        end;
end;

procedure addByI(var first, last: ptrNode; n: byte; data: integer);
var
        cur, pred: ptrNode;
begin
        if(n = 1) then
                addF(first, last, data)
        else if (n > getLen(first) + 1) then
                addL(first, last, data)
        else
        begin
                pred := findNode(first, n - 1);
                new(cur);
                cur^.data := data;
                cur^.ptrNext := pred^.ptrNext;
                pred^.ptrNext := cur;
        end;
end;

procedure delF(var first: ptrNode);
var
        cur: ptrNode;
begin
        if (first = NIL) then
                writeln('Список пуст')
        else
        begin
                cur := first;
                first := first^.ptrNext;
                dispose(cur);
        end;
end;

procedure delL(var first, last: ptrNode);
var
        cur, pred: ptrNode;
begin
        if (first = NIL) then
                writeln('Список пуст')
        else
        begin
                pred := findNode(first, getLen(first) - 1);
                cur := pred^.ptrNext;
                pred^.ptrNext := last^.ptrNext;
                last := pred;
                dispose(cur);
        end;
end;

procedure delByI(var first, last: ptrNode; n: byte);
var
        cur, pred, next: ptrNode;
begin
        if(n = 1) then
                delF(first)
        else if (n > getLen(first) + 1) then
                delL(first, last)
        else
        begin
                cur := findNode(first, n);
                pred := findNode(first, n - 1);
                next := findNode(first, n + 1);
                pred^.ptrNext := next;
                dispose(cur);
        end;
end;

procedure delList(var first: ptrNode);
var
        cur: ptrNode;
begin
        if(first = NIL) then
                writeln('Список пуст, удалять нечего')
        else
                while(first <> NIL) do
                        delF(first);
end;

procedure showList(var first: ptrNode);
var
        cur: ptrNode;
begin
        if(first = Nil) then
                writeln('Список пуст, показать нечего')
        else
        begin
                cur := first;
                while(cur <> NIL) do
                begin
                        writeln(cur^.data);
                        cur := cur^.ptrNext;
                        end;
        end;
end;

procedure showNode(var first: ptrNode; n: byte);
var
        cur: ptrNode;
begin
        cur := findNode(first, n);
        if(cur = NIL) then
                writeln('Данные не найдены')
        else
                writeln(cur^.data);
end;

var
        first: ptrNode;
        last: ptrNode;
begin
        clrscr;
        {Если индекс больше длины списка, то добавляю в конец, так же и с поиском: нахожу последнее звено}
        {Во всех add процедурах еcть возможность созать список}
        first := NIL;
        last := NIL;
        addL(first, last, 1);
        addL(first, last, 2);
        addL(first, last, 3);
        addL(first, last, 4);
        addL(first, last, 5);
        showList(first);
        delList(first);
        readln;
end.
