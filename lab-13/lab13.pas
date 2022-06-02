uses
  Graph, Crt;

var
  d, r, x, y: integer;

procedure Mig;
var
  i: byte;
  s: string;
begin
  for i := 3 downto 1 do
  begin
    Str(i, s);
    SetFillStyle(1, Black);
    FillEllipse(GetMaxX div 2, GetMaxY div 2 + 120, 50, 50);
    SetFillStyle(1, DarkGray);
    Bar(GetMaxX div 2 + 100, GetMaxY div 2 - 50, GetMaxX div 2 + 200, GetMaxY div 2 + 50);
    Delay(500);
    SetFillStyle(1, Green);
    FillEllipse(GetMaxX div 2, GetMaxY div 2 + 120, 50, 50);
    OutTextXY(GetMaxX div 2 + 150, GetMaxY div 2, s);
    Delay(500);
  end;
  SetFillStyle(1, Black);
  FillEllipse(GetMaxX div 2, GetMaxY div 2 + 120, 50, 50);
end;

procedure Wait;
var
  i: byte;
  s: string;
begin
  i := 10;
  Str(i, s);
  SetFillStyle(1, DarkGray);
  repeat
    OutTextXY(GetMaxX div 2 + 150, GetMaxY div 2, s);
    Dec(i);
    Str(i, s);
    Delay(1000);
    Bar(GetMaxX div 2 + 100, GetMaxY div 2 - 50, GetMaxX div 2 + 200, GetMaxY div 2 + 50);
  until i = 0;
end;

procedure WaitGreen;
var
  i: byte;
  s: string;
begin
  i := 10;
  Str(i, s);
  SetFillStyle(1, DarkGray);
  repeat
    OutTextXY(GetMaxX div 2 + 150, GetMaxY div 2, s);
    Dec(i);
    Str(i, s);
    Delay(1000);
    Bar(GetMaxX div 2 + 100, GetMaxY div 2 - 50, GetMaxX div 2 + 200, GetMaxY div 2 + 50);
  until i = 3;
end;

begin
  d := Detect;
  InitGraph(d, r, ' ');
  x := GetMaxX div 2;
  y := GetMaxY div 2;
  SetFillStyle(1, DarkGray);
  Rectangle(x - 100, y - 200, x + 100, y + 200);
  Bar(x + 100, y - 50, x + 200, y + 50);
  Circle(x, y - 120, 50);
  Circle(x, y, 50);
  Circle(x, y + 120, 50);
  SetTextStyle(7, 0, 5);
  repeat
    SetFillStyle(1, Red);
    FillEllipse(x, y - 120, 50, 50);
    Wait;
    SetFillStyle(1, Black);
    FillEllipse(x, y - 120, 50, 50);
    SetFillStyle(1, Yellow);
    FillEllipse(x, y, 50, 50);
    Delay(2000);
    SetFillStyle(1, Black);
    FillEllipse(x, y, 50, 50);
    SetFillStyle(1, Green);
    FillEllipse(x, y + 120, 50, 50);
    WaitGreen;
    Mig;
    SetFillStyle(1, DarkGray);
    Bar(x + 100, y - 50, x + 200, y + 50);
    SetFillStyle(1, Yellow);
    FillEllipse(x, y, 50, 50);
    Delay(2000);
    SetFillStyle(1, Black);
    FillEllipse(x, y, 50, 50);
  until KeyPressed;
  Readln
end.
