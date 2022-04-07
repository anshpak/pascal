program kr;
const
        c1=0;
        c2=1;
        c3=5;
        c4=11;
type
        mRow = array[1..1] of integer;
        ptrRow = ^mRow;
        {$r-}
        squareMatrix = array[1..1] of ptrRow;
        myMatrix = ^squareMatrix;
var
        A: myMatrix;
        fours: integer;
        n, m, i, j: byte;

{��楤�� ���������� ⨯���஢������ 䠩�� ��砩�묨 �᫠��}
procedure RandomsInFile(fPath: string; c1, c2, c3, c4: integer; n, m: byte);
var
        f: file of integer;
        numArray: array[1..4] of integer;
        i, j: integer;
begin
        randomize;
        assign(f,fPath);
        rewrite(f);
        numArray[1]:=c1;
        numArray[2]:=c2;
        numArray[3]:=c3;
        numArray[4]:=c4;
        for i:=1 to n do
                for j:=1 to m do
                write(f,numArray[random(4)+1]);
        close(f);
end;

{��楤�� ����� � ������ �� ⨯���஢������ 䠩��}
procedure matrixFromFile(fPath: string; var matrix: myMatrix; n, m: byte);
var
        f: file of integer;
        i, j, a: integer;
begin
        assign(f,fPath);
        reset(f);
        for i:=1 to n do
                for j:=1 to m do
                begin
                        read(f,a);
                        matrix^[i]^[j]:=a;
                end;
        close(f);
end;

{���楤�� �뢮�� ������}
procedure showMatrix(var matrix: myMatrix; n, m: byte);
var
        i,j:integer;
begin
        for i:=1 to n do
                begin
                for j:=1 to m do
                        write(matrix^[i]^[j]:6);
                writeln();
                writeln();
                end;
end;

{��楤�� ���᪠ �⢥ப � �����}
function getFours(var matrix: myMatrix; n, m: byte):integer;
var
        i,j,counter:integer;
begin
        counter:=0;
        for i:=1 to n-1 do
                for j:=1 to m-1 do
                        begin
                        if (matrix^[i]^[j]<>matrix^[i]^[j+1]) and (matrix^[i]^[j]<>matrix^[i+1]^[j]) and (matrix^[i]^[j]<>matrix^[i+1]^[j+1]) and
                                (matrix^[i]^[j+1]<> matrix^[i+1]^[j]) and (matrix^[i]^[j+1]<>matrix^[i+1]^[j+1]) and (matrix^[i+1]^[j]<>matrix^[i+1]^[j+1]) then
                                counter:=counter+1;
                        end;
        getFours:=counter;
end;

{��楤�� ����� �� ⨯���஢������ � ⥪�⮢�}
procedure datToTxt(fPath,tPath: string; n, m: byte);
var
        f: file of integer;
        t: text;
        i, j, a: integer;
begin
        assign(f,fPath);
        assign(t,tPath);
        reset(f);
        rewrite(t);
                for i:=1 to n do
                begin
                        for j:=1 to m do
                        begin
                                read(f,a);
                                write(t,a:5);
                        end;
                        writeln(t,'');
                        writeln(t,'');
                end;
        close(t);
        close(f);
end;

{��楤�� ��� ����� �⢥� � ⥪�⮢� 䠩�}
procedure answerToTxt(tPath: string; answer: integer);
var
        t: text;
begin
        assign(t,tPath);
        append(t);
        writeln(t,'Otvet: ',answer,' chetverok. Vyi mozhete poschitat ih sami :)');
        close(t)
end;

begin
        m := 5;
        n := 5;
        getmem(A, n * sizeof(squareMatrix));
        for i := 1 to n do
                        getmem(A^[i], m * sizeof(ptrRow));
        randomsInFile('matrixDAT.dat',c1,c2,c3,c4, n, m);
        matrixFromFile('matrixDAT.dat',A, n, m);
        showMatrix(A, n, m);
        fours:=getFours(A, n, m);
        writeln('����� �襭�, ��������, ��ᬮ��� ⥪�⮢� 䠩�.');
        datToTxt('matrixDAT.dat','matrixTXT.txt', n, m);
        answerToTxt('matrixTXT.txt',fours);
        for i := 1 to n do
                freemem(A^[i], m * sizeof(ptrRow));
        freemem(A, n * sizeof(squareMatrix));
        readln;
end.
