MODULE Postfix;
  IMPORT Texts, Oberon;
  VAR ch: CHAR;
	W: Texts.Writer; R: Texts.Reader;

PROCEDURE expression;
  VAR addop: CHAR;

PROCEDURE term;
  VAR mulop: CHAR;

PROCEDURE factor;
BEGIN
  IF ch = "(" THEN
	Texts.Read(R, ch);  expression;
	WHILE ch # ")" DO Texts.Read(R, ch) END
  ELSIF ch = "[" THEN
	Texts.Read(R, ch);    expression;
	WHILE ch # "]" DO Texts.Read(R, ch) END
  ELSE
	WHILE (ch < "a") OR (ch > "z") DO Texts.Read(R,ch) END ;
	Texts.Write(W,ch)
  END;
  Texts.Read(R, ch)
END factor;

BEGIN (*term*) factor;
  WHILE (ch = "*") OR (ch = "/") DO
	mulop := ch; Texts.Read(R, ch); factor; Texts.Write(W, mulop)
  END
END term;

BEGIN (*expression*) term;
  WHILE (ch = "+") OR (ch = "-") DO
	addop := ch; Texts.Read(R, ch); term; Texts.Write(W, addop)
  END
END expression;

PROCEDURE Parse;
BEGIN Texts.OpenReader(R, Oberon.Par.text, Oberon.Par.pos); Texts.Read(R, ch);
  WHILE ch # "~" DO
	expression; Texts.WriteLn(W); Texts.Append(Oberon.Log, W.buf);
	Texts.Read(R, ch)
  END
END Parse;

BEGIN Texts.OpenWriter(W);
  factor;
END Postfix.
