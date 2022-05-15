program Okna13may2022;

uses
        crt, graph;

var
        x0, y0, gd, gm : integer;

procedure okna(xl, yl, xr, yr: word; c: word);
begin
        setfillstyle(9, c);
        setbkcolor(c);
        {bar(xl+15, yl+10, xr-15, yr-10);}
        setviewport(xl+15, yl+10, xr-15, yr-10, boolean(1));
        clearviewport;
        moveto((xr-xl) div 2,(yr-yl) div 2);
        settextstyle(3,0,8);
        setcolor(12);
        settextjustify(1,0);
        outtext('1Okey2Okey3Okey4Okey');
end;

begin
        clrscr;
        gd:=0;
        initgraph(gd,gm,'');
        setcolor(4);
        setlinestyle(0,0,3);
        x0:=getmaxx div 2;
        y0:=getmaxy div 2;
        setWriteMode(4);
        line(x0,0,x0,getmaxy);
        line(0,y0,getmaxx,y0);
        setcolor(15);
        okna(0,0,x0-3,y0-2,1);
        setviewport(0,0,getmaxx-1,getmaxy-1,true);
        okna(x0+3,0,getmaxx,y0-2,2);
        setviewport(0,0,getmaxx-1,getmaxy-1,true);
        okna(0,y0+2,x0-3,getmaxy,3);
        setviewport(0,0,getmaxx-1,getmaxy-1,true);
        okna(x0+3,y0+2,getmaxx,getmaxy,4);

        readln;
        closegraph;
end.


