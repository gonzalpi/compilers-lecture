%{
#include <stdio.h>
%}

%%
\/\/.*      printf("comment");
\s+         printf(" ");
i           printf("intdcl");
f           printf("floatdcl");
p           printf("print");
[a-z]       printf("id");
=           printf("assign");
\+          printf("plus");
[0-9]*\.([0-9]{1,5})?   printf("fnum");
[0-9]+      printf("inum");
%%

int main(int argc, char **argv) {
    FILE    *fd;

    if (argc == 2)
    {
        if (!(fd = fopen(argv[1], "r")))
        {
            perror("Error: ");
            return (-1);
        }
        yyset_in(fd);
        yylex();
        fclose(fd);
    }
    else
        printf("Usage: a.out filename\n");
    return (0);
}