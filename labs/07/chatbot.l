%{
#include "chatbot.tab.h"
%}

%%

hello           { return HELLO; }
hi              { return HELLO; }
hey             { return HELLO; }
goodbye         { return GOODBYE; }
bye             { return GOODBYE; }
time            { return TIME; }
what[' ']is[' ']the[' ']time  { return TIME; }
what[' ']time[' ']is[' ']it  { return TIME; }
thanks          { return THANKS; }
thank[' ']you   { return THANKS; }
what[' ']is[' ']your[' ']name   { return NAME; }
q               { return QUIT; }
quit            { return QUIT; }
exit            { return QUIT; }
\n              { return 0; }  /* End of input on newline */

.               { return yytext[0]; }

%%

int yywrap() {
    return 1;
}