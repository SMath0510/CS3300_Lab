/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison implementation for Yacc-like parsers in C

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

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output, and Bison version.  */
#define YYBISON 30802

/* Bison version string.  */
#define YYBISON_VERSION "3.8.2"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1




/* First part of user prologue.  */
#line 1 "P1.y"

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
extern int yylex();
void yyerror();

const int spaces = 0;
const int macro = 1;
const int error = 1;
const int endspaces = 1;

struct Node{
    char * id;
    char ** split_args;
    char * arg_string;
    int num_args;
    int statement;
};

struct Map{
    char * name;
    char * value;
};

const int debug = 0;

struct Node macro_tokens[25000];
int num_process = 0;

int valid_char(char x){
    if((x >= 'a' && x <= 'z') || (x >= 'A' && x <= 'Z') || (x >= '0' && x <= '9') || x == '$' || x == '_') return 1;
    return 0;
}

char * str_cat(char *a, char *b){
    strcat(a, b);
    return a;
}

char ** getargs(char *inputarg, int *numargs){
    if(inputarg == NULL){
        (*numargs) = 0;
        return NULL;
    }
    if(strlen(inputarg) == 0){
        (*numargs) = 0;
        return NULL;
    }
    (*numargs) = 1;
    int l = strlen(inputarg);
    for(int i = 0; i < l; i++){
        if(inputarg[i] == ','){
            (*numargs) ++;
        }
    }
    char ** splitargs = (char **) malloc(((*numargs))*sizeof(char *));
    int iidx = 0;
    for(int i = 0; i < (*numargs); i++){
        char *currarg = (char *) malloc((l)*sizeof(char));
        int cidx = 0;
        while(iidx < l && inputarg[iidx] != ','){
            currarg[cidx] = inputarg[iidx];
            cidx ++;
            iidx ++;
        }
        iidx ++;
        currarg[cidx] = '\0';
        splitargs[i] = currarg;
    }
    return splitargs;
}

char* remove_white_spaces(char* input) {
    if (input == NULL) {
        return NULL; 
    }

    char* output = malloc(strlen(input) + 1); 
    if (output == NULL) {
        return NULL;
    }

    int i = 0, j = 0;
    while (input[i]) {
        if (!isspace((unsigned char)input[i])) {
            output[j++] = input[i];
        }
        i++;
    }
    output[j] = '\0';

    return output;
}


void add_entry(char * name, char * input_argv, char * input_string, int state){
    name = remove_white_spaces(name);
    for(int i = 0; i < num_process; i++){
        if(debug) printf("%s %s \n", name, macro_tokens[i].id);
        if(strcmp(name, macro_tokens[i].id) == 0) {
            if(debug) printf("Maa chod dunga\n");
            if(error) yyerror();
            exit(1);
        }
    }
    int num_arg;
    char ** input_split_args = getargs(input_argv, &num_arg);
    struct Node process;
    process.id = name;
    process.split_args = input_split_args;
    process.num_args = num_arg;
    process.arg_string = input_string;
    process.statement = state;
    macro_tokens[num_process] = process;
    num_process ++;
    if(debug) printf("%s entry new \n", name);
}   

int find(char * srchstr){
    for(int i = 0; i < num_process; i++){
        if(strcmp(srchstr, macro_tokens[i].id) == 0){
            return i;
        }
    }
    return -1;
}

char * cts(char c){
    char * st = (char *)malloc(sizeof(char));
    st[0] = c;
    return st;
}

char * process_string(char * id,  char * args, int statement){
    args = remove_white_spaces(args);
    id = remove_white_spaces(id);
    if(find(id) == -1) if(error) yyerror();
    int idx = find(id);
    if(macro_tokens[idx].statement != statement) if(error) yyerror();
    int num_args;
    char ** split_args = getargs(args, &num_args);
    if(num_args != macro_tokens[idx].num_args) if(error) yyerror();
    struct Map mapping[num_args];
    for(int i = 0; i < num_args; i++){
        mapping[i].name = macro_tokens[idx].split_args[i];
        mapping[i].value = split_args[i];
        if(debug) printf("Mapped %s -> %s\n", mapping[i].name, mapping[i].value);
    }
    char * final = strdup("");
    char * base = macro_tokens[idx].arg_string;
    int len = strlen(base);
    if(debug) printf("%s args %s base \n", args, base);
    int i = 0, j = 0;
    while(i < len){
        char * check = strdup("");
        if(j < i) j = i;
        while(j < len && valid_char(base[j])){
            check = strcat(check, cts(base[j]));
            j++;
        }
        for(int i = 0; i < num_args; i++){
            if(strcmp(check, mapping[i].name) == 0){
                check = mapping[i].value;
                break;
            }
        }
        final = strcat(final, check);
        if(j < len) final = strcat(final, cts(base[j]));
        i = j + 1;
        if(debug) printf("%s ck\n", check);
    }
    return final;
}


char* concat(char* str1, char* str2) {
    char* result = (char*)malloc(strlen(str1) + strlen(str2) + 1);
    strcpy(result, str1);
    strcat(result, str2);
    return result;
}

#line 256 "P1.tab.c"

# ifndef YY_CAST
#  ifdef __cplusplus
#   define YY_CAST(Type, Val) static_cast<Type> (Val)
#   define YY_REINTERPRET_CAST(Type, Val) reinterpret_cast<Type> (Val)
#  else
#   define YY_CAST(Type, Val) ((Type) (Val))
#   define YY_REINTERPRET_CAST(Type, Val) ((Type) (Val))
#  endif
# endif
# ifndef YY_NULLPTR
#  if defined __cplusplus
#   if 201103L <= __cplusplus
#    define YY_NULLPTR nullptr
#   else
#    define YY_NULLPTR 0
#   endif
#  else
#   define YY_NULLPTR ((void*)0)
#  endif
# endif

#include "P1.tab.h"
/* Symbol kind.  */
enum yysymbol_kind_t
{
  YYSYMBOL_YYEMPTY = -2,
  YYSYMBOL_YYEOF = 0,                      /* "end of file"  */
  YYSYMBOL_YYerror = 1,                    /* error  */
  YYSYMBOL_YYUNDEF = 2,                    /* "invalid token"  */
  YYSYMBOL_IDENTIFIER = 3,                 /* IDENTIFIER  */
  YYSYMBOL_INTEGER_LITERAL = 4,            /* INTEGER_LITERAL  */
  YYSYMBOL_LEFT_CURVY_PAREN = 5,           /* LEFT_CURVY_PAREN  */
  YYSYMBOL_RIGHT_CURVY_PAREN = 6,          /* RIGHT_CURVY_PAREN  */
  YYSYMBOL_LEFT_SQUARE_PAREN = 7,          /* LEFT_SQUARE_PAREN  */
  YYSYMBOL_RIGHT_SQUARE_PAREN = 8,         /* RIGHT_SQUARE_PAREN  */
  YYSYMBOL_LEFT_NORMAL_PAREN = 9,          /* LEFT_NORMAL_PAREN  */
  YYSYMBOL_RIGHT_NORMAL_PAREN = 10,        /* RIGHT_NORMAL_PAREN  */
  YYSYMBOL_PUBLIC = 11,                    /* PUBLIC  */
  YYSYMBOL_STATIC = 12,                    /* STATIC  */
  YYSYMBOL_VOID = 13,                      /* VOID  */
  YYSYMBOL_MAIN = 14,                      /* MAIN  */
  YYSYMBOL_STRING = 15,                    /* STRING  */
  YYSYMBOL_CLASS = 16,                     /* CLASS  */
  YYSYMBOL_INT = 17,                       /* INT  */
  YYSYMBOL_BOOLEAN = 18,                   /* BOOLEAN  */
  YYSYMBOL_EXTENDS = 19,                   /* EXTENDS  */
  YYSYMBOL_IF = 20,                        /* IF  */
  YYSYMBOL_ELSE = 21,                      /* ELSE  */
  YYSYMBOL_DO = 22,                        /* DO  */
  YYSYMBOL_WHILE = 23,                     /* WHILE  */
  YYSYMBOL_RETURN = 24,                    /* RETURN  */
  YYSYMBOL_PRINTLN = 25,                   /* PRINTLN  */
  YYSYMBOL_DEFINE = 26,                    /* DEFINE  */
  YYSYMBOL_TRUE = 27,                      /* TRUE  */
  YYSYMBOL_FALSE = 28,                     /* FALSE  */
  YYSYMBOL_NEW = 29,                       /* NEW  */
  YYSYMBOL_THIS = 30,                      /* THIS  */
  YYSYMBOL_NOT = 31,                       /* NOT  */
  YYSYMBOL_AND = 32,                       /* AND  */
  YYSYMBOL_OR = 33,                        /* OR  */
  YYSYMBOL_EQUAL = 34,                     /* EQUAL  */
  YYSYMBOL_NOT_EQUAL = 35,                 /* NOT_EQUAL  */
  YYSYMBOL_LESS_EQUAL = 36,                /* LESS_EQUAL  */
  YYSYMBOL_LESS_THAN = 37,                 /* LESS_THAN  */
  YYSYMBOL_GREATER_THAN = 38,              /* GREATER_THAN  */
  YYSYMBOL_PLUS = 39,                      /* PLUS  */
  YYSYMBOL_MINUS = 40,                     /* MINUS  */
  YYSYMBOL_MULTIPLY = 41,                  /* MULTIPLY  */
  YYSYMBOL_DIVIDE = 42,                    /* DIVIDE  */
  YYSYMBOL_LENGTH = 43,                    /* LENGTH  */
  YYSYMBOL_DOT = 44,                       /* DOT  */
  YYSYMBOL_COMMA = 45,                     /* COMMA  */
  YYSYMBOL_SEMICOLON = 46,                 /* SEMICOLON  */
  YYSYMBOL_YYACCEPT = 47,                  /* $accept  */
  YYSYMBOL_Goal = 48,                      /* Goal  */
  YYSYMBOL_MacroDefinitionRec = 49,        /* MacroDefinitionRec  */
  YYSYMBOL_TypeDeclarationRec = 50,        /* TypeDeclarationRec  */
  YYSYMBOL_MainClass = 51,                 /* MainClass  */
  YYSYMBOL_TypeDeclaration = 52,           /* TypeDeclaration  */
  YYSYMBOL_MethodDeclarationRec = 53,      /* MethodDeclarationRec  */
  YYSYMBOL_MethodDeclaration = 54,         /* MethodDeclaration  */
  YYSYMBOL_TypeIdentifierRec = 55,         /* TypeIdentifierRec  */
  YYSYMBOL_TypeIdenTypePlus = 56,          /* TypeIdenTypePlus  */
  YYSYMBOL_TypeTmp = 57,                   /* TypeTmp  */
  YYSYMBOL_Type = 58,                      /* Type  */
  YYSYMBOL_StatementRec = 59,              /* StatementRec  */
  YYSYMBOL_Statement = 60,                 /* Statement  */
  YYSYMBOL_ExpressionPlus = 61,            /* ExpressionPlus  */
  YYSYMBOL_Expression = 62,                /* Expression  */
  YYSYMBOL_PrimaryExpression = 63,         /* PrimaryExpression  */
  YYSYMBOL_MacroDefinition = 64,           /* MacroDefinition  */
  YYSYMBOL_IdenCommaIdenPlus = 65,         /* IdenCommaIdenPlus  */
  YYSYMBOL_MacroDefStatement = 66,         /* MacroDefStatement  */
  YYSYMBOL_MacroDefExpression = 67,        /* MacroDefExpression  */
  YYSYMBOL_Identifier = 68,                /* Identifier  */
  YYSYMBOL_Integer = 69                    /* Integer  */
};
typedef enum yysymbol_kind_t yysymbol_kind_t;




