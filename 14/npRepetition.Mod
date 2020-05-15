MODULE npRepetition;
IMPORT Out;

VAR res : INTEGER;

PROCEDURE np(n: INTEGER): INTEGER;
  VAR p: INTEGER;
BEGIN p := 1;
  WHILE n > 1 DO p := n*p; DEC(n) END ;
  RETURN p
END np;

BEGIN
  res := np(5);
  Out.String("res = "); Out.Int(res,0); Out.Ln;
END npRepetition.

