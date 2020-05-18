MODULE npRecursion;
IMPORT Out;

VAR res : INTEGER;

PROCEDURE np(n: INTEGER): INTEGER; 
BEGIN
IF n <= 1 THEN n := 1
ELSE n := n * np(n-1); RETURN n;
END ;
RETURN n
END np;

BEGIN

  res := np(5);
  Out.Int(res, 0); Out.Ln;

END npRecursion.
