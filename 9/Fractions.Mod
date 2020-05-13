MODULE Fractions;
IMPORT Oberon, Texts;
  CONST Base = 10; N = 32;
  VAR i, j, m, rem: INTEGER;
	d: ARRAY N OF INTEGER; (*digits*)
	x: ARRAY N+1 OF INTEGER; (*index*)
	W: Texts.Writer;
BEGIN
  Texts.OpenWriter(W);
  FOR i := 2 TO N DO
	FOR j := 0 TO i-1 DO x[j] := 0 END ;
	m := 0; rem := 1;
	REPEAT m := m+1; x[rem] := m;
	  rem := Base * rem; d[m] := rem DIV i; rem := rem MOD i
	UNTIL x[rem] # 0;
	Texts.WriteInt(W, i, 6); Texts.WriteString(W, "  0.");
	FOR j := 1 TO x[rem]-1 DO Texts.Write(W, CHR(d[j]+ORD("0"))) END ;
	Texts.Write(W, "'");
	FOR j := x[rem] TO m DO Texts.Write(W, CHR(d[j]+ORD("0"))) END ;
	Texts.WriteLn(W)
  END ;
  Texts.Append(Oberon.Log, W.buf)
END Fractions.
