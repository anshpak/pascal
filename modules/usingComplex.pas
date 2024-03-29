program usingcomplex;
uses CmplVals;

var
        c1,c2,c3,c4,c5:complex;
        strRes:string;
        code:byte;
        a,b,c:real;

procedure slvLin(a,b:real; var res:string; var x:real; var code:byte);
var
        strTmp: string;
begin
        if (b=0) and (a<>0) then
                begin
                        res:='������⢮ �襭��';
                        code:=2;
                end
        else if a<>0 then
                begin
                        res:='�����⢥���� �襭��: ';
                        x:=-b/(2*a);
                        Str(x:10:4, strTmp);
                        res:= res + strTmp;
                        code:=1;
                end
        else
                begin
                        res:='��� �襭��';
                        code:=0;
                end;
end;

procedure slvSqr(a,b,c:real; var res:string; var x1,x2:complex; var code:byte);
var
        strTmp,t:string;
        D,temp:real;
begin
        if a<>0 then
                begin
                        D:=b*b-4+a*c;
                        if D>0 then
                                begin
                                        code:=2;
                                        x1.re:=(-b+sqrt(D))/(2*a);
                                        x2.re:=(-b-sqrt(D))/(2*a);
                                        x1.im:=0;
                                        x2.im:=0;
                                        str(x1.re:10:4,res);
                                        str(x2.re:10:4,t);
                                        res:='�����⭮� �ࠢ����� � ���� ����⢥��묨 ���ﬨ: '+res+' '+t;
                                end
                        else if D=0 then
                                begin
                                        code:=1;
                                        x1.re:=-b/(2*a);
                                        x2.re:=x1.re;
                                        x1.im:=0;
                                        x2.im:=0;
                                        str(x1.re:10:4,res);
                                        res:='�����⭮� �ࠢ����� � ���� ����⢥��묨 ᮢ�����騬� ���ﬨ: '+res+' '+res;
                                end
                        else
                                begin
                                        code:=2;
                                        x1.re:=-b/(2*a);
                                        x2.re:=x1.re;
                                        x1.im:=sqrt(-D)/(2*a);
                                        x2.im:=-x1.im;
                                        str(x1.re:10:4,res);
                                        str(x1.im:10:4,t);
                                        res:='�����⭮� �ࠢ����� � ���� ��������묨 ���ﬨ: x1='+res+'i'+t+' x2='+res+'-i'+t;
                                end;
                end
        else
                begin
                        slvLin(a,b,res,x1.re,code);
                        if code=1 then
                                x1.im:=0;
                        res:='�������� �ࠢ�����: '+res;
                end;
end;

begin
        initc(1,2,c1);
        write('������᭮� �᫮ c1: ');
        writec(c1);
        writeln();
        initc(3,4,c2);
        write('�������᭮� �᫮ c2: ');
        writec(c2);
        writeln();
        addc(c1,c2,c3);
        write('c1 + c2 =');
        writec(c3);
        writeln();
        subtractc(c1,c2,c3);
        write('c1 - c2 =');
        writec(c3);
        writeln();
        multc(c1,c2,c3);
        write('c1 * c2 =');
        writec(c3);
        writeln;
        divc(c1,c2,c3);
        write('c1 / c2 =');
        writec(c3);

        writeln('���஡�� ���� �����⭮� �ࠢ����� ����: 3x^2-5x+1=0: ');
        a:=3;
        b:=5;
        c:=1;
        slvSqr(a,b,c,strRes,c4,c5,code);
        write(strRes);
        readln();
end.