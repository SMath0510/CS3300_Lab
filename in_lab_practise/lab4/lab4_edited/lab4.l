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
"=" {return EQL;}
"max" { return MAX; }
"print" {return PRINT; }
"if" {return IF; }
"then" {return THEN; }
[0-9]+ { yylval.num = atoi(yytext); return NUMBER; }
[a-zA-Z][a-zA-Z_0-9]* { yylval.str = strdup(yytext); return ID;}
\n {return EOL;}
[ \t] {}
. {printf("Found invalid character \n");}

%%

int yywrap()
{
    return 1;
}
