program linkedList;
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

function getListLen(var first: ptrNode): byte;
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
        getListLen := i;
end;

procedure addToEnd(var first, last: ptrNode; data: integer);
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

procedure addToStart(var first, last: ptrNode; data: integer);
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

procedure addByIndex(var first, last: ptrNode; n: byte; data: integer);
var
        cur, pred: ptrNode;
begin
        if(n = 1) then
                addToStart(first, last, data)
        else if (n > getListLen(first) + 1) then
                addToEnd(first, last, data)
        else
        begin
                pred := findNode(first, n - 1);
                new(cur);
                cur^.data := data;
                cur^.ptrNext := pred^.ptrNext;
                pred^.ptrNext := cur;
        end;
end;

procedure showList(var first: ptrNode);
var
        cur: ptrNode;
begin
        cur := first;
        while(cur <> NIL) do
        begin

                writeln(cur^.data);
                cur := cur^.ptrNext;
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
        first := NIL;
        last := NIL;
        addToEnd(first, last, 5);
        addToEnd(first, last, 0);
        addToEnd(first, last, 11);
        addToEnd(first, last, 9);
        addToEnd(first, last, 4);
        addToEnd(first, last, -4);
        addToStart(first, last, 0);
        addToStart(first, last, -3);
        addByIndex(first, last, 7, 7);
        addByIndex(first, last, 7, 7);
        addByIndex(first, last, 7, 7);
        addByIndex(first, last, 11, 1000);
        {Если индекс больше длины списка, добавляю в конец, так же и с поиском: нахожу последнее}
        showList(first);
        readln;
end.