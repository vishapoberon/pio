MODULE This;
IMPORT Texts, Oberon, Viewers;
  PROCEDURE This*(): Texts.Text;
	VAR beg, end, time: INTEGER;
	S: Texts.Scanner; T: Texts.Text; v: Viewers.Viewer;
  BEGIN Texts.OpenScanner(S, Oberon.Par.text, Oberon.Par.pos); Texts.Scan(S);
	IF S.class = Texts.Char THEN
	  IF S.c = "*" THEN  (*input in marked viewer*)
		v := Oberon.MarkedViewer();
		IF (v.dsc # NIL) & (v.dsc.next IS TextFrames.Frame) THEN
		  T := v.dsc.next(TextFrames.Frame).text; beg := 0
		END
	  ELSIF S.c = "@" THEN  (*input starts at selection*)
		Oberon.GetSelection(T, beg, end, time);
		IF time < 0 THEN T := NIL END
	  ELSIF S.c = “↑” THEN  (*selection is the file name*)
		Oberon.GetSelection(T, beg, end, time);
		IF time >= 0 THEN (*there is a selection*)
		  Texts.OpenScanner(S, Oberon.Par.text, Oberon.Par.pos); Texts.Scan(S);
		  IF S.class = Texts.Name THEN (*input is named file*)
			NEW(T); Texts.Open(T, S.s); pos := 0
		  END
		END
	  END
	ELSIF S.class = Texts.Name THEN  (*input is named file*)
		NEW(T); Texts.Open(T, S.s); pos := 0 
	END ;
	RETURN T
  END This;

BEGIN  This
End;
