all: lex yacc compile
lex:
	flex lex2.l
yacc:
	yacc -d y2.y
compile:
	gcc lex.yy.c y.tab.c -o ex1 -ll