#ifdef short
# undef short
#endif

/* On compilers that do not define __PTRDIFF_MAX__ etc., make sure
   <limits.h> and (if available) <stdint.h> are included
   so that the code can choose integer types of a good width.  */

#ifndef __PTRDIFF_MAX__
# include <limits.h> /* INFRINGES ON USER NAME SPACE */
# if defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stdint.h> /* INFRINGES ON USER NAME SPACE */
#  define YY_STDINT_H
# endif
#endif

/* Narrow types that promote to a signed type and that can represent a
   signed or unsigned integer of at least N bits.  In tables they can
   save space and decrease cache pressure.  Promoting to a signed type
   helps avoid bugs in integer arithmetic.  */

#ifdef __INT_LEAST8_MAX__
typedef __INT_LEAST8_TYPE__ yytype_int8;
#elif defined YY_STDINT_H
typedef int_least8_t yytype_int8;
#else
typedef signed char yytype_int8;
#endif

#ifdef __INT_LEAST16_MAX__
typedef __INT_LEAST16_TYPE__ yytype_int16;
#elif defined YY_STDINT_H
typedef int_least16_t yytype_int16;
#else
typedef short yytype_int16;
#endif

/* Work around bug in HP-UX 11.23, which defines these macros
   incorrectly for preprocessor constants.  This workaround can likely
   be removed in 2023, as HPE has promised support for HP-UX 11.23
   (aka HP-UX 11i v2) only through the end of 2022; see Table 2 of
   <https://h20195.www2.hpe.com/V2/getpdf.aspx/4AA4-7673ENW.pdf>.  */
#ifdef __hpux
# undef UINT_LEAST8_MAX
# undef UINT_LEAST16_MAX
# define UINT_LEAST8_MAX 255
# define UINT_LEAST16_MAX 65535
#endif

#if defined __UINT_LEAST8_MAX__ && __UINT_LEAST8_MAX__ <= __INT_MAX__
typedef __UINT_LEAST8_TYPE__ yytype_uint8;
#elif (!defined __UINT_LEAST8_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST8_MAX <= INT_MAX)
typedef uint_least8_t yytype_uint8;
#elif !defined __UINT_LEAST8_MAX__ && UCHAR_MAX <= INT_MAX
typedef unsigned char yytype_uint8;
#else
typedef short yytype_uint8;
#endif

#if defined __UINT_LEAST16_MAX__ && __UINT_LEAST16_MAX__ <= __INT_MAX__
typedef __UINT_LEAST16_TYPE__ yytype_uint16;
#elif (!defined __UINT_LEAST16_MAX__ && defined YY_STDINT_H \
       && UINT_LEAST16_MAX <= INT_MAX)
typedef uint_least16_t yytype_uint16;
#elif !defined __UINT_LEAST16_MAX__ && USHRT_MAX <= INT_MAX
typedef unsigned short yytype_uint16;
#else
typedef int yytype_uint16;
#endif

#ifndef YYPTRDIFF_T
# if defined __PTRDIFF_TYPE__ && defined __PTRDIFF_MAX__
#  define YYPTRDIFF_T __PTRDIFF_TYPE__
#  define YYPTRDIFF_MAXIMUM __PTRDIFF_MAX__
# elif defined PTRDIFF_MAX
#  ifndef ptrdiff_t
#   include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  endif
#  define YYPTRDIFF_T ptrdiff_t
#  define YYPTRDIFF_MAXIMUM PTRDIFF_MAX
# else
#  define YYPTRDIFF_T long
#  define YYPTRDIFF_MAXIMUM LONG_MAX
# endif
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif defined __STDC_VERSION__ && 199901 <= __STDC_VERSION__
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned
# endif
#endif

#define YYSIZE_MAXIMUM                                  \
  YY_CAST (YYPTRDIFF_T,                                 \
           (YYPTRDIFF_MAXIMUM < YY_CAST (YYSIZE_T, -1)  \
            ? YYPTRDIFF_MAXIMUM                         \
            : YY_CAST (YYSIZE_T, -1)))

#define YYSIZEOF(X) YY_CAST (YYPTRDIFF_T, sizeof (X))


/* Stored state numbers (used for stacks). */
typedef yytype_uint8 yy_state_t;

