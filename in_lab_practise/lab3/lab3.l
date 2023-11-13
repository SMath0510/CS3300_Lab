%{
#include<stdio.h>
#include<string.h>
#include "lab3.tab.h"

%}

%%
"+" {return ADD; }
"-" {return SUB; }
"*" {return MUL; }
"/" {return DIV; }
"|" {return ABS; }
"(" {return LBRACKET; }
")" {return RBRACKET; }
";" {return STP;}
"max" { return MAX; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
\n {return EOL;}
[ \t] {}
. {printf("Found invalid character \n");}

%%

int yywrap()
{
    return 1;
}
