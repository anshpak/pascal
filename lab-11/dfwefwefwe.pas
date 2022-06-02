program forthLab;
const
        n=5;
type
        myArray=array[1..n] of integer;
var
        arr:myArray;
        strCheck,str:string;

procedure fillArr(var arr:myArray);
var
        i:byte;
begin
        for i:=1 to n do
                arr[i]:=i;
end;

procedure printArr(var arr:myArray);
var
        i:byte;
begin
        for i:=1 to n do
                write(' ',arr[i]);
        writeln();
end;

function checkTheSum(var arr:myArray):boolean;
var
        i,j:integer;
        check:boolean;
begin
        check:=true;
        for i:=1 to n do
                for j:=1 to n do
                        if arr[i]+arr[j]=i+j then
                        begin
                                checkTheSum:=false;
                                exit;
                        end;
        checkTheSum:=check;
end;

procedure isGemInBox(var arr:myArray);
var
        i:integer;
begin
        for i:=1 to n do
                if arr[i]=i then
                        exit;
        if checkTheSum(arr) then;
                printArr(arr);
end;


procedure swapArrElements(var arr:myArray;i,j:byte);
var
	temp:integer;
begin
        temp:=arr[i];
	arr[i]:=arr[j];
        arr[j]:=temp;
end;

procedure narayanaAlgorithm(var arr:myArray);
var
        i,j,k:byte;
begin
        while true do
        begin
                i:=n-1;
                while (i>0) and (arr[i]>=arr[i+1]) do
                        i:=i-1;
                if i=0 then
                        exit;
                for j:=i+1 to n do
                        if arr[j]>arr[i] then
                                k:=j;
                swapArrElements(arr,i,k);
                for j:=i+1 to i+(n+1-i) div 2 do
                        swapArrElements(arr,j,n+1+i-j);
                isGemInBox(arr);
        end;
 end;

begin
        fillArr(arr);
        writeln('???????? ??????:');
        printArr(arr);
        writeln('????? ????? ?????????? ? ?????????? ???:');
        narayanaAlgorithm(arr);
        writeln('?????? ???? ?? ?????????, ?????????? ???????, ??????? ?????? ????? ? ?????????.');
        writeln('?????????????? ?? ?????? ?? ????? ?????????, ????? ??????? ??????? ?????? ????? ? ????????? ?? ?????????????? ?????????.');
        readln();
end.