/* State numbers in computations.  */
typedef int yy_state_fast_t;

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(Msgid) dgettext ("bison-runtime", Msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(Msgid) Msgid
# endif
#endif


#ifndef YY_ATTRIBUTE_PURE
# if defined __GNUC__ && 2 < __GNUC__ + (96 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_PURE __attribute__ ((__pure__))
# else
#  define YY_ATTRIBUTE_PURE
# endif
#endif

#ifndef YY_ATTRIBUTE_UNUSED
# if defined __GNUC__ && 2 < __GNUC__ + (7 <= __GNUC_MINOR__)
#  define YY_ATTRIBUTE_UNUSED __attribute__ ((__unused__))
# else
#  define YY_ATTRIBUTE_UNUSED
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YY_USE(E) ((void) (E))
#else
# define YY_USE(E) /* empty */
#endif

/* Suppress an incorrect diagnostic about yylval being uninitialized.  */
#if defined __GNUC__ && ! defined __ICC && 406 <= __GNUC__ * 100 + __GNUC_MINOR__
# if __GNUC__ * 100 + __GNUC_MINOR__ < 407
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")
# else
#  define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN                           \
    _Pragma ("GCC diagnostic push")                                     \
    _Pragma ("GCC diagnostic ignored \"-Wuninitialized\"")              \
    _Pragma ("GCC diagnostic ignored \"-Wmaybe-uninitialized\"")
# endif
# define YY_IGNORE_MAYBE_UNINITIALIZED_END      \
    _Pragma ("GCC diagnostic pop")
#else
# define YY_INITIAL_VALUE(Value) Value
#endif
#ifndef YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
# define YY_IGNORE_MAYBE_UNINITIALIZED_END
#endif
#ifndef YY_INITIAL_VALUE
# define YY_INITIAL_VALUE(Value) /* Nothing. */
#endif

#if defined __cplusplus && defined __GNUC__ && ! defined __ICC && 6 <= __GNUC__
# define YY_IGNORE_USELESS_CAST_BEGIN                          \
    _Pragma ("GCC diagnostic push")                            \
    _Pragma ("GCC diagnostic ignored \"-Wuseless-cast\"")
# define YY_IGNORE_USELESS_CAST_END            \
    _Pragma ("GCC diagnostic pop")
#endif
#ifndef YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_BEGIN
# define YY_IGNORE_USELESS_CAST_END
#endif


#define YY_ASSERT(E) ((void) (0 && (E)))

#if !defined yyoverflow

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
      /* Use EXIT_SUCCESS as a witness for stdlib.h.  */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's 'empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (0)
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
             && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* !defined yyoverflow */

#if (! defined yyoverflow \
     && (! defined __cplusplus \
         || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yy_state_t yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (YYSIZEOF (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (YYSIZEOF (yy_state_t) + YYSIZEOF (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)                           \
    do                                                                  \
      {                                                                 \
        YYPTRDIFF_T yynewbytes;                                         \
        YYCOPY (&yyptr->Stack_alloc, Stack, yysize);                    \
        Stack = &yyptr->Stack_alloc;                                    \
        yynewbytes = yystacksize * YYSIZEOF (*Stack) + YYSTACK_GAP_MAXIMUM; \
        yyptr += yynewbytes / YYSIZEOF (*yyptr);                        \
      }                                                                 \
    while (0)

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from SRC to DST.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(Dst, Src, Count) \
      __builtin_memcpy (Dst, Src, YY_CAST (YYSIZE_T, (Count)) * sizeof (*(Src)))
#  else
#   define YYCOPY(Dst, Src, Count)              \
      do                                        \
        {                                       \
          YYPTRDIFF_T yyi;                      \
          for (yyi = 0; yyi < (Count); yyi++)   \
            (Dst)[yyi] = (Src)[yyi];            \
        }                                       \
      while (0)
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  9
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   205

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  47
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  23
/* YYNRULES -- Number of rules.  */
#define YYNRULES  69
/* YYNSTATES -- Number of states.  */
#define YYNSTATES  190

/* YYMAXUTOK -- Last valid token kind.  */
#define YYMAXUTOK   301


/* YYTRANSLATE(TOKEN-NUM) -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex, with out-of-bounds checking.  */
#define YYTRANSLATE(YYX)                                \
  (0 <= (YYX) && (YYX) <= YYMAXUTOK                     \
   ? YY_CAST (yysymbol_kind_t, yytranslate[YYX])        \
   : YYSYMBOL_YYUNDEF)

/* YYTRANSLATE[TOKEN-NUM] -- Symbol number corresponding to TOKEN-NUM
   as returned by yylex.  */
static const yytype_int8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46
};

#if YYDEBUG
/* YYRLINE[YYN] -- Source line where rule number YYN was defined.  */
static const yytype_int16 yyrline[] =
{
       0,   210,   210,   221,   222,   229,   230,   237,   284,   299,
     321,   322,   329,   360,   361,   374,   375,   386,   387,   401,
     410,   414,   417,   423,   424,   431,   440,   453,   464,   481,
     494,   511,   528,   541,   558,   559,   562,   573,   582,   591,
     600,   609,   618,   627,   636,   645,   656,   659,   668,   683,
     698,   701,   704,   707,   710,   713,   726,   737,   742,   753,
     754,   758,   759,   763,   774,   797,   820,   825,   829,   834
};
#endif

/** Accessing symbol of state STATE.  */
#define YY_ACCESSING_SYMBOL(State) YY_CAST (yysymbol_kind_t, yystos[State])

#if YYDEBUG || 0
/* The user-facing name of the symbol whose (internal) number is
   YYSYMBOL.  No bounds checking.  */
static const char *yysymbol_name (yysymbol_kind_t yysymbol) YY_ATTRIBUTE_UNUSED;

/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "\"end of file\"", "error", "\"invalid token\"", "IDENTIFIER",
  "INTEGER_LITERAL", "LEFT_CURVY_PAREN", "RIGHT_CURVY_PAREN",
  "LEFT_SQUARE_PAREN", "RIGHT_SQUARE_PAREN", "LEFT_NORMAL_PAREN",
  "RIGHT_NORMAL_PAREN", "PUBLIC", "STATIC", "VOID", "MAIN", "STRING",
  "CLASS", "INT", "BOOLEAN", "EXTENDS", "IF", "ELSE", "DO", "WHILE",
  "RETURN", "PRINTLN", "DEFINE", "TRUE", "FALSE", "NEW", "THIS", "NOT",
  "AND", "OR", "EQUAL", "NOT_EQUAL", "LESS_EQUAL", "LESS_THAN",
  "GREATER_THAN", "PLUS", "MINUS", "MULTIPLY", "DIVIDE", "LENGTH", "DOT",
  "COMMA", "SEMICOLON", "$accept", "Goal", "MacroDefinitionRec",
  "TypeDeclarationRec", "MainClass", "TypeDeclaration",
  "MethodDeclarationRec", "MethodDeclaration", "TypeIdentifierRec",
  "TypeIdenTypePlus", "TypeTmp", "Type", "StatementRec", "Statement",
  "ExpressionPlus", "Expression", "PrimaryExpression", "MacroDefinition",
  "IdenCommaIdenPlus", "MacroDefStatement", "MacroDefExpression",
  "Identifier", "Integer", YY_NULLPTR
};

static const char *
yysymbol_name (yysymbol_kind_t yysymbol)
{
  return yytname[yysymbol];
}
#endif

#define YYPACT_NINF (-89)

#define yypact_value_is_default(Yyn) \
  ((Yyn) == YYPACT_NINF)

#define YYTABLE_NINF (-1)

#define yytable_value_is_error(Yyn) \
  0

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
static const yytype_int16 yypact[] =
{
     -13,    13,    18,    12,   -13,   -89,   -89,   -89,    21,   -89,
      13,    25,   -89,    13,    37,    13,   -89,    25,    11,   -89,
      36,     6,   -89,    15,    13,    38,   -89,    13,   154,    34,
     -89,    45,   116,    44,   154,    57,   154,    59,    60,    64,
     154,    10,   -89,    34,   -89,   -89,     5,   -89,    34,    68,
      73,    80,    69,    87,   -89,    85,    76,    71,   -89,    97,
      95,    13,   -89,   -89,   106,    34,    91,    34,    34,   -89,
     -89,    34,    34,    34,   105,   111,   113,   -89,   -89,   -89,
     -89,    34,    34,    34,    34,    34,    34,    34,    34,    34,
       3,    34,   114,    13,   112,   -89,   -89,    78,   116,   -89,
     115,   123,   127,   128,   132,    22,   -89,    90,   -89,    34,
     131,   137,   -89,   -89,   -89,   -89,   -89,   -89,   -89,   -89,
     -89,   -89,   138,    26,   135,   143,   -89,   -89,   147,   154,
      34,   154,   108,   124,   117,    34,   -89,   153,   -89,   -89,
      34,   -89,   155,    76,   -89,   145,   159,   -89,   -89,    34,
     -89,   -89,   -89,    30,   156,   160,    13,   154,   129,   144,
     -89,    13,   168,   133,   -89,   -89,   -89,   179,   -89,    76,
     -89,   186,   126,    13,   167,   169,    10,   133,   185,    34,
     -89,    34,   149,   187,   190,   152,   -89,   193,   194,   -89
};

/* YYDEFACT[STATE-NUM] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE does not specify something else to do.  Zero
   means the default is an error.  */
static const yytype_int8 yydefact[] =
{
       3,     0,     0,     0,     3,    60,    59,    66,     0,     1,
       0,     5,     4,    61,     0,     0,     2,     5,     0,    62,
       0,     0,     6,     0,     0,     0,    13,     0,    23,     0,
      63,     0,    10,     0,    23,     0,     0,     0,     0,     0,
      23,     0,    67,     0,    51,    52,     0,    54,     0,     0,
       0,     0,    46,    53,    50,     0,     0,    21,    20,     0,
      10,     0,    22,    13,     0,     0,     0,     0,     0,    64,
      24,     0,    34,     0,     0,     0,     0,    57,    69,    68,
      65,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    34,     0,     0,     0,     8,    11,     0,    10,    25,
       0,     0,     0,     0,     0,     0,    35,     0,    58,     0,
       0,     0,    53,    37,    38,    39,    40,    41,    42,    43,
      44,    47,     0,     0,     0,     0,    19,    14,     0,     0,
       0,     0,     0,     0,     0,     0,    27,     0,    56,    45,
      34,    49,     0,    15,     9,    29,     0,    32,    26,     0,
      33,    36,    55,     0,     0,     0,     0,     0,     0,     0,
      48,     0,     0,    17,    30,    31,    28,     0,    13,     0,
      16,     0,    23,     0,     0,     0,    22,    17,     0,     0,
      18,     0,     0,     0,     0,     0,    12,     0,     0,     7
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
     -89,   -89,   197,   188,   -89,   -89,   -50,   -89,   -61,   -89,
      27,   -52,   -33,   -31,   -88,   -14,    99,   -89,   -89,   -89,
     -89,    -1,   -89
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_uint8 yydefgoto[] =
{
       0,     2,     3,    16,    11,    17,    59,    60,    32,   155,
     170,    61,    39,    40,   105,   106,    52,     4,    18,     5,
       6,    53,    54
};

/* YYTABLE[YYPACT[STATE-NUM]] -- What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule whose
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
static const yytype_uint8 yytable[] =
{
       8,    64,    98,   123,    93,    66,     7,    70,     7,    14,
      96,    26,    19,     1,    21,    51,     7,    71,     9,    72,
      28,    23,    75,    30,    29,    27,    33,    41,    10,    74,
      13,    62,   134,    41,    77,    41,   141,     7,    42,    41,
     160,    15,    20,    43,    73,    76,   121,    25,   128,    63,
      31,   100,   153,   102,   103,    62,    24,   104,    55,   107,
      97,    44,    45,    46,    47,    48,    65,   135,    67,    68,
      69,   135,    78,    49,    50,   135,    81,    79,    94,     7,
     112,   112,   112,   112,   112,   112,   112,   112,   112,   122,
      80,   156,   125,    57,    58,   137,    91,    62,   145,    92,
     147,    82,    83,    95,    84,    85,    56,   172,    86,    87,
      88,    89,    99,    90,   101,   108,   146,   173,   109,     7,
     126,   151,   110,   124,   127,   129,   164,    56,    41,     7,
      41,    34,   130,    57,    58,   159,   136,   131,   132,   175,
     133,   138,    62,    57,    58,   139,    35,   140,    36,    37,
     142,    38,   143,   144,   148,   163,    41,     7,   149,    34,
     167,   152,   154,   150,   161,   182,   157,   183,    62,   158,
     162,   176,   177,   168,    35,   165,    36,    37,   169,    38,
     111,   113,   114,   115,   116,   117,   118,   119,   120,   171,
     166,   174,   178,   179,   181,   184,   186,   185,   187,   188,
     189,    12,     0,     0,   180,    22
};

static const yytype_int16 yycheck[] =
{
       1,    34,    63,    91,    56,    36,     3,    40,     3,    10,
      60,     5,    13,    26,    15,    29,     3,     7,     0,     9,
       5,    10,    17,    24,     9,    19,    27,    28,    16,    43,
       9,    32,    10,    34,    48,    36,    10,     3,     4,    40,
      10,    16,     5,     9,    34,    46,    43,    11,    98,     5,
      12,    65,   140,    67,    68,    56,    45,    71,    13,    73,
      61,    27,    28,    29,    30,    31,     9,    45,     9,     9,
       6,    45,     4,    39,    40,    45,     7,     4,     7,     3,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    90,
      10,   143,    93,    17,    18,   109,     9,    98,   129,    14,
     131,    32,    33,     6,    35,    36,    11,   168,    39,    40,
      41,    42,     6,    44,    23,    10,   130,   169,     7,     3,
       8,   135,     9,     9,    46,    10,   157,    11,   129,     3,
     131,     5,     9,    17,    18,   149,    46,    10,    10,   172,
       8,    10,   143,    17,    18,     8,    20,     9,    22,    23,
      15,    25,     9,     6,    46,   156,   157,     3,    34,     5,
     161,     8,     7,    46,     8,   179,    21,   181,   169,    10,
      10,   172,   173,     5,    20,    46,    22,    23,    45,    25,
      81,    82,    83,    84,    85,    86,    87,    88,    89,    10,
      46,     5,    25,    24,     9,    46,     6,    10,    46,     6,
       6,     4,    -1,    -1,   177,    17
};

/* YYSTOS[STATE-NUM] -- The symbol kind of the accessing symbol of
   state STATE-NUM.  */
static const yytype_int8 yystos[] =
{
       0,    26,    48,    49,    64,    66,    67,     3,    68,     0,
      16,    51,    49,     9,    68,    16,    50,    52,    65,    68,
       5,    68,    50,    10,    45,    11,     5,    19,     5,     9,
      68,    12,    55,    68,     5,    20,    22,    23,    25,    59,
      60,    68,     4,     9,    27,    28,    29,    30,    31,    39,
      40,    62,    63,    68,    69,    13,    11,    17,    18,    53,
      54,    58,    68,     5,    59,     9,    60,     9,     9,     6,
      59,     7,     9,    34,    62,    17,    68,    62,     4,     4,
      10,     7,    32,    33,    35,    36,    39,    40,    41,    42,
      44,     9,    14,    58,     7,     6,    53,    68,    55,     6,
      62,    23,    62,    62,    62,    61,    62,    62,    10,     7,
       9,    63,    68,    63,    63,    63,    63,    63,    63,    63,
      63,    43,    68,    61,     9,    68,     8,    46,    53,    10,
       9,    10,    10,     8,    10,    45,    46,    62,    10,     8,
       9,    10,    15,     9,     6,    60,    62,    60,    46,    34,
      46,    62,     8,    61,     7,    56,    58,    21,    10,    62,
      10,     8,    10,    68,    60,    46,    46,    68,     5,    45,
      57,    10,    55,    58,     5,    59,    68,    68,    25,    24,
      57,     9,    62,    62,    46,    10,     6,    46,     6,     6
};

/* YYR1[RULE-NUM] -- Symbol kind of the left-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr1[] =
{
       0,    47,    48,    49,    49,    50,    50,    51,    52,    52,
      53,    53,    54,    55,    55,    56,    56,    57,    57,    58,
      58,    58,    58,    59,    59,    60,    60,    60,    60,    60,
      60,    60,    60,    60,    61,    61,    61,    62,    62,    62,
      62,    62,    62,    62,    62,    62,    62,    62,    62,    62,
      63,    63,    63,    63,    63,    63,    63,    63,    63,    64,
      64,    65,    65,    65,    66,    67,    68,    69,    69,    69
};

/* YYR2[RULE-NUM] -- Number of symbols on the right-hand side of rule RULE-NUM.  */
static const yytype_int8 yyr2[] =
{
       0,     2,     3,     0,     2,     0,     2,    21,     6,     8,
       0,     2,    13,     0,     4,     0,     3,     0,     4,     3,
       1,     1,     1,     0,     2,     3,     5,     4,     7,     5,
       7,     7,     5,     5,     0,     1,     3,     3,     3,     3,
       3,     3,     3,     3,     3,     4,     1,     3,     6,     4,
       1,     1,     1,     1,     1,     5,     4,     2,     3,     1,
       1,     0,     1,     3,     8,     8,     1,     1,     2,     2
};


enum { YYENOMEM = -2 };

#define yyerrok         (yyerrstatus = 0)
#define yyclearin       (yychar = YYEMPTY)

#define YYACCEPT        goto yyacceptlab
#define YYABORT         goto yyabortlab
#define YYERROR         goto yyerrorlab
#define YYNOMEM         goto yyexhaustedlab


#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)                                    \
  do                                                              \
    if (yychar == YYEMPTY)                                        \
      {                                                           \
        yychar = (Token);                                         \
        yylval = (Value);                                         \
        YYPOPSTACK (yylen);                                       \
        yystate = *yyssp;                                         \
        goto yybackup;                                            \
      }                                                           \
    else                                                          \
      {                                                           \
        yyerror (YY_("syntax error: cannot back up")); \
        YYERROR;                                                  \
      }                                                           \
  while (0)

/* Backward compatibility with an undocumented macro.
   Use YYerror or YYUNDEF. */
#define YYERRCODE YYUNDEF


/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)                        \
do {                                            \
  if (yydebug)                                  \
    YYFPRINTF Args;                             \
} while (0)




# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)                    \
do {                                                                      \
  if (yydebug)                                                            \
    {                                                                     \
      YYFPRINTF (stderr, "%s ", Title);                                   \
      yy_symbol_print (stderr,                                            \
                  Kind, Value); \
      YYFPRINTF (stderr, "\n");                                           \
    }                                                                     \
} while (0)


/*-----------------------------------.
| Print this symbol's value on YYO.  |
`-----------------------------------*/

static void
yy_symbol_value_print (FILE *yyo,
                       yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  FILE *yyoutput = yyo;
  YY_USE (yyoutput);
  if (!yyvaluep)
    return;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/*---------------------------.
| Print this symbol on YYO.  |
`---------------------------*/

static void
yy_symbol_print (FILE *yyo,
                 yysymbol_kind_t yykind, YYSTYPE const * const yyvaluep)
{
  YYFPRINTF (yyo, "%s %s (",
             yykind < YYNTOKENS ? "token" : "nterm", yysymbol_name (yykind));

  yy_symbol_value_print (yyo, yykind, yyvaluep);
  YYFPRINTF (yyo, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

static void
yy_stack_print (yy_state_t *yybottom, yy_state_t *yytop)
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)                            \
do {                                                            \
  if (yydebug)                                                  \
    yy_stack_print ((Bottom), (Top));                           \
} while (0)


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

static void
yy_reduce_print (yy_state_t *yyssp, YYSTYPE *yyvsp,
                 int yyrule)
{
  int yylno = yyrline[yyrule];
  int yynrhs = yyr2[yyrule];
  int yyi;
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %d):\n",
             yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr,
                       YY_ACCESSING_SYMBOL (+yyssp[yyi + 1 - yynrhs]),
                       &yyvsp[(yyi + 1) - (yynrhs)]);
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)          \
do {                                    \
  if (yydebug)                          \
    yy_reduce_print (yyssp, yyvsp, Rule); \
} while (0)

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args) ((void) 0)
# define YY_SYMBOL_PRINT(Title, Kind, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif






/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

static void
yydestruct (const char *yymsg,
            yysymbol_kind_t yykind, YYSTYPE *yyvaluep)
{
  YY_USE (yyvaluep);
  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yykind, yyvaluep, yylocationp);

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  YY_USE (yykind);
  YY_IGNORE_MAYBE_UNINITIALIZED_END
}


/* Lookahead token kind.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;
/* Number of syntax errors so far.  */
int yynerrs;




/*----------.
| yyparse.  |
`----------*/

int
yyparse (void)
{
    yy_state_fast_t yystate = 0;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus = 0;

    /* Refer to the stacks through separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* Their size.  */
    YYPTRDIFF_T yystacksize = YYINITDEPTH;

    /* The state stack: array, bottom, top.  */
    yy_state_t yyssa[YYINITDEPTH];
    yy_state_t *yyss = yyssa;
    yy_state_t *yyssp = yyss;

    /* The semantic value stack: array, bottom, top.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs = yyvsa;
    YYSTYPE *yyvsp = yyvs;

  int yyn;
  /* The return value of yyparse.  */
  int yyresult;
  /* Lookahead symbol kind.  */
  yysymbol_kind_t yytoken = YYSYMBOL_YYEMPTY;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;



#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yychar = YYEMPTY; /* Cause a token to be read.  */

  goto yysetstate;


/*------------------------------------------------------------.
| yynewstate -- push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;


/*--------------------------------------------------------------------.
| yysetstate -- set current state (the top of the stack) to yystate.  |
`--------------------------------------------------------------------*/
yysetstate:
  YYDPRINTF ((stderr, "Entering state %d\n", yystate));
  YY_ASSERT (0 <= yystate && yystate < YYNSTATES);
  YY_IGNORE_USELESS_CAST_BEGIN
  *yyssp = YY_CAST (yy_state_t, yystate);
  YY_IGNORE_USELESS_CAST_END
  YY_STACK_PRINT (yyss, yyssp);

  if (yyss + yystacksize - 1 <= yyssp)
#if !defined yyoverflow && !defined YYSTACK_RELOCATE
    YYNOMEM;
#else
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYPTRDIFF_T yysize = yyssp - yyss + 1;

# if defined yyoverflow
      {
        /* Give user a chance to reallocate the stack.  Use copies of
           these so that the &'s don't force the real ones into
           memory.  */
        yy_state_t *yyss1 = yyss;
        YYSTYPE *yyvs1 = yyvs;

        /* Each stack pointer address is followed by the size of the
           data in use in that stack, in bytes.  This used to be a
           conditional around just the two extra args, but that might
           be undefined if yyoverflow is a macro.  */
        yyoverflow (YY_("memory exhausted"),
                    &yyss1, yysize * YYSIZEOF (*yyssp),
                    &yyvs1, yysize * YYSIZEOF (*yyvsp),
                    &yystacksize);
        yyss = yyss1;
        yyvs = yyvs1;
      }
# else /* defined YYSTACK_RELOCATE */
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
        YYNOMEM;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
        yystacksize = YYMAXDEPTH;

      {
        yy_state_t *yyss1 = yyss;
        union yyalloc *yyptr =
          YY_CAST (union yyalloc *,
                   YYSTACK_ALLOC (YY_CAST (YYSIZE_T, YYSTACK_BYTES (yystacksize))));
        if (! yyptr)
          YYNOMEM;
        YYSTACK_RELOCATE (yyss_alloc, yyss);
        YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
        if (yyss1 != yyssa)
          YYSTACK_FREE (yyss1);
      }
# endif

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YY_IGNORE_USELESS_CAST_BEGIN
      YYDPRINTF ((stderr, "Stack size increased to %ld\n",
                  YY_CAST (long, yystacksize)));
      YY_IGNORE_USELESS_CAST_END

      if (yyss + yystacksize - 1 <= yyssp)
        YYABORT;
    }
#endif /* !defined yyoverflow && !defined YYSTACK_RELOCATE */


  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;


/*-----------.
| yybackup.  |
`-----------*/
yybackup:
  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either empty, or end-of-input, or a valid lookahead.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token\n"));
      yychar = yylex ();
    }

  if (yychar <= YYEOF)
    {
      yychar = YYEOF;
      yytoken = YYSYMBOL_YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else if (yychar == YYerror)
    {
      /* The scanner already issued an error message, process directly
         to error recovery.  But do not keep the error token as
         lookahead, it is too special and may lead us to an endless
         loop in error recovery. */
      yychar = YYUNDEF;
      yytoken = YYSYMBOL_YYerror;
      goto yyerrlab1;
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);
  yystate = yyn;
  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END

  /* Discard the shifted token.  */
  yychar = YYEMPTY;
  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     '$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
  case 2: /* Goal: MacroDefinitionRec MainClass TypeDeclarationRec  */
#line 210 "P1.y"
                                                                      {
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(macro) (yyvsp[-2].string_val) = strdup("");
    if(spaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    char * concat1 = concat((yyvsp[-2].string_val), (yyvsp[-1].string_val));
    char * concat2 = concat(concat1, (yyvsp[0].string_val));
    (yyval.string_val) = concat2;
    printf("%s\n", (yyval.string_val));
}
#line 1440 "P1.tab.c"
    break;

  case 3: /* MacroDefinitionRec: %empty  */
#line 221 "P1.y"
                                  {(yyval.string_val) = strdup("");}
#line 1446 "P1.tab.c"
    break;

  case 4: /* MacroDefinitionRec: MacroDefinition MacroDefinitionRec  */
#line 223 "P1.y"
                    {
    if(spaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    (yyval.string_val) = concat((yyvsp[-1].string_val), (yyvsp[0].string_val));}
#line 1455 "P1.tab.c"
    break;

  case 5: /* TypeDeclarationRec: %empty  */
#line 229 "P1.y"
                                  {(yyval.string_val) = strdup("");}
#line 1461 "P1.tab.c"
    break;

  case 6: /* TypeDeclarationRec: TypeDeclaration TypeDeclarationRec  */
#line 230 "P1.y"
                                                         {
    if(spaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    (yyval.string_val) = concat((yyvsp[-1].string_val), (yyvsp[0].string_val));
}
#line 1471 "P1.tab.c"
    break;

  case 7: /* MainClass: CLASS Identifier LEFT_CURVY_PAREN PUBLIC STATIC VOID MAIN LEFT_NORMAL_PAREN STRING LEFT_SQUARE_PAREN RIGHT_SQUARE_PAREN Identifier RIGHT_NORMAL_PAREN LEFT_CURVY_PAREN PRINTLN LEFT_NORMAL_PAREN Expression RIGHT_NORMAL_PAREN SEMICOLON RIGHT_CURVY_PAREN RIGHT_CURVY_PAREN  */
#line 237 "P1.y"
                                                                                                                                                                                                                                                                                                   {
    if(endspaces) (yyvsp[-20].string_val) = concat((yyvsp[-20].string_val), " ");
    if(spaces) (yyvsp[-19].string_val) = concat((yyvsp[-19].string_val), " ");
    if(endspaces) (yyvsp[-18].string_val) = concat((yyvsp[-18].string_val), " ");
    if(endspaces) (yyvsp[-17].string_val) = concat((yyvsp[-17].string_val), " ");
    if(endspaces) (yyvsp[-16].string_val) = concat((yyvsp[-16].string_val), " ");
    if(endspaces) (yyvsp[-15].string_val) = concat((yyvsp[-15].string_val), " ");
    if(endspaces) (yyvsp[-14].string_val) = concat((yyvsp[-14].string_val), " ");
    if(endspaces) (yyvsp[-13].string_val) = concat((yyvsp[-13].string_val), " ");
    if(endspaces) (yyvsp[-12].string_val) = concat((yyvsp[-12].string_val), " ");
    if(endspaces) (yyvsp[-11].string_val) = concat((yyvsp[-11].string_val), " ");
    if(endspaces) (yyvsp[-10].string_val) = concat((yyvsp[-10].string_val), " ");
    if(spaces) (yyvsp[-9].string_val) = concat((yyvsp[-9].string_val), " ");
    if(endspaces) (yyvsp[-8].string_val) = concat((yyvsp[-8].string_val), " ");
    if(endspaces) (yyvsp[-7].string_val) = concat((yyvsp[-7].string_val), " ");
    if(endspaces) (yyvsp[-6].string_val) = concat((yyvsp[-6].string_val), " ");
    if(endspaces) (yyvsp[-5].string_val) = concat((yyvsp[-5].string_val), " ");
    if(spaces) (yyvsp[-4].string_val) = concat((yyvsp[-4].string_val), " ");
    if(endspaces) (yyvsp[-3].string_val) = concat((yyvsp[-3].string_val), " ");
    if(endspaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-20].string_val), (yyvsp[-19].string_val));
    char * concat2 = concat(concat1, (yyvsp[-18].string_val));
    char * concat3 = concat(concat2, (yyvsp[-17].string_val));
    char * concat4 = concat(concat3, (yyvsp[-16].string_val));
    char * concat5 = concat(concat4, (yyvsp[-15].string_val));
    char * concat6 = concat(concat5, (yyvsp[-14].string_val));
    char * concat7 = concat(concat6, (yyvsp[-13].string_val));
    char * concat8 = concat(concat7, (yyvsp[-12].string_val));
    char * concat9 = concat(concat8, (yyvsp[-11].string_val));
    char * concat10 = concat(concat9, (yyvsp[-10].string_val));
    char * concat11 = concat(concat10, (yyvsp[-9].string_val));
    char * concat12 = concat(concat11, (yyvsp[-8].string_val));
    char * concat13 = concat(concat12, (yyvsp[-7].string_val));
    char * concat14 = concat(concat13, (yyvsp[-6].string_val));
    char * concat15 = concat(concat14, (yyvsp[-5].string_val));
    char * concat16 = concat(concat15, (yyvsp[-4].string_val));
    char * concat17 = concat(concat16, (yyvsp[-3].string_val));
    char * concat18 = concat(concat17, (yyvsp[-2].string_val));
    char * concat19 = concat(concat18, (yyvsp[-1].string_val));
    char * concat20 = concat(concat19, (yyvsp[0].string_val));

    (yyval.string_val) = concat20;
}
#line 1521 "P1.tab.c"
    break;

  case 8: /* TypeDeclaration: CLASS Identifier LEFT_CURVY_PAREN TypeIdentifierRec MethodDeclarationRec RIGHT_CURVY_PAREN  */
#line 284 "P1.y"
                                                                                                                {
    if(endspaces) (yyvsp[-5].string_val) = concat((yyvsp[-5].string_val), " ");
    if(spaces) (yyvsp[-4].string_val) = concat((yyvsp[-4].string_val), " ");
    if(endspaces) (yyvsp[-3].string_val) = concat((yyvsp[-3].string_val), " ");
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(spaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-5].string_val), (yyvsp[-4].string_val));
    char * concat2 = concat(concat1, (yyvsp[-3].string_val));
    char * concat3 = concat(concat2, (yyvsp[-2].string_val));
    char * concat4 = concat(concat3, (yyvsp[-1].string_val));
    char * concat5 = concat(concat4, (yyvsp[0].string_val));

    (yyval.string_val) = concat5;
}
#line 1541 "P1.tab.c"
    break;

  case 9: /* TypeDeclaration: CLASS Identifier EXTENDS Identifier LEFT_CURVY_PAREN TypeIdentifierRec MethodDeclarationRec RIGHT_CURVY_PAREN  */
