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

procedure delFirst(var first: ptrNode);
var
        cur: ptrNode;
begin
        if (first = NIL) then
                writeln('���᮪ ����')
        else
        begin
                cur := first;
                first := first^.ptrNext;
                dispose(cur);
        end;
end;

procedure delLast(var first, last: ptrNode);
var
        cur, pred: ptrNode;
begin
        if (first = NIL) then
                writeln('���᮪ ����')
        else
        begin
                pred := findNode(first, getListLen(first) - 1);
                cur := pred^.ptrNext;
                pred^.ptrNext := last^.ptrNext;
                last := pred;
                dispose(cur);
        end;
end;

procedure delByIndex(var first, last: ptrNode; n: byte);
var
        cur, pred, next: ptrNode;
begin
        if(n = 1) then
                delFirst(first)
        else if (n > getListLen(first) + 1) then
                delLast(first, last)
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
                writeln('���᮪ ����')
        else
                while(first <> NIL) do
                        delFirst(first);
end;

procedure showList(var first: ptrNode);
var
        cur: ptrNode;
begin
        if(first = Nil) then
                writeln('���᮪ ����')
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
                writeln('����� �� �������')
        else
                writeln(cur^.data);
end;

var
        first: ptrNode;
        last: ptrNode;
begin
        {�᫨ ������ ����� ����� ᯨ᪠, � �������� � �����, ⠪ �� � � ���᪮�: ��宦� ��᫥���� �����}
        {�� ��� add ��楤��� ���좮��������� ᮧ��� ᯨ᮪}
        first := NIL;
        last := NIL;
        delFirst(first);
        delLast(first, last);
        addToEnd(first, last, 1);
        addToEnd(first, last, 2);
        addToEnd(first, last, 3);
        addToEnd(first, last, 4);
        addToEnd(first, last, 5);
        showList(first);
        delList(first);
        readln;
end.
