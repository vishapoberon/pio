MODULE integral;
IMPORT Math, Out;

TYPE Function  =  PROCEDURE (x: REAL): REAL;

VAR r : REAL;

PROCEDURE integral (f: Function; a, b: REAL; n: INTEGER): REAL;
VAR i: INTEGER;
sum, dx: REAL; 
BEGIN 
dx := (b-a)/n; sum := 0;
FOR i := 0 TO n-1 DO sum := f(a + i*dx + 0.5*dx) + sum END ;
RETURN sum * dx
END integral;


BEGIN

r := integral(Math.sin, 0, 3.14159, 20);
Out.Real(r,0); Out.Ln;

r := integral(Math.exp, 0, 1, 20);
Out.Real(r,0); Out.Ln;

END integral.
