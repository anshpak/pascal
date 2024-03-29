program secondLab;

var
	x, y: real;
    i, allHits, trueHits: integer;
    hit, centerHit: boolean;

function getHitResult(x, y:real):boolean;
var
	isHitTrue1, isHitTrue2: boolean;

begin

	isHitTrue1 := (((x >= -2) and (x <= 1)) and ((y >= -1/3*x-2/3) and (y <= 1/3*x+2/3)));
	isHitTrue2 := (((x >= 1) and (x <= 2)) and ((y >= -sqrt(1-(x-1)*(x-1))) and (y <= sqrt(1-(x-1)*(x-1)))));
	getHitResult := isHitTrue1 or isHitTrue2;
end;

function getCenterResult(x, y:real):boolean;
  begin
	getCenterResult := ((x = 0) and (y = 0));
  end;

procedure printTableHead;
begin
	writeln('旼컴컴컴컴컴컴쩡컴컴컴컴컴컴쩡컴컴컴컴컴컴컴컴�':70);
        writeln('�      x      �      y      �    맓㎯レ�졻    �':70);
	writeln('쳐컴컴컴컴컴컴탠컴컴컴컴컴컴탠컴컴컴컴컴컴컴컴�':70);
end;

procedure printTableMiddle(x, y:real; hit, centerHit: boolean);
begin
	if centerHit then
		writeln('�  ':26, x:5:1, '      �    ':10, y:5:2, '    �':4,'    � 煎ギ囹�!   �')
	else if hit then
		writeln('�  ':26, x:5:1, '      �    ':10, y:5:2, '    �':4,'      룼캙�!     �')
	else
		writeln('�  ':26, x:5:1, '      �    ':10, y:5:2, '    �':4,'      뙣М!      �');
end;

procedure printTableFooter;
begin
	writeln('읕컴컴컴컴컴컴좔컴컴컴컴컴컴좔컴컴컴컴컴컴컴컴�':70);
end;

begin
	trueHits:=0;
	randomize;
	printTableHead;
	allHits:=random(50);
	for i := 1 to allHits do
	begin
		x := random(5);
        y := random(5);
		{getHitResult(x,y);}
		centerHit:=getCenterResult(x,y);
		hit:=getHitResult(x,y);
		printTableMiddle(x,y,hit,centerHit);
		if hit then
        begin
			inc(trueHits);
			if centerHit then
				break;
        end;
	end;
	allHits:=i;
	printTableFooter;
	writeln('귗ⅲ� �吟循�ギ�: ':40, allHits);
	writeln('뒶エ曄飡¡ ��캙쩆�Ł: ':45, trueHits);
	writeln('뒶エ曄飡¡ �昔쵟若�: ':44, (allHits - trueHits));
	writeln('뤲�璵�� ��캙쩆�Ł: ':42, ((trueHits / allHits)*100):4:2, '%');
	readln;
end.