#line 299 "P1.y"
                                                                                                                                   {
    if(endspaces) (yyvsp[-7].string_val) = concat((yyvsp[-7].string_val), " ");
    if(spaces) (yyvsp[-6].string_val) = concat((yyvsp[-6].string_val), " ");
    if(endspaces) (yyvsp[-5].string_val) = concat((yyvsp[-5].string_val), " ");
    if(spaces) (yyvsp[-4].string_val) = concat((yyvsp[-4].string_val), " ");
    if(endspaces) (yyvsp[-3].string_val) = concat((yyvsp[-3].string_val), " ");
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(spaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-7].string_val), (yyvsp[-6].string_val));
    char * concat2 = concat(concat1, (yyvsp[-5].string_val));
    char * concat3 = concat(concat2, (yyvsp[-4].string_val));
    char * concat4 = concat(concat3, (yyvsp[-3].string_val));
    char * concat5 = concat(concat4, (yyvsp[-2].string_val));
    char * concat6 = concat(concat5, (yyvsp[-1].string_val));
    char * concat7 = concat(concat6, (yyvsp[0].string_val));

    (yyval.string_val) = concat7;
}
#line 1565 "P1.tab.c"
    break;

  case 10: /* MethodDeclarationRec: %empty  */
#line 321 "P1.y"
                       {(yyval.string_val) = strdup("");}
