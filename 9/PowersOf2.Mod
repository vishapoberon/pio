MODULE PowersOf2;
IMPORT Oberon, Texts;
  CONST M = 11; N = 32; (*M ~ N*log(2) *)
  VAR i, j, k, exp, c, r, t: INTEGER;
	d: ARRAY M OF INTEGER;
	f: ARRAY N OF INTEGER;
	W: Texts.Writer;
BEGIN 
  Texts.OpenWriter(W);
  d[0] := 1; k := 1;
  FOR exp := 1 TO N-1 DO
  (* compute d = 2^exp *) c := 0; (*carry*)
	FOR i := 0 TO k-1 DO
	  t := 2*d[i] + c;
	  IF t >= 10 THEN d[i] := t - 10; c := 1 ELSE d[i] := t; c := 0 END
    END ;
    IF c > 0 THEN d[k] := 1; INC(k) END ;
    (*output d[k-1] ... d[0]*) i := M;
    REPEAT DEC(i); Texts.Write(W, " ") UNTIL i = k;
    REPEAT DEC(i); Texts.Write(W, CHR(d[i]+ORD("0"))) UNTIL i = 0;
    Texts.WriteInt(W, exp, 4);
    (*compute and output f = 2^(-exp) *)
    Texts.WriteString(W, "  0."); r := 0; (*remainder*)
    FOR j := 1 TO exp-1 DO
  	  r := 10*r + f[j]; f[j] := r DIV 2;
	  r := r MOD 2; Texts.Write(W, CHR(f[j]+ORD("0")))
    END ;
    f[exp] := 5; Texts.Write(W, "5"); Texts.WriteLn(W)
  END ;
  Texts.Append(Oberon.Log, W.buf)
END PowersOf2.
