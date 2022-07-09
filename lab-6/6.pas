program sixthLab;
const
        rows=15;
        cols=15;
type
        squareMatrix=array[1..rows,1..cols] of integer;
var
        myMatrix:squareMatrix;

function getFours(var matrix:squareMatrix):integer;
var
        i,j,counter:integer;
begin
        counter:=0;
        for i:=1 to rows-1 do
                for j:=1 to cols-1 do
                        begin
                        if (matrix[i,j]<>matrix[i,j+1]) and (matrix[i,j]<>matrix[i+1,j]) and (matrix[i,j]<>matrix[i+1,j+1]) and
                                (matrix[i,j+1]<> matrix[i+1,j]) and (matrix[i,j+1]<>matrix[i+1,j+1]) and (matrix[i+1,j]<>matrix[i+1,j+1]) then
                                counter:=counter+1;
                        end;
        getFours:=counter;
end;

procedure fillMatrix(var matrix:squareMatrix);
var
        i,j,k:integer;
        numArray:array[1..4] of integer;
begin
        randomize();
        numArray[1]:=0;
        numArray[2]:=1;
        numArray[3]:=5;
        numArray[4]:=11;
        for i:=1 to rows do
                for j:=1 to cols do
                         matrix[i,j]:=numArray[random(4)+1];
end;

procedure showMatrix(var matrix:squareMatrix);
var
        i,j:integer;
begin
        for i:=1 to rows do
                begin
                for j:=1 to cols do
                        write(matrix[i,j]:6);
                writeln();
                writeln();
                end;
end;

begin
        writeln();
        fillMatrix(myMatrix);
        showMatrix(myMatrix);
        writeln('  ?????????? ???????? ? ???????: ',getFours(myMatrix));
        readln();
end.
