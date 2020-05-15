MODULE TableHandler;
  IMPORT Texts, Oberon;

  CONST WordLength* = 32;

  TYPE Item =  POINTER TO ItemDesc;


	ItemDesc = RECORD
	  num: INTEGER; 
	  next: Item
	END;

	Word* =  POINTER TO WordDesc;
	
	WordDesc = RECORD
	  key: ARRAY WordLength OF CHAR;
	  first: Item;       (*list head*)
	  left, right: Word
	END;
  VAR W: Texts.Writer;
  
  PROCEDURE Init*(VAR w: Word);
  BEGIN w := NIL
  END Init;

  PROCEDURE Insert*(VAR s: ARRAY OF CHAR; lno: INTEGER; VAR w: Word);
  (*search node with name s*)
	VAR w0: Word; t: Item;
  BEGIN
	IF w = NIL THEN (*insert new word*)
	  NEW(w0); w0.key := s; w0.left := NIL; w0.right := NIL;
	  NEW(t); t.num := lno; t.next := NIL; w0.first := t; w := w0
	ELSIF s < w.key THEN Insert(s, lno, w.left)
	ELSIF s > w.key THEN Insert(s, lno, w.right)
	ELSE NEW(t); t.num := lno; t.next := w.first; w.first := t
	END
  END Insert;

  PROCEDURE write(w: Word);
	VAR t: Item;
  BEGIN Texts.WriteString(W, w.key); t := w.first;
	REPEAT Texts.WriteInt(W, t.num, 5); t := t.next UNTIL t = NIL;
	Texts.WriteLn(W)
  END write; 

  PROCEDURE List*(w: Word);
  BEGIN
	IF w # NIL THEN List(w.left); write(w); List(w.right) END ;
	Texts.Append(Oberon.Log, W.buf)
  END List;

BEGIN Texts.OpenWriter(W)
END TableHandler.
