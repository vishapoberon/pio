
MODULE Buffer; (*stack of integers*)
  CONST  N = 100;
  VAR nonempty*, nonfull*: BOOLEAN;
	n: INTEGER;
	buf: ARRAY N OF INTEGER;

  PROCEDURE put*(x: INTEGER);
  BEGIN
	IF n < N THEN
	  buf[n] := x; INC(n); nonfull := n < N; nonempty := TRUE 
	END
  END put;

  PROCEDURE get*(VAR x: INTEGER);
  BEGIN
	IF n > 0 THEN
	  DEC(n); x:=buf[n]; nonempty := n > 0; nonfull := TRUE
	END
  END get;

  BEGIN  n := 0; nonempty := FALSE; nonfull := TRUE
  END Buffer.


