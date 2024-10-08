/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_P1_TAB_H_INCLUDED
# define YY_YY_P1_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    IDENTIFIER = 258,              /* IDENTIFIER  */
    INTEGER_LITERAL = 259,         /* INTEGER_LITERAL  */
    LEFT_CURVY_PAREN = 260,        /* LEFT_CURVY_PAREN  */
    RIGHT_CURVY_PAREN = 261,       /* RIGHT_CURVY_PAREN  */
    LEFT_SQUARE_PAREN = 262,       /* LEFT_SQUARE_PAREN  */
    RIGHT_SQUARE_PAREN = 263,      /* RIGHT_SQUARE_PAREN  */
    LEFT_NORMAL_PAREN = 264,       /* LEFT_NORMAL_PAREN  */
    RIGHT_NORMAL_PAREN = 265,      /* RIGHT_NORMAL_PAREN  */
    PUBLIC = 266,                  /* PUBLIC  */
    STATIC = 267,                  /* STATIC  */
    VOID = 268,                    /* VOID  */
    MAIN = 269,                    /* MAIN  */
    STRING = 270,                  /* STRING  */
    CLASS = 271,                   /* CLASS  */
    INT = 272,                     /* INT  */
    BOOLEAN = 273,                 /* BOOLEAN  */
    EXTENDS = 274,                 /* EXTENDS  */
    IF = 275,                      /* IF  */
    ELSE = 276,                    /* ELSE  */
    DO = 277,                      /* DO  */
    WHILE = 278,                   /* WHILE  */
    RETURN = 279,                  /* RETURN  */
    PRINTLN = 280,                 /* PRINTLN  */
    DEFINE = 281,                  /* DEFINE  */
    TRUE = 282,                    /* TRUE  */
    FALSE = 283,                   /* FALSE  */
    NEW = 284,                     /* NEW  */
    THIS = 285,                    /* THIS  */
    NOT = 286,                     /* NOT  */
    AND = 287,                     /* AND  */
    OR = 288,                      /* OR  */
    EQUAL = 289,                   /* EQUAL  */
    NOT_EQUAL = 290,               /* NOT_EQUAL  */
    LESS_EQUAL = 291,              /* LESS_EQUAL  */
    LESS_THAN = 292,               /* LESS_THAN  */
    GREATER_THAN = 293,            /* GREATER_THAN  */
    PLUS = 294,                    /* PLUS  */
    MINUS = 295,                   /* MINUS  */
    MULTIPLY = 296,                /* MULTIPLY  */
    DIVIDE = 297,                  /* DIVIDE  */
    LENGTH = 298,                  /* LENGTH  */
    DOT = 299,                     /* DOT  */
    COMMA = 300,                   /* COMMA  */
    SEMICOLON = 301                /* SEMICOLON  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 186 "P1.y"

    char* string_val;
    int int_val;

#line 115 "P1.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_P1_TAB_H_INCLUDED  */