#line 1571 "P1.tab.c"
    break;

  case 11: /* MethodDeclarationRec: MethodDeclaration MethodDeclarationRec  */
#line 322 "P1.y"
                                                             {
    if(spaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    (yyval.string_val) = concat((yyvsp[-1].string_val), (yyvsp[0].string_val));
}
#line 1581 "P1.tab.c"
    break;

  case 12: /* MethodDeclaration: PUBLIC Type Identifier LEFT_NORMAL_PAREN TypeIdenTypePlus RIGHT_NORMAL_PAREN LEFT_CURVY_PAREN TypeIdentifierRec StatementRec RETURN Expression SEMICOLON RIGHT_CURVY_PAREN  */
#line 329 "P1.y"
                                                                                                                                                                                                 {
    if(endspaces) (yyvsp[-12].string_val) = concat((yyvsp[-12].string_val), " ");
    if(spaces) (yyvsp[-11].string_val) = concat((yyvsp[-11].string_val), " ");
    if(spaces) (yyvsp[-10].string_val) = concat((yyvsp[-10].string_val), " ");
    if(endspaces) (yyvsp[-9].string_val) = concat((yyvsp[-9].string_val), " ");
    if(spaces) (yyvsp[-8].string_val) = concat((yyvsp[-8].string_val), " ");
    if(endspaces) (yyvsp[-7].string_val) = concat((yyvsp[-7].string_val), " ");
    if(endspaces) (yyvsp[-6].string_val) = concat((yyvsp[-6].string_val), " ");
    if(spaces) (yyvsp[-5].string_val) = concat((yyvsp[-5].string_val), " ");
    if(spaces) (yyvsp[-4].string_val) = concat((yyvsp[-4].string_val), " ");
    if(endspaces) (yyvsp[-3].string_val) = concat((yyvsp[-3].string_val), " ");
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-12].string_val), (yyvsp[-11].string_val));
    char * concat2 = concat(concat1, (yyvsp[-10].string_val));
    char * concat3 = concat(concat2, (yyvsp[-9].string_val));
    char * concat4 = concat(concat3, (yyvsp[-8].string_val));
    char * concat5 = concat(concat4, (yyvsp[-7].string_val));
    char * concat6 = concat(concat5, (yyvsp[-6].string_val));
    char * concat7 = concat(concat6, (yyvsp[-5].string_val));
    char * concat8 = concat(concat7, (yyvsp[-4].string_val));
    char * concat9 = concat(concat8, (yyvsp[-3].string_val));
    char * concat10 = concat(concat9, (yyvsp[-2].string_val));
    char * concat11 = concat(concat10, (yyvsp[-1].string_val));
    char * concat12 = concat(concat11, (yyvsp[0].string_val));

    (yyval.string_val) = concat12;
}
#line 1615 "P1.tab.c"
    break;

  case 13: /* TypeIdentifierRec: %empty  */
