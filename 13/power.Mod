MODULE power;
IMPORT Out;

CONST N = 3;

VAR i : INTEGER;
  A, B : ARRAY N OF REAL;
  u : REAL;

  PROCEDURE power(x: REAL; i: INTEGER): REAL;
	VAR z: REAL;
  BEGIN z := 1.0;
	WHILE i > 0 DO
	  IF ODD(i) THEN z := z*x END;
	  x := x*x; i := i DIV 2
	END;
    RETURN z 
  END power;


BEGIN

u := power(2.5, 3); Out.String("u = "); Out.Real(u,0); Out.Ln;
A[i] := power(B[i],2) + 10; Out.String("A[i] = "); Out.Real(A[i],0); Out.Ln;

END power.
