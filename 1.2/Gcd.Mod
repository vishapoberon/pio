MODULE Gcd;
IMPORT Texts, Oberon;
 VAR x, y: LONGINT; S: Texts.Scanner;
 W: Texts.Writer;
BEGIN
  Texts.OpenScanner(S, Oberon.Par.text, Oberon.Par.pos);
  Texts.OpenWriter(W);
  Texts.Scan(S); x := S.i; Texts.WriteString(W, " x="); Texts.WriteInt(W, x, 6);
  Texts.Scan(S); y := S.i; Texts.WriteString(W, " y="); Texts.WriteInt(W, y, 6);
  WHILE x#y DO
    IF x > y THEN x := x - y ELSE y := y - x END
  END;

  Texts.WriteString(W, " gcd ="); Texts.WriteInt(W, x, 6); Texts.WriteLn(W);
  Texts.Append(Oberon.Log, W.buf)
END Gcd.
