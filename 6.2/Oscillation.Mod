MODULE Oscillation;
IMPORT Math, Oberon, Texts;
  CONST dx = 0.19634953;  (*pi/16*)
  VAR i, n: LONGINT;
  x, y, r: REAL;  S: Texts.Scanner;
  W : Texts.Writer;
BEGIN Texts.OpenScanner(S, Oberon.Par.text, Oberon.Par.pos);
  Texts.OpenWriter(W);
  Texts.Scan(S); n := S.i; Texts.WriteInt(W, n, 6);
  Texts.Scan(S); r := S.x; Texts.WriteReal(W, r, 15); Texts.WriteLn(W); 
  i := 0; x := 0.0;
  REPEAT x := x + dx; i := i+1; 
	y := Math.exp(-r*x) * Math.cos(x);    
	Texts.WriteReal(W, x, 15); Texts.WriteReal(W, y, 15); Texts.WriteLn(W) 
  UNTIL i >= n;
  Texts.Append(Oberon.Log, W.buf)
END Oscillation.
