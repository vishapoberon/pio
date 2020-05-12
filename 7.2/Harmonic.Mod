MODULE Harmonic;
IMPORT Oberon, Texts;
  VAR i, n: LONGINT;
	x, d, s1, s2: REAL; S: Texts.Scanner;
	W : Texts.Writer;
BEGIN Texts.OpenScanner(S, Oberon.Par.text, Oberon.Par.pos); Texts.Scan(S);
  Texts.OpenWriter(W);
  WHILE S.class = Texts.Int DO
	n := S.i; Texts.WriteString(W, "n = "); Texts.WriteInt(W, n, 6);
	s1 := 0.0; d := 0.0; i := 0;
	REPEAT
	  d := d + 1.0; INC(i);
	  s1 := s1 + 1.0/d;
	UNTIL i >= n;
	Texts.WriteReal(W, s1, 16);
	s2 := 0.0;
	REPEAT
	  s2 := s2 + 1.0/d;
	  d := d - 1.0; DEC(i)
	UNTIL i = 0;
	Texts.WriteReal(W, s2, 16); Texts.WriteLn(W); Texts.Scan(S)
  END ;
  Texts.Append(Oberon.Log, W.buf)
END Harmonic.
