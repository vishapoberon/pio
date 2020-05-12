MODULE Power;
IMPORT Oberon, Texts;
  VAR i: LONGINT; x, z: REAL; S: Texts.Scanner;
  W : Texts.Writer;
BEGIN Texts.OpenScanner(S, Oberon.Par.text, Oberon.Par.pos); Texts.Scan(S);
  Texts.OpenWriter(W);
  WHILE S.class = Texts.Real DO
	x := S.x; Texts.WriteString(W, "  x ="); Texts.WriteReal(W, x, 16);
	Texts.Scan(S); i := S.i; Texts.WriteString(W, "  i ="); Texts.WriteInt(W, i, 4);
	z := 1.0;
	WHILE i > 0 DO
	  (* z * x^i = x0^i0 *)
	  z := z*x; i := i-1
	END ;
	Texts.WriteReal(W, z, 16); Texts.WriteLn(W); Texts.Scan(S)
  END ;
  Texts.Append(Oberon.Log, W.buf)
END Power.
