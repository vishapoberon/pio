MODULE exchange;
IMPORT Out;

VAR a, b : INTEGER;

  PROCEDURE exchange(VAR x, y: INTEGER);
	VAR z: INTEGER;
  BEGIN z := x; x := y; y := z;
  END exchange;

BEGIN

 a := 5;
 b := 11;

 Out.String("Before"); Out.Ln;
 Out.Int(a,0); Out.String(" "); Out.Int(b,0); Out.Ln;

 exchange(a,b);

 Out.String("After"); Out.Ln;
 Out.Int(a,0); Out.String(" "); Out.Int(b,0); Out.Ln;

END exchange.

