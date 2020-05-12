MODULE gcdlcm;
IMPORT Oberon, Texts;
  VAR x, y, u, v: LONGINT; S: Texts.Scanner;
  W: Texts.Writer;
BEGIN Texts.OpenScanner(S, Oberon.Par.text, Oberon.Par.pos);
  Texts.OpenWriter(W);
  Texts.Scan(S); x := S.i; Texts.WriteString(W, "  x ="); Texts.WriteInt(W, x, 6);
  Texts.Scan(S); y := S.i; Texts.WriteString(W, "  y ="); Texts.WriteInt(W, y, 6);
  u := x; v := y;
  WHILE x # y DO 
	(*gcd(x,y) = gcd(x0,y0), x*v + y*u = 2*x0*y0*)
	IF x > y THEN x := x - y; u := u + v
	ELSE  y := y - x; v := v + u
	END
  END ;
  Texts.WriteString(W, " gcd ="); Texts.WriteInt(W, x, 6); 
  Texts.WriteString(W, " lcm ="); Texts.WriteInt(W, (u+v) DIV 2, 6); Texts.WriteLn(W);
  Texts.Append(Oberon.Log, W.buf)
END gcdlcm.
