program fifthLab;
const n=30;
type
        myArray=array[1..n] of integer;
var
        arr:myArray;

procedure fillArray(var arr:myArray);
var
        i:integer;
begin
        randomize();
        for i:=1 to n do
                arr[i]:=random(100);
end;

procedure printArray(var arr:myArray);
var
        i:integer;
begin
        for i:=1 to n do
                write(arr[i]:3,' ');
end;

procedure leftIndexShift(var arr:myArray;index:integer);
var
        i:integer;
begin
        for i:=index to n-1 do
                arr[i]:=arr[i+1];
end;

procedure deleteEvenAtOddPos(var arr:myArray);
var
        i,j,counter:integer;
begin
        i:=n;
        counter:=0;
        {writeln();
        write('Пошаговое удаление элементов: ');}
        while i<>0 do
        begin
                if (arr[i] mod 2=0) and (i mod 2 <>0) then
                begin
                        leftIndexShift(arr,i);
                        counter:=counter+1;
                        {writeln();
                        printArray(arr);}
                end;
        i:=i-1;
        end;
        for i:=n-counter+1 to n do
                arr[i]:=0;
end;

begin
        fillArray(arr);
        writeln('Исходный массив: ');
        printArray(arr);
        deleteEvenAtOddPos(arr);
        writeln();
        writeln('Удаляю чётные элементы, которые находятся на нечётных местах: ');
        printArray(arr);
        readln();
end.
