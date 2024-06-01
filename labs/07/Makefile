all:
	lex chatbot.l
	bison -d chatbot.y
	cc lex.yy.c chatbot.tab.c -o chatbot -ll -ly
test:
	./chatbot
clean:
	rm -f chatbot chatbot.tab.c chatbot.tab.h lex.yy.c