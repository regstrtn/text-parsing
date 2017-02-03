all: lex yacc compile
lex:
	flex lex1.l
yacc:
	yacc -d y1.y
compile:
	gcc lex.yy.c y.tab.c -o ex1 -ll