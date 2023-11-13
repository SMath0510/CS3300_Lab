%{
#include<stdio.h>
#include<string.h>
int wordcnt = 0, charcnt = 0, linecnt = 0;
%}

%%
[a-zA-Z]+ {wordcnt ++; charcnt += strlen(yytext); }
[\n]      {linecnt ++; charcnt ++;}
.         {charcnt ++;}
%%

int yywrap()
{
    return 1;
}

int main()
{
    yylex();
    printf("%d %d %d\n", charcnt, wordcnt, linecnt);
    return 0;
}
