MODULE Primes;
IMPORT Oberon, Texts;
  CONST N = 252; M = 16;  (*M ~ sqrt(N)*)
    LL = 10; (*no. of primes placed on a line*)
  VAR i, k, x: INTEGER;
    inc, lim, square, L: INTEGER;
	prime: BOOLEAN;
	P,V: ARRAY M+1 OF INTEGER;
	W: Texts.Writer;
BEGIN Texts.OpenWriter(W);
  L := 0; x := 1; inc := 4; lim := 1; square := 9;
  FOR i := 3 TO N DO
	(* find next prime number p[i] *)
	REPEAT x := x + inc; inc := 6 - inc;
	  IF square <= x THEN
		INC(lim); V[lim] := square; square := P[lim+1] * P[lim+1]
	  END ;
	  k := 2; prime := TRUE;
	  WHILE prime & (k < lim) DO
		INC(k);
		IF V[k] < x THEN V[k] := V[k] + 2*P[k] END ;
		prime := x # V[k]
	  END
	UNTIL prime;
	IF i <= M THEN P[i] := x END ;
	Texts.WriteInt(W, x, 6); L := L+1;
	IF L = LL THEN Texts.WriteLn(W); L := 0 END
  END ;
  Texts.Append(Oberon.Log, W.buf)
END Primes.
