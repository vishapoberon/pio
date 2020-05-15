MODULE sum;
IMPORT Out;

CONST N = 3;

VAR A : ARRAY N  OF REAL;
	n, i : INTEGER;
	 u : REAL;

  PROCEDURE sum (a: ARRAY OF REAL; n : INTEGER): REAL;
	VAR i: INTEGER; s: REAL;
  BEGIN s := 0.0;
	FOR i := 0 TO n-1 DO s := a[i] + s END ;
    RETURN s
  END sum;

BEGIN

A[0] := 1.0;
A[1] := 2.3;
A[2] := 3.7;

u := sum(A,N);

Out.String("u = "); Out.Real(u, 0); Out.Ln;

END sum.
