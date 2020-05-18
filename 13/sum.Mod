MODULE sum;
IMPORT Out;

CONST N = 3;


VAR A : ARRAY N OF REAL;
	n, i : INTEGER;
	 u : REAL;

  PROCEDURE sum (VAR x: ARRAY OF REAL): REAL;
	VAR i: LONGINT; s: REAL; len : LONGINT;
  BEGIN s := 0.0;
    len := LEN(x) - 1;
	FOR i := 0 TO len DO s := x[i] + s END ;
    RETURN s
  END sum;

BEGIN

A[0] := 1.0;
A[1] := 2.3;
A[2] := 3.7;

u := sum(A);

Out.String("u = "); Out.Real(u, 0); Out.Ln;

END sum.