#line 360 "P1.y"
                       {(yyval.string_val) = strdup("");}
#line 1621 "P1.tab.c"
    break;

  case 14: /* TypeIdentifierRec: TypeIdentifierRec Type Identifier SEMICOLON  */
#line 361 "P1.y"
                                                                  {
    if(spaces) (yyvsp[-3].string_val) = concat((yyvsp[-3].string_val), " ");
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(spaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-3].string_val), (yyvsp[-2].string_val));
    char * concat2 = concat(concat1, (yyvsp[-1].string_val));
    char * concat3 = concat(concat2, (yyvsp[0].string_val));

    (yyval.string_val) = concat3;
}
#line 1637 "P1.tab.c"
    break;

  case 15: /* TypeIdenTypePlus: %empty  */
#line 374 "P1.y"
                       {(yyval.string_val) = strdup("");}
#line 1643 "P1.tab.c"
    break;

  case 16: /* TypeIdenTypePlus: Type Identifier TypeTmp  */
#line 375 "P1.y"
                                              {
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(spaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-2].string_val), (yyvsp[-1].string_val));
    char * concat2 = concat(concat1, (yyvsp[0].string_val));

    (yyval.string_val) = concat2;
    }
#line 1657 "P1.tab.c"
    break;

  case 17: /* TypeTmp: %empty  */
#line 386 "P1.y"
                      {(yyval.string_val) = strdup("");}
#line 1663 "P1.tab.c"
    break;

  case 18: /* TypeTmp: COMMA Type Identifier TypeTmp  */
#line 387 "P1.y"
                                                   {
    if(endspaces) (yyvsp[-3].string_val) = concat((yyvsp[-3].string_val), " ");
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(spaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-3].string_val), (yyvsp[-2].string_val));
    char * concat2 = concat(concat1, (yyvsp[-1].string_val));
    char * concat3 = concat(concat2, (yyvsp[0].string_val));

    (yyval.string_val) = concat3;
}
#line 1679 "P1.tab.c"
    break;

  case 19: /* Type: INT LEFT_SQUARE_PAREN RIGHT_SQUARE_PAREN  */
#line 401 "P1.y"
                                                               {
    if(endspaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-2].string_val), (yyvsp[-1].string_val));
    char * concat2 = concat(concat1, (yyvsp[0].string_val));

    (yyval.string_val) = concat2;
}
#line 1693 "P1.tab.c"
    break;

  case 20: /* Type: BOOLEAN  */
#line 410 "P1.y"
                              {
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    (yyval.string_val) = (yyvsp[0].string_val);
}
#line 1702 "P1.tab.c"
    break;

  case 21: /* Type: INT  */
#line 414 "P1.y"
                          {
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    (yyval.string_val) = (yyvsp[0].string_val);}
#line 1710 "P1.tab.c"
    break;

  case 22: /* Type: Identifier  */
#line 417 "P1.y"
                                 {
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    (yyval.string_val) = (yyvsp[0].string_val);
}
#line 1719 "P1.tab.c"
    break;

  case 23: /* StatementRec: %empty  */
#line 423 "P1.y"
                       {(yyval.string_val) = strdup("");}
#line 1725 "P1.tab.c"
    break;

  case 24: /* StatementRec: Statement StatementRec  */
#line 424 "P1.y"
                                             {                    
    if(spaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    (yyval.string_val) = concat((yyvsp[-1].string_val), (yyvsp[0].string_val));
}
#line 1735 "P1.tab.c"
    break;

  case 25: /* Statement: LEFT_CURVY_PAREN StatementRec RIGHT_CURVY_PAREN  */
#line 431 "P1.y"
                                                                      {
    if(endspaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(spaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-2].string_val), (yyvsp[-1].string_val));
    char * concat2 = concat(concat1, (yyvsp[0].string_val));

    (yyval.string_val) = concat2;
}
#line 1749 "P1.tab.c"
    break;

  case 26: /* Statement: PRINTLN LEFT_NORMAL_PAREN Expression RIGHT_NORMAL_PAREN SEMICOLON  */
#line 440 "P1.y"
                                                                                       {
    if(endspaces) (yyvsp[-4].string_val) = concat((yyvsp[-4].string_val), " ");
    if(endspaces) (yyvsp[-3].string_val) = concat((yyvsp[-3].string_val), " ");
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-4].string_val), (yyvsp[-3].string_val));
    char * concat2 = concat(concat1, (yyvsp[-2].string_val));
    char * concat3 = concat(concat2, (yyvsp[-1].string_val));
    char * concat4 = concat(concat3, (yyvsp[0].string_val));

    (yyval.string_val) = concat4;
}
#line 1767 "P1.tab.c"
    break;

  case 27: /* Statement: Identifier EQUAL Expression SEMICOLON  */
#line 453 "P1.y"
                                                            {
    if(spaces) (yyvsp[-3].string_val) = concat((yyvsp[-3].string_val), " ");
    if(endspaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(spaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-3].string_val), (yyvsp[-2].string_val));
    char * concat2 = concat(concat1, (yyvsp[-1].string_val));
    char * concat3 = concat(concat2, (yyvsp[0].string_val));

    (yyval.string_val) = concat3;
}
#line 1783 "P1.tab.c"
    break;

  case 28: /* Statement: Identifier LEFT_SQUARE_PAREN Expression RIGHT_SQUARE_PAREN EQUAL Expression SEMICOLON  */
#line 464 "P1.y"
                                                                                                            {
    if(spaces) (yyvsp[-6].string_val) = concat((yyvsp[-6].string_val), " ");
    if(endspaces) (yyvsp[-5].string_val) = concat((yyvsp[-5].string_val), " ");
    if(spaces) (yyvsp[-4].string_val) = concat((yyvsp[-4].string_val), " ");
    if(endspaces) (yyvsp[-3].string_val) = concat((yyvsp[-3].string_val), " ");
    if(endspaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(spaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-6].string_val), (yyvsp[-5].string_val));
    char * concat2 = concat(concat1, (yyvsp[-4].string_val));
    char * concat3 = concat(concat2, (yyvsp[-3].string_val));
    char * concat4 = concat(concat3, (yyvsp[-2].string_val));
    char * concat5 = concat(concat4, (yyvsp[-1].string_val));
    char * concat6 = concat(concat5, (yyvsp[0].string_val));

    (yyval.string_val) = concat6;
}
#line 1805 "P1.tab.c"
    break;

  case 29: /* Statement: IF LEFT_NORMAL_PAREN Expression RIGHT_NORMAL_PAREN Statement  */
#line 481 "P1.y"
                                                                                  {
    if(endspaces) (yyvsp[-4].string_val) = concat((yyvsp[-4].string_val), " ");
    if(endspaces) (yyvsp[-3].string_val) = concat((yyvsp[-3].string_val), " ");
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-4].string_val), (yyvsp[-3].string_val));
    char * concat2 = concat(concat1, (yyvsp[-2].string_val));
    char * concat3 = concat(concat2, (yyvsp[-1].string_val));
    char * concat4 = concat(concat3, (yyvsp[0].string_val));

    (yyval.string_val) = concat4;
}
#line 1823 "P1.tab.c"
    break;

  case 30: /* Statement: IF LEFT_NORMAL_PAREN Expression RIGHT_NORMAL_PAREN Statement ELSE Statement  */
#line 494 "P1.y"
                                                                                                 {
    if(endspaces) (yyvsp[-6].string_val) = concat((yyvsp[-6].string_val), " ");
    if(endspaces) (yyvsp[-5].string_val) = concat((yyvsp[-5].string_val), " ");
    if(spaces) (yyvsp[-4].string_val) = concat((yyvsp[-4].string_val), " ");
    if(endspaces) (yyvsp[-3].string_val) = concat((yyvsp[-3].string_val), " ");
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-6].string_val), (yyvsp[-5].string_val));
    char * concat2 = concat(concat1, (yyvsp[-4].string_val));
    char * concat3 = concat(concat2, (yyvsp[-3].string_val));
    char * concat4 = concat(concat3, (yyvsp[-2].string_val));
    char * concat5 = concat(concat4, (yyvsp[-1].string_val));
    char * concat6 = concat(concat5, (yyvsp[0].string_val));

    (yyval.string_val) = concat6;
}
#line 1845 "P1.tab.c"
    break;

  case 31: /* Statement: DO Statement WHILE LEFT_NORMAL_PAREN Expression RIGHT_NORMAL_PAREN SEMICOLON  */
#line 511 "P1.y"
                                                                                                  {
    if(endspaces) (yyvsp[-6].string_val) = concat((yyvsp[-6].string_val), " ");
    if(spaces) (yyvsp[-5].string_val) = concat((yyvsp[-5].string_val), " ");
    if(endspaces) (yyvsp[-4].string_val) = concat((yyvsp[-4].string_val), " ");
    if(endspaces) (yyvsp[-3].string_val) = concat((yyvsp[-3].string_val), " ");
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-6].string_val), (yyvsp[-5].string_val));
    char * concat2 = concat(concat1, (yyvsp[-4].string_val));
    char * concat3 = concat(concat2, (yyvsp[-3].string_val));
    char * concat4 = concat(concat3, (yyvsp[-2].string_val));
    char * concat5 = concat(concat4, (yyvsp[-1].string_val));
    char * concat6 = concat(concat5, (yyvsp[0].string_val));

    (yyval.string_val) = concat6;
}
#line 1867 "P1.tab.c"
    break;

  case 32: /* Statement: WHILE LEFT_NORMAL_PAREN Expression RIGHT_NORMAL_PAREN Statement  */
