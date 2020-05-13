MODULE Permute;
  IMPORT Texts, Oberon;
  VAR a: ARRAY 20 OF CHAR;
	W: Texts.Writer;

  PROCEDURE permute(k: INTEGER);
    VAR i: INTEGER; t: CHAR;
  BEGIN
	IF k = 0 THEN Texts.WriteString(W, a); Texts.WriteString(W, "  ")
	ELSE permute(k-1);
	  FOR i := 0 TO k-1 DO
		t := a[i]; a[i] := a[k]; a[k] := t;
		permute(k-1);
		t := a[i]; a[i] := a[k]; a[k] := t
	  END
	END
  END permute;

  PROCEDURE Go; (*command*)
    VAR n: INTEGER; S: Texts.Scanner;
  BEGIN Texts.OpenScanner(S, Oberon.Par.text, Oberon.Par.pos); Texts.Scan(S);
    COPY(S.s, a); n := 0;
    WHILE a[n] > 0X DO INC(n) END ;
    permute(n-1);
    Texts.WriteLn(W); Texts.Append(Oberon.Log, W.buf)
  END Go;

  BEGIN Texts.OpenWriter(W);
	Go();
  END Permute.
