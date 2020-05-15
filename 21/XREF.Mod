MODULE XREF;
  IMPORT Texts, Oberon, TableHandler;
  CONST N = 32;    (* No. of keywords *)

  VAR lno: INTEGER;  (*current line number*)
	ch: CHAR;
	Tab: TableHandler.Word;
	T: Texts.Text; R: Texts.Reader; W: Texts.Writer;
	key: ARRAY N, 10 OF CHAR;  (*table of keywords*) 

  PROCEDURE heading;
  BEGIN INC(lno); Texts.WriteInt(W, lno, 5); Texts.Write(W, " ") 
  END heading;

  PROCEDURE Scan*;(*command*)
	VAR beg, end, time: LONGINT; 
	  k, m, l, r: INTEGER;
	  id: ARRAY TableHandler.WordLength OF CHAR;

  PROCEDURE copy;
  BEGIN Texts.Write(W, ch); Texts.Read(R, ch);
  END copy;

  BEGIN TableHandler.Init(Tab);
	Oberon.GetSelection(T, beg, end, time);
	IF time >= 0 THEN
	lno := 0; heading;
	Texts.OpenReader(R, T, beg); Texts.Read(R, ch);
	REPEAT
	  IF (CAP(ch) >= "A") & (CAP(ch) <= "Z") THEN (*word*)
		k := 0;
		REPEAT id[k] := ch; INC(k); copy
		UNTIL ~(("A" <= CAP(ch)) & (CAP(ch) <= "Z") OR ("a" <= ch) & (ch <= "z"));
		id[k] := 0X;
		l := 0; r := N;  (*binary search for key word*)
		REPEAT m := (l+r) DIV 2;
		  IF key[m] < id THEN l := m+1 ELSE r := m END ;
		UNTIL l >= r;
		IF (r = N) OR (id # key[r]) THEN TableHandler.Insert(id, lno, Tab) END
	  ELSIF (ch >= "0") & (ch <= "9") THEN (*number*)
		REPEAT copy UNTIL ~("0" <= ch) & (ch <= "9")
	  ELSIF ch = "(" THEN copy;
		IF ch = "*" THEN  (*skip comment*)
		  REPEAT
			REPEAT
			  IF ch = 0DX THEN copy; heading ELSE copy END
			UNTIL ch = "*";
			copy
		  UNTIL ch = ")";
		  copy
		END
	  ELSIF ch = 22X THEN (*string*)
		REPEAT copy UNTIL ch = 22X;
		copy
	  ELSIF ch = 0DX THEN (*end of line*)
		copy; heading
	  ELSE copy
	  END
	UNTIL R.eot;
	Texts.WriteLn(W); Texts.Append(Oberon.Log, W.buf);
	TableHandler.List(Tab)
   END

END Scan;

BEGIN Texts.OpenWriter(W);
  key[ 0] := "AND";
  key[ 1] := "ARRAY";
  key[ 2] := "BEGIN";
  key[ 3] := "BOOLEAN";
  key[ 4] := "BY";
  key[ 5] := "CASE";
  key[ 6] := "CONST";
  key[ 7] := "DIV";
  key[ 8] := "DO";
  key[ 9] := "ELSE";
  key[10] := "ELSIF";
  key[11] := "END";
  key[12] := "FOR";
  key[13] := "IF";
  key[14] := "IMPORT";
  key[15] := "IN";
  key[16] := "MOD";
  key[17] := "MODULE";
  key[18] := "NOT";
  key[19] := "OF";
  key[20] := "OR";
  key[21] := "POINTER";
  key[22] := "PROCEDURE";
  key[23] := "RECORD";
  key[24] := "REPEAT";
  key[25] := "RETURN";
  key[26] := "THEN";
  key[27] := "TO";
  key[28] := "TYPE";
  key[29] := "UNTIL";
  key[30] := "VAR";
  key[31] := "WHILE"
END XREF.
