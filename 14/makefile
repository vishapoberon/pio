VOC = /opt/voc/bin/voc

all:
		$(VOC) -m Permute.Mod Postfix.Mod Queens.Mod
		./Permute ABC
		./Postfix "a+b a*b+c a+b*c a*(b/[c-d]) ~~"
		./Queens