#line 528 "P1.y"
                                                                                     {
    if(endspaces) (yyvsp[-4].string_val) = concat((yyvsp[-4].string_val), " ");
    if(endspaces) (yyvsp[-3].string_val) = concat((yyvsp[-3].string_val), " ");
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-4].string_val), (yyvsp[-3].string_val));
    char * concat2 = concat(concat1, (yyvsp[-2].string_val));
    char * concat3 = concat(concat2, (yyvsp[-1].string_val));
    char * concat4 = concat(concat3, (yyvsp[0].string_val));

    (yyval.string_val) = concat4;
}
#line 1885 "P1.tab.c"
    break;

  case 33: /* Statement: Identifier LEFT_NORMAL_PAREN ExpressionPlus RIGHT_NORMAL_PAREN SEMICOLON  */
#line 541 "P1.y"
                                                                                               {
    if(spaces) (yyvsp[-4].string_val) = concat((yyvsp[-4].string_val), " ");
    if(endspaces) (yyvsp[-3].string_val) = concat((yyvsp[-3].string_val), " ");
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-4].string_val), (yyvsp[-3].string_val));
    char * concat2 = concat(concat1, (yyvsp[-2].string_val));
    char * concat3 = concat(concat2, (yyvsp[-1].string_val));
    char * concat4 = concat(concat3, (yyvsp[0].string_val));
    if(macro){
        (yyval.string_val) = process_string((yyvsp[-4].string_val), (yyvsp[-2].string_val), 1);
    }
    if(macro == 0) (yyval.string_val) = concat4;
}
#line 1905 "P1.tab.c"
    break;

  case 34: /* ExpressionPlus: %empty  */
#line 558 "P1.y"
                       {(yyval.string_val) = strdup("");}
#line 1911 "P1.tab.c"
    break;

  case 35: /* ExpressionPlus: Expression  */
#line 559 "P1.y"
                                 {
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    (yyval.string_val) = (yyvsp[0].string_val);}
#line 1919 "P1.tab.c"
    break;

  case 36: /* ExpressionPlus: ExpressionPlus COMMA Expression  */
#line 562 "P1.y"
                                                      {
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-2].string_val), (yyvsp[-1].string_val));
    char * concat2 = concat(concat1, (yyvsp[0].string_val));

    (yyval.string_val) = concat2;
}
#line 1933 "P1.tab.c"
    break;

  case 37: /* Expression: PrimaryExpression AND PrimaryExpression  */
#line 573 "P1.y"
                                                             {
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-2].string_val), (yyvsp[-1].string_val));
    char * concat2 = concat(concat1, (yyvsp[0].string_val));

    (yyval.string_val) = concat2;
}
#line 1947 "P1.tab.c"
    break;

  case 38: /* Expression: PrimaryExpression OR PrimaryExpression  */
#line 582 "P1.y"
                                                            {
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-2].string_val), (yyvsp[-1].string_val));
    char * concat2 = concat(concat1, (yyvsp[0].string_val));

    (yyval.string_val) = concat2;
}
#line 1961 "P1.tab.c"
    break;

  case 39: /* Expression: PrimaryExpression NOT_EQUAL PrimaryExpression  */
#line 591 "P1.y"
                                                                   {
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-2].string_val), (yyvsp[-1].string_val));
    char * concat2 = concat(concat1, (yyvsp[0].string_val));

    (yyval.string_val) = concat2;
}
#line 1975 "P1.tab.c"
    break;

  case 40: /* Expression: PrimaryExpression LESS_EQUAL PrimaryExpression  */
#line 600 "P1.y"
                                                                    {
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-2].string_val), (yyvsp[-1].string_val));
    char * concat2 = concat(concat1, (yyvsp[0].string_val));

    (yyval.string_val) = concat2;
}
#line 1989 "P1.tab.c"
    break;

  case 41: /* Expression: PrimaryExpression PLUS PrimaryExpression  */
#line 609 "P1.y"
                                                              {
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-2].string_val), (yyvsp[-1].string_val));
    char * concat2 = concat(concat1, (yyvsp[0].string_val));

    (yyval.string_val) = concat2;
}
#line 2003 "P1.tab.c"
    break;

  case 42: /* Expression: PrimaryExpression MINUS PrimaryExpression  */
#line 618 "P1.y"
                                                               {
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-2].string_val), (yyvsp[-1].string_val));
    char * concat2 = concat(concat1, (yyvsp[0].string_val));

    (yyval.string_val) = concat2;
}
#line 2017 "P1.tab.c"
    break;

  case 43: /* Expression: PrimaryExpression MULTIPLY PrimaryExpression  */
#line 627 "P1.y"
                                                                  {
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-2].string_val), (yyvsp[-1].string_val));
    char * concat2 = concat(concat1, (yyvsp[0].string_val));

    (yyval.string_val) = concat2;
}
#line 2031 "P1.tab.c"
    break;

  case 44: /* Expression: PrimaryExpression DIVIDE PrimaryExpression  */
#line 636 "P1.y"
                                                                {
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-2].string_val), (yyvsp[-1].string_val));
    char * concat2 = concat(concat1, (yyvsp[0].string_val));

    (yyval.string_val) = concat2;
}
#line 2045 "P1.tab.c"
    break;

  case 45: /* Expression: PrimaryExpression LEFT_SQUARE_PAREN PrimaryExpression RIGHT_SQUARE_PAREN  */
#line 645 "P1.y"
                                                                                              {
    if(spaces) (yyvsp[-3].string_val) = concat((yyvsp[-3].string_val), " ");
    if(endspaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(spaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-3].string_val), (yyvsp[-2].string_val));
    char * concat2 = concat(concat1, (yyvsp[-1].string_val));
    char * concat3 = concat(concat2, (yyvsp[0].string_val));

    (yyval.string_val) = concat3;
}
#line 2061 "P1.tab.c"
    break;

  case 46: /* Expression: PrimaryExpression  */
#line 656 "P1.y"
                                         {
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    (yyval.string_val) = (yyvsp[0].string_val);}
#line 2069 "P1.tab.c"
    break;

  case 47: /* Expression: PrimaryExpression DOT LENGTH  */
#line 659 "P1.y"
                                                  {
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-2].string_val), (yyvsp[-1].string_val));
    char * concat2 = concat(concat1, (yyvsp[0].string_val));

    (yyval.string_val) = concat2;
}
#line 2083 "P1.tab.c"
    break;

  case 48: /* Expression: PrimaryExpression DOT Identifier LEFT_NORMAL_PAREN ExpressionPlus RIGHT_NORMAL_PAREN  */
#line 668 "P1.y"
                                                                                                          {
    if(spaces) (yyvsp[-5].string_val) = concat((yyvsp[-5].string_val), " ");
    if(endspaces) (yyvsp[-4].string_val) = concat((yyvsp[-4].string_val), " ");
    if(spaces) (yyvsp[-3].string_val) = concat((yyvsp[-3].string_val), " ");
    if(endspaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(spaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-5].string_val), (yyvsp[-4].string_val));
    char * concat2 = concat(concat1, (yyvsp[-3].string_val));
    char * concat3 = concat(concat2, (yyvsp[-2].string_val));
    char * concat4 = concat(concat3, (yyvsp[-1].string_val));
    char * concat5 = concat(concat4, (yyvsp[0].string_val));

    (yyval.string_val) = concat5;
}
#line 2103 "P1.tab.c"
    break;

  case 49: /* Expression: Identifier LEFT_NORMAL_PAREN ExpressionPlus RIGHT_NORMAL_PAREN  */
#line 683 "P1.y"
                                                                                     {
    if(spaces) (yyvsp[-3].string_val) = concat((yyvsp[-3].string_val), " ");
    if(endspaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(spaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-3].string_val), (yyvsp[-2].string_val));
    char * concat2 = concat(concat1, (yyvsp[-1].string_val));
    char * concat3 = concat(concat2, (yyvsp[0].string_val));
    if(macro){
        (yyval.string_val) = process_string((yyvsp[-3].string_val), (yyvsp[-1].string_val), 0);
    }
    if(macro == 0) (yyval.string_val) = concat3;
}
#line 2121 "P1.tab.c"
    break;

  case 50: /* PrimaryExpression: Integer  */
#line 698 "P1.y"
                               {
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    (yyval.string_val) = (yyvsp[0].string_val);}
#line 2129 "P1.tab.c"
    break;

  case 51: /* PrimaryExpression: TRUE  */
#line 701 "P1.y"
                            {
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    (yyval.string_val) = (yyvsp[0].string_val);}
#line 2137 "P1.tab.c"
    break;

  case 52: /* PrimaryExpression: FALSE  */
#line 704 "P1.y"
                             {
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    (yyval.string_val) = (yyvsp[0].string_val);}
#line 2145 "P1.tab.c"
    break;

  case 53: /* PrimaryExpression: Identifier  */
#line 707 "P1.y"
                                  {
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    (yyval.string_val) = (yyvsp[0].string_val);}
#line 2153 "P1.tab.c"
    break;

  case 54: /* PrimaryExpression: THIS  */
#line 710 "P1.y"
                           {
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    (yyval.string_val) = (yyvsp[0].string_val);}
#line 2161 "P1.tab.c"
    break;

  case 55: /* PrimaryExpression: NEW INT LEFT_SQUARE_PAREN Expression RIGHT_SQUARE_PAREN  */
#line 713 "P1.y"
                                                                             {
    if(endspaces) (yyvsp[-4].string_val) = concat((yyvsp[-4].string_val), " ");
    if(endspaces) (yyvsp[-3].string_val) = concat((yyvsp[-3].string_val), " ");
    if(endspaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(spaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-4].string_val), (yyvsp[-3].string_val));
    char * concat2 = concat(concat1, (yyvsp[-2].string_val));
    char * concat3 = concat(concat2, (yyvsp[-1].string_val));
    char * concat4 = concat(concat3, (yyvsp[0].string_val));

    (yyval.string_val) = concat4;
}
#line 2179 "P1.tab.c"
    break;

  case 56: /* PrimaryExpression: NEW Identifier LEFT_NORMAL_PAREN RIGHT_NORMAL_PAREN  */
