MODULE Queens;
  IMPORT Texts, Oberon;
  CONST N = 8;  (*no. of rows and columns*)

  VAR x: ARRAY N OF INTEGER;
	(*x[i] = j means: “a queen is on field j in column i”*)
   row: ARRAY N OF BOOLEAN;
	(*row[i] = "no queen on i-th row"*)
   d1:  ARRAY 2*N-1 OF BOOLEAN;
	(*d1[i] = "no queen on i-th upleft to lowright diagonal"*)
   d2:  ARRAY 2*N-1 OF BOOLEAN;
	(*d2[i] = "no queen on i-th lowleft to upright diagonal"*)
   W: Texts.Writer;

  PROCEDURE Clear;
	VAR i: INTEGER;
  BEGIN
	FOR i := 0 TO N-1 DO row[i] := TRUE END ;
	FOR i := 0 TO 2*(N-1) DO d1[i] := TRUE; d2[i] := TRUE END
  END Clear;

  PROCEDURE WriteSolution;
	VAR i: INTEGER;
  BEGIN
	FOR i := 0 TO N-1 DO Texts.WriteInt(W, x[i], 4) END ;
	Texts.WriteLn(W)
  END WriteSolution;

  PROCEDURE PlaceQueen(i, j: INTEGER);
  BEGIN
	x[i] := j; row[j] := FALSE; d1[i+j] := FALSE; d2[N-1+i-j] := FALSE
  END PlaceQueen;

  PROCEDURE RemoveQueen(i, j: INTEGER);
  BEGIN
	row[j] := TRUE; d1[i+j] := TRUE; d2[N-1+i-j] := TRUE
  END RemoveQueen;

  PROCEDURE TryCol(i: INTEGER);
	VAR j: INTEGER;
  BEGIN
	FOR j := 0 TO N-1 DO
	  IF row[j] & d1[i+j] & d2[N-1+i-j] THEN
		PlaceQueen(i, j);
		IF i < N-1 THEN TryCol(i+1) ELSE WriteSolution END ;
		RemoveQueen(i, j)
	  END
	END
  END TryCol;

  PROCEDURE Find;(*command*)
  BEGIN Clear; TryCol(0); Texts.Append(Oberon.Log, W.buf)
  END Find;

  BEGIN Texts.OpenWriter(W);
	Find;
  END Queens.
