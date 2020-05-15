MODULE Add;
IMPORT Out;

CONST N = 5;

TYPE Vector = ARRAY N OF REAL;

VAR a : Vector;
  sum : REAL;

PROCEDURE Add (x: Vector);
  VAR i: INTEGER;
BEGIN sum := 0;
  FOR i := 0 TO N-1 DO sum := x[i] + sum END;
  Out.Real(sum, 0); Out.Ln;
END Add;


BEGIN
a[1] := 5.5;
a[2] := 3.8;
a[3] := 1.2;
a[4] := 9.1;

Add(a);

END Add.
