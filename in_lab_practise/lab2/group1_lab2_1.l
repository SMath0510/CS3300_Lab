%{
#include<stdio.h>
#include<string.h>
%}

%%

if {printf("Found keyword if\n");}
int {printf("Found keyword  int\n");}
[{}()\[\]] {printf("Found bracket   %s \n", yytext);}
[+\-*/] {printf("Found operator %s \n",yytext);}
[0-9]+ {printf("Found integer %s \n", yytext);}
[a-zA-Z]+ {printf("Found identifier %s \n", yytext);}
[;=] {printf("Found symbol %s \n", yytext);}
[ \t\n]+ {} 
. {printf("Found invalid character \n");}

%%

int yywrap()
{
    return 1;
}

int main()
{
    yylex();
    return 0;
}