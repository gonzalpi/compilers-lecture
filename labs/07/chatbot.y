%{
#include <stdio.h>
#include <time.h>

void yyerror(const char *s);
int yylex(void);
%}

%token HELLO GOODBYE TIME THANKS NAME QUIT

%%

chatbot : greeting
    | farewell
    | query
    | thanks
    | name
    | quit
    ;

greeting : HELLO { printf("Chatbot: Hello! How can I help you today?\n"); }
    ;

farewell : GOODBYE { printf("Chatbot: Goodbye! Have a great day!\n"); }
    ;

query : TIME { 
        time_t now = time(NULL);
        struct tm *local = localtime(&now);
        printf("Chatbot: The current time is %02d:%02d.\n", local->tm_hour, local->tm_min);
    }
    ;

thanks : THANKS { printf("You're welcome! Let me know it there's anything else I can help you with.\n"); }
    ;

name : NAME { printf("I am Lexibot, a lex-yacc based chatbot.\n"); }
    ;

quit : QUIT {
        printf("Quitting\n");
        return 1;
    }
    ;

%%

int main() {
    printf("Chatbot: Hi! You can greet me, ask for the time, or say goodbye.\n");
    while (yyparse() == 0) {
        // Loop until end of input
    }
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Chatbot: I didn't understand that.\n");
}