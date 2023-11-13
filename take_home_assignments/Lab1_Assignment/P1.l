%option noyywrap

%{
#include <stdio.h>
#include <string.h>
#include "P1.tab.h"
%}

%%
"public" { yylval.string_val = strdup(yytext); return PUBLIC; }
"static" { yylval.string_val = strdup(yytext); return STATIC; }
"void" { yylval.string_val = strdup(yytext); return VOID; }
"main" { yylval.string_val = strdup(yytext); return MAIN; }
"String" { yylval.string_val = strdup(yytext); return STRING; }
"boolean" { yylval.string_val = strdup(yytext); return BOOLEAN; }
"int" { yylval.string_val = strdup(yytext); return INT; }
"class" { yylval.string_val = strdup(yytext); return CLASS; }
"extends" { yylval.string_val = strdup(yytext); return EXTENDS; }
"if" { yylval.string_val = strdup(yytext); return IF; }
"this" {yylval.string_val = strdup(yytext); return THIS; }
"else" { yylval.string_val = strdup(yytext); return ELSE; }
"do" { yylval.string_val = strdup(yytext); return DO; }
"while" { yylval.string_val = strdup(yytext); return WHILE; }
"return" { yylval.string_val = strdup(yytext); return RETURN; }
"System.out.println" { yylval.string_val = strdup(yytext); return PRINTLN; }
"true" { yylval.string_val = strdup(yytext); return TRUE; }
"false" { yylval.string_val = strdup(yytext); return FALSE; }
"new" { yylval.string_val = strdup(yytext); return NEW; }
"#define" { yylval.string_val = strdup(yytext); return DEFINE; }
"!" { yylval.string_val = strdup(yytext); return NOT; }
"&&" { yylval.string_val = strdup(yytext); return AND; }
"||" { yylval.string_val = strdup(yytext); return OR; }
"!=" { yylval.string_val = strdup(yytext); return NOT_EQUAL; }
"<=" { yylval.string_val = strdup(yytext); return LESS_EQUAL; }
"+" { yylval.string_val = strdup(yytext); return PLUS; }
"-" { yylval.string_val = strdup(yytext); return MINUS; }
"*" { yylval.string_val = strdup(yytext); return MULTIPLY; }
"/" { yylval.string_val = strdup(yytext); return DIVIDE; }
"length" { yylval.string_val = strdup(yytext); return LENGTH; }
"," { yylval.string_val = strdup(yytext); return COMMA; }
";" { yylval.string_val = strdup(yytext); return SEMICOLON; }
"(" { yylval.string_val = strdup(yytext); return LEFT_NORMAL_PAREN; }
")" { yylval.string_val = strdup(yytext); return RIGHT_NORMAL_PAREN; }
"{" { yylval.string_val = strdup(yytext); return LEFT_CURVY_PAREN; }
"}" { yylval.string_val = strdup(yytext); return RIGHT_CURVY_PAREN; }
"[" { yylval.string_val = strdup(yytext); return LEFT_SQUARE_PAREN; }
"]" { yylval.string_val = strdup(yytext); return RIGHT_SQUARE_PAREN; }
"<" { yylval.string_val = strdup(yytext); return LESS_THAN; }
">" { yylval.string_val = strdup(yytext); return GREATER_THAN; }
"=" { yylval.string_val = strdup(yytext); return EQUAL; }
"\." { yylval.string_val = strdup(yytext); return DOT; } 
[0-9]+ { yylval.string_val = strdup(yytext); return INTEGER_LITERAL; }
[a-zA-Z][a-zA-Z_0-9]* { yylval.string_val = strdup(yytext); return IDENTIFIER; }
"\/\/".* {  }
[ \t\n\r] { }
. { }
%%