#line 726 "P1.y"
                                                                         {
    if(endspaces)(yyvsp[-3].string_val) = concat((yyvsp[-3].string_val), " ");
    if(spaces)(yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(endspaces)(yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(endspaces)(yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-3].string_val), (yyvsp[-2].string_val));
    char * concat2 = concat(concat1, (yyvsp[-1].string_val));
    char * concat3 = concat(concat2, (yyvsp[0].string_val));

    (yyval.string_val) = concat3;
}
#line 2195 "P1.tab.c"
    break;

  case 57: /* PrimaryExpression: NOT Expression  */
#line 737 "P1.y"
                                      {
    if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-1].string_val), (yyvsp[0].string_val));
    (yyval.string_val) = concat1;}
#line 2205 "P1.tab.c"
    break;

  case 58: /* PrimaryExpression: LEFT_NORMAL_PAREN Expression RIGHT_NORMAL_PAREN  */
#line 742 "P1.y"
                                                                     {
    if(endspaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(spaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-2].string_val), (yyvsp[-1].string_val));
    char * concat2 = concat(concat1, (yyvsp[0].string_val));

    (yyval.string_val) = concat2;
}
#line 2219 "P1.tab.c"
    break;

  case 59: /* MacroDefinition: MacroDefExpression  */
#line 753 "P1.y"
                                         {/*$$ = $1;*/}
#line 2225 "P1.tab.c"
    break;

  case 60: /* MacroDefinition: MacroDefStatement  */
#line 754 "P1.y"
                                        {/*$$ = $1;*/}
#line 2231 "P1.tab.c"
    break;

  case 61: /* IdenCommaIdenPlus: %empty  */
#line 758 "P1.y"
                       {(yyval.string_val) = strdup("");}
#line 2237 "P1.tab.c"
    break;

  case 62: /* IdenCommaIdenPlus: Identifier  */
#line 759 "P1.y"
                                 {
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    (yyval.string_val) = (yyvsp[0].string_val);
}
#line 2246 "P1.tab.c"
    break;

  case 63: /* IdenCommaIdenPlus: IdenCommaIdenPlus COMMA Identifier  */
#line 763 "P1.y"
                                                         {
    if(spaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(spaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-2].string_val), (yyvsp[-1].string_val));
    char * concat2 = concat(concat1, (yyvsp[0].string_val));

    (yyval.string_val) = concat2;
}
#line 2260 "P1.tab.c"
    break;

  case 64: /* MacroDefStatement: DEFINE Identifier LEFT_NORMAL_PAREN IdenCommaIdenPlus RIGHT_NORMAL_PAREN LEFT_CURVY_PAREN StatementRec RIGHT_CURVY_PAREN  */
#line 774 "P1.y"
                                                                                                                                              {
    if(endspaces) (yyvsp[-7].string_val) = concat((yyvsp[-7].string_val), " ");
    if(spaces) (yyvsp[-6].string_val) = concat((yyvsp[-6].string_val), " ");
    if(endspaces) (yyvsp[-5].string_val) = concat((yyvsp[-5].string_val), " ");
    if(spaces) (yyvsp[-4].string_val) = concat((yyvsp[-4].string_val), " ");
    if(endspaces) (yyvsp[-3].string_val) = concat((yyvsp[-3].string_val), " ");
    if(endspaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(spaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-7].string_val), (yyvsp[-6].string_val));
    char * concat2 = concat(concat1, (yyvsp[-5].string_val));
    char * concat3 = concat(concat2, (yyvsp[-4].string_val));
    char * concat4 = concat(concat3, (yyvsp[-3].string_val));
    char * concat5 = concat(concat4, (yyvsp[-2].string_val));
    char * concat6 = concat(concat5, (yyvsp[-1].string_val));
    char * concat7 = concat(concat6, (yyvsp[0].string_val));
    char * express = concat((yyvsp[-2].string_val), (yyvsp[-1].string_val));
    express = concat(express, (yyvsp[0].string_val));
    if(macro) add_entry(remove_white_spaces((yyvsp[-6].string_val)), remove_white_spaces((yyvsp[-4].string_val)), remove_white_spaces(express), 1);
    if(!macro) (yyval.string_val) = concat7;
}
#line 2286 "P1.tab.c"
    break;

  case 65: /* MacroDefExpression: DEFINE Identifier LEFT_NORMAL_PAREN IdenCommaIdenPlus RIGHT_NORMAL_PAREN LEFT_NORMAL_PAREN Expression RIGHT_NORMAL_PAREN  */
#line 797 "P1.y"
                                                                                                                                              {
    if(endspaces) (yyvsp[-7].string_val) = concat((yyvsp[-7].string_val), " ");
    if(spaces) (yyvsp[-6].string_val) = concat((yyvsp[-6].string_val), " ");
    if(endspaces) (yyvsp[-5].string_val) = concat((yyvsp[-5].string_val), " ");
    if(spaces) (yyvsp[-4].string_val) = concat((yyvsp[-4].string_val), " ");
    if(endspaces) (yyvsp[-3].string_val) = concat((yyvsp[-3].string_val), " ");
    if(endspaces) (yyvsp[-2].string_val) = concat((yyvsp[-2].string_val), " ");
    if(spaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    char * concat1 = concat((yyvsp[-7].string_val), (yyvsp[-6].string_val));
    char * concat2 = concat(concat1, (yyvsp[-5].string_val));
    char * concat3 = concat(concat2, (yyvsp[-4].string_val));
    char * concat4 = concat(concat3, (yyvsp[-3].string_val));
    char * concat5 = concat(concat4, (yyvsp[-2].string_val));
    char * concat6 = concat(concat5, (yyvsp[-1].string_val));
    char * concat7 = concat(concat6, (yyvsp[0].string_val));
    char * express = concat((yyvsp[-2].string_val), (yyvsp[-1].string_val));
    express = concat(express, (yyvsp[0].string_val));
    if(macro) add_entry(remove_white_spaces((yyvsp[-6].string_val)), remove_white_spaces((yyvsp[-4].string_val)), remove_white_spaces(express), 0);
    if(!macro) (yyval.string_val) = concat7;
}
#line 2312 "P1.tab.c"
    break;

  case 66: /* Identifier: IDENTIFIER  */
#line 820 "P1.y"
                        {
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    (yyval.string_val) = (yyvsp[0].string_val);
}
#line 2321 "P1.tab.c"
    break;

  case 67: /* Integer: INTEGER_LITERAL  */
#line 825 "P1.y"
                          {
    if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
    (yyval.string_val) = (yyvsp[0].string_val);
}
#line 2330 "P1.tab.c"
    break;

  case 68: /* Integer: MINUS INTEGER_LITERAL  */
#line 829 "P1.y"
                           {
        if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
        if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
        (yyval.string_val) = concat((yyvsp[-1].string_val), (yyvsp[0].string_val));
    }
#line 2340 "P1.tab.c"
    break;

  case 69: /* Integer: PLUS INTEGER_LITERAL  */
#line 834 "P1.y"
                          {
        if(endspaces) (yyvsp[-1].string_val) = concat((yyvsp[-1].string_val), " ");
        if(endspaces) (yyvsp[0].string_val) = concat((yyvsp[0].string_val), " ");
        (yyval.string_val) = concat((yyvsp[-1].string_val), (yyvsp[0].string_val));
    }
#line 2350 "P1.tab.c"
    break;


#line 2354 "P1.tab.c"

      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", YY_CAST (yysymbol_kind_t, yyr1[yyn]), &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;

  *++yyvsp = yyval;

  /* Now 'shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */
  {
    const int yylhs = yyr1[yyn] - YYNTOKENS;
    const int yyi = yypgoto[yylhs] + *yyssp;
    yystate = (0 <= yyi && yyi <= YYLAST && yycheck[yyi] == *yyssp
               ? yytable[yyi]
               : yydefgoto[yylhs]);
  }

  goto yynewstate;


/*--------------------------------------.
| yyerrlab -- here on detecting error.  |
`--------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYSYMBOL_YYEMPTY : YYTRANSLATE (yychar);
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
      yyerror (YY_("syntax error"));
    }

  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
         error, discard it.  */

      if (yychar <= YYEOF)
        {
          /* Return failure if at end of input.  */
          if (yychar == YYEOF)
            YYABORT;
        }
      else
        {
          yydestruct ("Error: discarding",
                      yytoken, &yylval);
          yychar = YYEMPTY;
        }
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:
  /* Pacify compilers when the user code never invokes YYERROR and the
     label yyerrorlab therefore never appears in user code.  */
  if (0)
    YYERROR;
  ++yynerrs;

  /* Do not reclaim the symbols of the rule whose action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;      /* Each real token shifted decrements this.  */

  /* Pop stack until we find a state that shifts the error token.  */
  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
        {
          yyn += YYSYMBOL_YYerror;
          if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYSYMBOL_YYerror)
            {
              yyn = yytable[yyn];
              if (0 < yyn)
                break;
            }
        }

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
        YYABORT;


      yydestruct ("Error: popping",
                  YY_ACCESSING_SYMBOL (yystate), yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  YY_IGNORE_MAYBE_UNINITIALIZED_BEGIN
  *++yyvsp = yylval;
  YY_IGNORE_MAYBE_UNINITIALIZED_END


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", YY_ACCESSING_SYMBOL (yyn), yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturnlab;


/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturnlab;


/*-----------------------------------------------------------.
| yyexhaustedlab -- YYNOMEM (memory exhaustion) comes here.  |
`-----------------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  goto yyreturnlab;


/*----------------------------------------------------------.
| yyreturnlab -- parsing is finished, clean up and return.  |
`----------------------------------------------------------*/
yyreturnlab:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule whose action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
                  YY_ACCESSING_SYMBOL (+*yyssp), yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif

  return yyresult;
}

#line 840 "P1.y"


int main()
{
    yyparse();
}

void yyerror()
{
    printf("// Failed to parse macrojava code.");
    exit(1);
}
