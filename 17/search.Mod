MODULE search;


TYPE Tree  = POINTER TO TreeNode;

TreeNode = RECORD
key: INTEGER;
left, right: Tree
END;

VAR p, obj : Tree;
	a : INTEGER;

  PROCEDURE search(VAR p: Tree; x: INTEGER): Tree;
	VAR q: Tree;
  BEGIN
	IF p # NIL THEN
	  IF p.key < x THEN
		q := search (p.right, x)
	  ELSIF p.key > x THEN
		q := search (p^.left, x)
	  ELSE q := p
	  END
	ELSE (*not found, hence insert*)
	  NEW(q); q.key := x;  q.left := NIL;  q.right := NIL    END ;
	RETURN q
END search;

BEGIN
  obj := search(p,a);
END search.
