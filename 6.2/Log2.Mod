MODULE Log2;
IMPORT Oberon, Texts;
  VAR x, a, b, sum: REAL; S: Texts.Scanner;
  W : Texts.Writer;
BEGIN Texts.OpenScanner(S, Oberon.Par.text, Oberon.Par.pos); Texts.Scan(S);
  Texts.OpenWriter(W);
  WHILE S.class = Texts.Real DO
	x := S.x; Texts.WriteReal(W, x, 15);
	(*1.0 <= x < 2.0*)
	a := x; b := 1.0; sum := 0.0;
	REPEAT
	  (*log2(x) = sum + b*log2(a)*)
	  a := a*a; b := 0.5*b;
	  IF a >= 2.0 THEN
		sum := sum + b; a := 0.5*a
	  END
	UNTIL b < 1.0E-7;
	Texts.WriteReal(W, sum, 16); Texts.WriteLn(W); Texts.Scan(S)
  END ;
  Texts.Append(Oberon.Log, W.buf)
END Log2.
