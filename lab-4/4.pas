program forthLab;
const
        n=5;
type
        myArray=array[1..n] of integer;
var
        arr:myArray;

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
        i,j,k,counter:byte;
        check:boolean;
begin
        counter:=0;
        while true do
        begin
                i:=n-1;
                while (i>0) and (arr[i]>=arr[i+1]) do
                        i:=i-1;
                if i=0 then
                begin
                        writeln('�ᥣ� ����稫��� ',counter,' ����⠭����.');
                        exit;
                end;
                for j:=i+1 to n do
                        if arr[j]>arr[i] then
                                k:=j;
                swapArrElements(arr,i,k);
                for j:=i+1 to i+(n+1-i) div 2 do
                        swapArrElements(arr,j,n+1+i-j);


                check:=true;
                for i:=1 to n do
                        for j:=1 to n do
                                if (arr[i]+arr[j]=i+j) then
                                        check:=false;
                for i:=1 to n do
                        if (arr[i]=i) and check then
                                check:=false;
                if check then
                begin
                        printArr(arr);
                        counter:=counter+1;
                end;

        end;
 end;

begin
        fillArr(arr);
        writeln('��室�� ���ᨢ:');
        printArr(arr);
        writeln('����� ����� ��室����� � ��஡�窠� � ���� ᫥����� �������権:');
        narayanaAlgorithm(arr);
        writeln('���� ���� �� ��஡�祪, ���������� ᪠����, c���쪮 ������ ����� � ��⠫���.');
        writeln('���⢥��⢥��� �� ���� �� ����� ��஡�窨, �筮 ������� ᪮�쪮 ������ ����� � ��⠫��� �� �।�⠢����� ��������.');
        readln();
end.
