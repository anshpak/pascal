uses crt,graph;

var

mode : integer;

driver : integer;

ch : char;

x, y, r : integer;

procedure bip;{???????? ??????} begin sound(1000); delay(1000); nosound end;

begin

driver := detect;

initgraph(driver,mode,'c:\tp7\bgi');

setbkcolor(3);

setcolor(12);

setlinestyle(0,0,3);

x:=getmaxx div 2;

y:=getmaxy div 2;

r:=20;

ch:=' ';

while ch<>#13 do

 begin

   cleardevice;

   circle(x,y,r);

   ch:=readkey;

   if ch=#0 then ch:=readkey;

   case ch of

     #72:if y-5-r>=0 then y:=y-5 else bip;

     #80:if y+5+r<=getmaxy then y:=y+5 else bip;

     #75:if x-5-r>=0 then x:=x-5 else bip;

     #77:if x+5+r<=getmaxx then x:=x+5 else bip;

     '<':if r-5>0 then r:=r-5 else bip;

     '>':if r+5<getmaxx div 2 then r:=r+5 else bip;

    end;

  end;

setcolor(5);

outtextxy(1,340,'??????? Enter ??? ?????? ...');

readln;

closegraph;

end.
