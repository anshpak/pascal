program seventhLab;
uses calc7Lab;
const
        n=25;
        x=0.2;
begin
        printHead('src/calcRes.txt');
        calcWriteExpr(n, x, 'src/calcRes.txt');
        write('������ �믮����. ��������, �஢���� 䠩� calcRes.txt');
        readln;
end.