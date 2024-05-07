all:
	lex lex_analyzer.l
	gcc lex.yy.c -o lex_analyzer -ll
	rm lex.yy.c
test:
	python3 ../03/code_generator.py > example.ac
	echo "## SOURCE CODE ##"
	cat example.ac
	echo "## LEXICAL ANALYSIS ##"
	./lex_analyzer example.ac
	rm example.ac
clean:
	rm -f lex.yy.c lex_analyzer