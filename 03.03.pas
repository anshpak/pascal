const alph:string='123456789ABCDEF';
      a=20; b=50; p=13;

procedure pto10(p:byte; st:string; var res:longint);
var  l,i:byte; sl:word;
begin
    res:=1;
    sl:=1;
    l:=length(st);
    for i:=1 to l do
      begin
         sl:=p*sl;
         res:=res+sl;
      end;
      i:=Pos(st[1],alph);
      res:=res*i;
end;


var st,d1st:string; d1:longint;

begin
   {� ��ॢ���� � p � ����砥� �}
   Str(x,st);
   {d1st ����稫� ����ணࠬ����}
   {�����ࠥ� ���� �� ��� st ⠪��, �⮡� ����ந�� ��ࢮ� �᫮ ९������}
   pto10(p, d1st,d1);
   write (t,d1st,d1);
   {� ��䠢�� ��諨 ᫥� ᨬ���, �᫨ �� �� ��⥬� p}
   x:=Pos(d1st[1],alph)+1;

   if x<p then  {while}
     begin
        {����� d1st}
        d1st:='';
        for i:=1 to l do
          d1st:=dist+alph[x];
        pto10(p,d1st,d1);
        writeln(d1st,d1);
     end
   else
      begin
         l:=l+1;
         x:=1;

      end;

    {�ணࠬ�� �� ��⮢�, �� ��⮢���� ������, ࠡ�⠥� ⮫쪮 1 ��楤��}
end.





