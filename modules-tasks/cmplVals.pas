unit CmplVals;
interface
type
        complex=record
                re,im:real
                end;
procedure initc(a,b:real; var c:complex);
procedure addc(c1,c2:complex; var c:complex);
procedure subtractc(c1,c2:complex; var c:complex);
procedure multc(c1,c2:complex; var c:complex);
procedure divc(c1,c2:complex; var c:complex);
procedure writec(c:complex);
function modc(c:complex):real;

implementation
procedure initc(a,b:real; var c:complex);
begin
        c.re:=a;
        c.im:=b;
end;

procedure addc(c1,c2:complex; var c:complex);
begin
        c.re:=c1.re+c2.re;
        c.im:=c1.im+c2.im;
end;

procedure subtractc(c1,c2: complex; var c:complex);
begin
        c.re:=c1.re-c2.re;
        c.im:=c1.im-c2.im;
end;

procedure multc(c1,c2:complex; var c:complex);
begin
        c.re:=c1.re*c2.re-c1.im*c2.im;
        c.im:=c1.re*c2.im+c2.re*c1.im;
end;

function modc(c:complex):real;
begin
        modc:=c.re*c.re+c.im*c.im;
end;

procedure divc(c1,c2:complex; var c:complex);
var
        tmp:real;
begin
        tmp:=modc(c2);
        c.re:=(c1.re*c2.re+c1.im*c2.im)/tmp;
        c.im:=(c2.re*c1.im-c1.re*c2.im)/tmp;
end;

procedure writec(c:complex);
begin
        write(c.re); if c.im=0 then exit;
        if c.im>0 then write ('+');
        write(c.im);
        write('i');
end;
end.
