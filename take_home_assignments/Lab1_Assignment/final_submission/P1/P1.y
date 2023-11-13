%{
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
%}

%union {
    char* string_val;
    int int_val;
}

%token <string_val> IDENTIFIER 
%token <string_val> INTEGER_LITERAL
%token <string_val> LEFT_CURVY_PAREN RIGHT_CURVY_PAREN 
%token <string_val> LEFT_SQUARE_PAREN RIGHT_SQUARE_PAREN 
%token <string_val> LEFT_NORMAL_PAREN RIGHT_NORMAL_PAREN 
%token <string_val> PUBLIC STATIC VOID MAIN STRING CLASS INT BOOLEAN
%token <string_val> EXTENDS IF ELSE DO WHILE RETURN PRINTLN DEFINE
%token <string_val> TRUE FALSE 
%token <string_val> NEW THIS
%token <string_val> NOT AND OR EQUAL NOT_EQUAL LESS_EQUAL LESS_THAN GREATER_THAN
%token <string_val> PLUS MINUS MULTIPLY DIVIDE 
%token <string_val> LENGTH 
%token <string_val> DOT COMMA SEMICOLON 

%start Goal
%type<string_val> Goal MacroDefinitionRec TypeDeclarationRec MainClass TypeDeclaration MethodDeclarationRec MethodDeclaration TypeIdentifierRec TypeIdenTypePlus Type StatementRec Statement ExpressionPlus Expression PrimaryExpression MacroDefinition IdenCommaIdenPlus MacroDefStatement MacroDefExpression Identifier Integer TypeTmp


%%
Goal                : MacroDefinitionRec MainClass TypeDeclarationRec {
    if(spaces) $1 = concat($1, " ");
    if(macro) $1 = strdup("");
    if(spaces) $2 = concat($2, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);
    $$ = concat2;
    printf("%s\n", $$);
}
                    ;

MacroDefinitionRec  : /* empty */ {$$ = strdup("");}
                    | MacroDefinition MacroDefinitionRec 
                    {
    if(spaces) $1 = concat($1, " ");
    if(spaces) $2 = concat($2, " ");
    $$ = concat($1, $2);}
                    ;

TypeDeclarationRec  : /* empty */ {$$ = strdup("");}
                    | TypeDeclaration TypeDeclarationRec {
    if(spaces) $1 = concat($1, " ");
    if(spaces) $2 = concat($2, " ");
    $$ = concat($1, $2);
}
                    ;

MainClass           : CLASS Identifier LEFT_CURVY_PAREN PUBLIC STATIC VOID MAIN LEFT_NORMAL_PAREN STRING LEFT_SQUARE_PAREN RIGHT_SQUARE_PAREN Identifier RIGHT_NORMAL_PAREN LEFT_CURVY_PAREN PRINTLN LEFT_NORMAL_PAREN Expression RIGHT_NORMAL_PAREN SEMICOLON RIGHT_CURVY_PAREN RIGHT_CURVY_PAREN {
    if(endspaces) $1 = concat($1, " ");
    if(spaces) $2 = concat($2, " ");
    if(endspaces) $3 = concat($3, " ");
    if(endspaces) $4 = concat($4, " ");
    if(endspaces) $5 = concat($5, " ");
    if(endspaces) $6 = concat($6, " ");
    if(endspaces) $7 = concat($7, " ");
    if(endspaces) $8 = concat($8, " ");
    if(endspaces) $9 = concat($9, " ");
    if(endspaces) $10 = concat($10, " ");
    if(endspaces) $11 = concat($11, " ");
    if(spaces) $12 = concat($12, " ");
    if(endspaces) $13 = concat($13, " ");
    if(endspaces) $14 = concat($14, " ");
    if(endspaces) $15 = concat($15, " ");
    if(endspaces) $16 = concat($16, " ");
    if(spaces) $17 = concat($17, " ");
    if(endspaces) $18 = concat($18, " ");
    if(endspaces) $19 = concat($19, " ");
    if(endspaces) $20 = concat($20, " ");
    if(endspaces) $21 = concat($21, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);
    char * concat3 = concat(concat2, $4);
    char * concat4 = concat(concat3, $5);
    char * concat5 = concat(concat4, $6);
    char * concat6 = concat(concat5, $7);
    char * concat7 = concat(concat6, $8);
    char * concat8 = concat(concat7, $9);
    char * concat9 = concat(concat8, $10);
    char * concat10 = concat(concat9, $11);
    char * concat11 = concat(concat10, $12);
    char * concat12 = concat(concat11, $13);
    char * concat13 = concat(concat12, $14);
    char * concat14 = concat(concat13, $15);
    char * concat15 = concat(concat14, $16);
    char * concat16 = concat(concat15, $17);
    char * concat17 = concat(concat16, $18);
    char * concat18 = concat(concat17, $19);
    char * concat19 = concat(concat18, $20);
    char * concat20 = concat(concat19, $21);

    $$ = concat20;
}
                    ;

TypeDeclaration     : CLASS Identifier LEFT_CURVY_PAREN TypeIdentifierRec MethodDeclarationRec RIGHT_CURVY_PAREN{
    if(endspaces) $1 = concat($1, " ");
    if(spaces) $2 = concat($2, " ");
    if(endspaces) $3 = concat($3, " ");
    if(spaces) $4 = concat($4, " ");
    if(spaces) $5 = concat($5, " ");
    if(endspaces) $6 = concat($6, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);
    char * concat3 = concat(concat2, $4);
    char * concat4 = concat(concat3, $5);
    char * concat5 = concat(concat4, $6);

    $$ = concat5;
}
                    | CLASS Identifier EXTENDS Identifier LEFT_CURVY_PAREN TypeIdentifierRec MethodDeclarationRec RIGHT_CURVY_PAREN{
    if(endspaces) $1 = concat($1, " ");
    if(spaces) $2 = concat($2, " ");
    if(endspaces) $3 = concat($3, " ");
    if(spaces) $4 = concat($4, " ");
    if(endspaces) $5 = concat($5, " ");
    if(spaces) $6 = concat($6, " ");
    if(spaces) $7 = concat($7, " ");
    if(endspaces) $8 = concat($8, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);
    char * concat3 = concat(concat2, $4);
    char * concat4 = concat(concat3, $5);
    char * concat5 = concat(concat4, $6);
    char * concat6 = concat(concat5, $7);
    char * concat7 = concat(concat6, $8);

    $$ = concat7;
}
                    ;


MethodDeclarationRec:  {$$ = strdup("");}
                    | MethodDeclaration MethodDeclarationRec {
    if(spaces) $1 = concat($1, " ");
    if(spaces) $2 = concat($2, " ");
    $$ = concat($1, $2);
}
                    ;

MethodDeclaration   : PUBLIC Type Identifier LEFT_NORMAL_PAREN TypeIdenTypePlus RIGHT_NORMAL_PAREN LEFT_CURVY_PAREN TypeIdentifierRec StatementRec RETURN Expression SEMICOLON RIGHT_CURVY_PAREN {
    if(endspaces) $1 = concat($1, " ");
    if(spaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    if(endspaces) $4 = concat($4, " ");
    if(spaces) $5 = concat($5, " ");
    if(endspaces) $6 = concat($6, " ");
    if(endspaces) $7 = concat($7, " ");
    if(spaces) $8 = concat($8, " ");
    if(spaces) $9 = concat($9, " ");
    if(endspaces) $10 = concat($10, " ");
    if(spaces) $11 = concat($11, " ");
    if(endspaces) $12 = concat($12, " ");
    if(endspaces) $13 = concat($13, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);
    char * concat3 = concat(concat2, $4);
    char * concat4 = concat(concat3, $5);
    char * concat5 = concat(concat4, $6);
    char * concat6 = concat(concat5, $7);
    char * concat7 = concat(concat6, $8);
    char * concat8 = concat(concat7, $9);
    char * concat9 = concat(concat8, $10);
    char * concat10 = concat(concat9, $11);
    char * concat11 = concat(concat10, $12);
    char * concat12 = concat(concat11, $13);

    $$ = concat12;
}
                    ;

TypeIdentifierRec   :  {$$ = strdup("");}
                    | TypeIdentifierRec Type Identifier SEMICOLON {
    if(spaces) $1 = concat($1, " ");
    if(spaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    if(endspaces) $4 = concat($4, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);
    char * concat3 = concat(concat2, $4);

    $$ = concat3;
}
                    ;
                    
TypeIdenTypePlus    :  {$$ = strdup("");}
                    | Type Identifier TypeTmp {
    if(spaces) $1 = concat($1, " ");
    if(spaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);

    $$ = concat2;
    }
                    ;

TypeTmp             : {$$ = strdup("");}
                    | COMMA Type Identifier TypeTmp{
    if(endspaces) $1 = concat($1, " ");
    if(spaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    if(spaces) $4 = concat($4, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);
    char * concat3 = concat(concat2, $4);

    $$ = concat3;
}
;


Type                : INT LEFT_SQUARE_PAREN RIGHT_SQUARE_PAREN {
    if(endspaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(endspaces) $3 = concat($3, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);

    $$ = concat2;
}
                    | BOOLEAN {
    if(endspaces) $1 = concat($1, " ");
    $$ = $1;
}
                    | INT {
    if(endspaces) $1 = concat($1, " ");
    $$ = $1;}
                    | Identifier {
    if(spaces) $1 = concat($1, " ");
    $$ = $1;
}
                    ;

StatementRec        :  {$$ = strdup("");}
                    | Statement StatementRec {                    
    if(spaces) $1 = concat($1, " ");
    if(spaces) $2 = concat($2, " ");
    $$ = concat($1, $2);
}
                    ;

Statement           : LEFT_CURVY_PAREN StatementRec RIGHT_CURVY_PAREN {
    if(endspaces) $1 = concat($1, " ");
    if(spaces) $2 = concat($2, " ");
    if(endspaces) $3 = concat($3, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);

    $$ = concat2;
} 
                    | PRINTLN LEFT_NORMAL_PAREN Expression RIGHT_NORMAL_PAREN SEMICOLON{
    if(endspaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    if(endspaces) $4 = concat($4, " ");
    if(endspaces) $5 = concat($5, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);
    char * concat3 = concat(concat2, $4);
    char * concat4 = concat(concat3, $5);

    $$ = concat4;
}
                    | Identifier EQUAL Expression SEMICOLON {
    if(spaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    if(endspaces) $4 = concat($4, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);
    char * concat3 = concat(concat2, $4);

    $$ = concat3;
}
                    | Identifier LEFT_SQUARE_PAREN Expression RIGHT_SQUARE_PAREN EQUAL Expression SEMICOLON {
    if(spaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    if(endspaces) $4 = concat($4, " ");
    if(endspaces) $5 = concat($5, " ");
    if(spaces) $6 = concat($6, " ");
    if(endspaces) $7 = concat($7, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);
    char * concat3 = concat(concat2, $4);
    char * concat4 = concat(concat3, $5);
    char * concat5 = concat(concat4, $6);
    char * concat6 = concat(concat5, $7);

    $$ = concat6;
}
                    | IF LEFT_NORMAL_PAREN Expression RIGHT_NORMAL_PAREN Statement{
    if(endspaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    if(endspaces) $4 = concat($4, " ");
    if(spaces) $5 = concat($5, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);
    char * concat3 = concat(concat2, $4);
    char * concat4 = concat(concat3, $5);

    $$ = concat4;
}
                    | IF LEFT_NORMAL_PAREN Expression RIGHT_NORMAL_PAREN Statement ELSE Statement{
    if(endspaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    if(endspaces) $4 = concat($4, " ");
    if(spaces) $5 = concat($5, " ");
    if(endspaces) $6 = concat($6, " ");
    if(spaces) $7 = concat($7, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);
    char * concat3 = concat(concat2, $4);
    char * concat4 = concat(concat3, $5);
    char * concat5 = concat(concat4, $6);
    char * concat6 = concat(concat5, $7);

    $$ = concat6;
}
                    | DO Statement WHILE LEFT_NORMAL_PAREN Expression RIGHT_NORMAL_PAREN SEMICOLON{
    if(endspaces) $1 = concat($1, " ");
    if(spaces) $2 = concat($2, " ");
    if(endspaces) $3 = concat($3, " ");
    if(endspaces) $4 = concat($4, " ");
    if(spaces) $5 = concat($5, " ");
    if(endspaces) $6 = concat($6, " ");
    if(endspaces) $7 = concat($7, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);
    char * concat3 = concat(concat2, $4);
    char * concat4 = concat(concat3, $5);
    char * concat5 = concat(concat4, $6);
    char * concat6 = concat(concat5, $7);

    $$ = concat6;
}
                    | WHILE LEFT_NORMAL_PAREN Expression RIGHT_NORMAL_PAREN Statement{
    if(endspaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    if(endspaces) $4 = concat($4, " ");
    if(spaces) $5 = concat($5, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);
    char * concat3 = concat(concat2, $4);
    char * concat4 = concat(concat3, $5);

    $$ = concat4;
}
                    | Identifier LEFT_NORMAL_PAREN ExpressionPlus RIGHT_NORMAL_PAREN SEMICOLON {
    if(spaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    if(endspaces) $4 = concat($4, " ");
    if(endspaces) $5 = concat($5, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);
    char * concat3 = concat(concat2, $4);
    char * concat4 = concat(concat3, $5);
    if(macro){
        $$ = process_string($1, $3, 1);
    }
    if(macro == 0) $$ = concat4;
}
                    ;

ExpressionPlus      :  {$$ = strdup("");}
                    | Expression {
    if(spaces) $1 = concat($1, " ");
    $$ = $1;}
                    | ExpressionPlus COMMA Expression {
    if(spaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);

    $$ = concat2;
}
                    ;

Expression          : PrimaryExpression AND PrimaryExpression{
    if(spaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);

    $$ = concat2;
}
                    | PrimaryExpression OR PrimaryExpression{
    if(spaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);

    $$ = concat2;
}
                    | PrimaryExpression NOT_EQUAL PrimaryExpression{
    if(spaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);

    $$ = concat2;
}
                    | PrimaryExpression LESS_EQUAL PrimaryExpression{
    if(spaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);

    $$ = concat2;
}
                    | PrimaryExpression PLUS PrimaryExpression{
    if(spaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);

    $$ = concat2;
}
                    | PrimaryExpression MINUS PrimaryExpression{
    if(spaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);

    $$ = concat2;
}
                    | PrimaryExpression MULTIPLY PrimaryExpression{
    if(spaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);

    $$ = concat2;
}
                    | PrimaryExpression DIVIDE PrimaryExpression{
    if(spaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);

    $$ = concat2;
}
                    | PrimaryExpression LEFT_SQUARE_PAREN PrimaryExpression RIGHT_SQUARE_PAREN{
    if(spaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    if(endspaces) $4 = concat($4, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);
    char * concat3 = concat(concat2, $4);

    $$ = concat3;
}
                    | PrimaryExpression  {
    if(spaces) $1 = concat($1, " ");
    $$ = $1;}
                    | PrimaryExpression DOT LENGTH{
    if(spaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(endspaces) $3 = concat($3, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);

    $$ = concat2;
}
                    | PrimaryExpression DOT Identifier LEFT_NORMAL_PAREN ExpressionPlus RIGHT_NORMAL_PAREN{
    if(spaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    if(endspaces) $4 = concat($4, " ");
    if(spaces) $5 = concat($5, " ");
    if(endspaces) $6 = concat($6, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);
    char * concat3 = concat(concat2, $4);
    char * concat4 = concat(concat3, $5);
    char * concat5 = concat(concat4, $6);

    $$ = concat5;
}
                    | Identifier LEFT_NORMAL_PAREN  ExpressionPlus RIGHT_NORMAL_PAREN{
    if(spaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    if(endspaces) $4 = concat($4, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);
    char * concat3 = concat(concat2, $4);
    if(macro){
        $$ = process_string($1, $3, 0);
    }
    if(macro == 0) $$ = concat3;
}
                    ;

PrimaryExpression   : Integer  {
    if(spaces) $1 = concat($1, " ");
    $$ = $1;}
                    | TRUE  {
    if(endspaces) $1 = concat($1, " ");
    $$ = $1;}
                    | FALSE  {
    if(endspaces) $1 = concat($1, " ");
    $$ = $1;}
                    | Identifier  {
    if(spaces) $1 = concat($1, " ");
    $$ = $1;}
                    | THIS {
    if(endspaces) $1 = concat($1, " ");
    $$ = $1;}
                    | NEW INT LEFT_SQUARE_PAREN Expression RIGHT_SQUARE_PAREN{
    if(endspaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(endspaces) $3 = concat($3, " ");
    if(spaces) $4 = concat($4, " ");
    if(endspaces) $5 = concat($5, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);
    char * concat3 = concat(concat2, $4);
    char * concat4 = concat(concat3, $5);

    $$ = concat4;
}
                    | NEW Identifier LEFT_NORMAL_PAREN RIGHT_NORMAL_PAREN{
    if(endspaces)$1 = concat($1, " ");
    if(spaces)$2 = concat($2, " ");
    if(endspaces)$3 = concat($3, " ");
    if(endspaces)$4 = concat($4, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);
    char * concat3 = concat(concat2, $4);

    $$ = concat3;
}
                    | NOT Expression  {
    if(endspaces) $1 = concat($1, " ");
    if(spaces) $2 = concat($2, " ");
    char * concat1 = concat($1, $2);
    $$ = concat1;}
                    | LEFT_NORMAL_PAREN Expression RIGHT_NORMAL_PAREN{
    if(endspaces) $1 = concat($1, " ");
    if(spaces) $2 = concat($2, " ");
    if(endspaces) $3 = concat($3, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);

    $$ = concat2;
}
                    ;   

MacroDefinition     : MacroDefExpression {/*$$ = $1;*/}
                    | MacroDefStatement {/*$$ = $1;*/}
                    ;


IdenCommaIdenPlus   :  {$$ = strdup("");}
                    | Identifier {
    if(spaces) $1 = concat($1, " ");
    $$ = $1;
}
                    | IdenCommaIdenPlus COMMA Identifier {
    if(spaces) $1 = concat($1, " ");
    if(endspaces) $2 = concat($2, " ");
    if(spaces) $3 = concat($3, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);

    $$ = concat2;
}
                    ;

MacroDefStatement   : DEFINE Identifier LEFT_NORMAL_PAREN IdenCommaIdenPlus RIGHT_NORMAL_PAREN LEFT_CURVY_PAREN StatementRec RIGHT_CURVY_PAREN{
    if(endspaces) $1 = concat($1, " ");
    if(spaces) $2 = concat($2, " ");
    if(endspaces) $3 = concat($3, " ");
    if(spaces) $4 = concat($4, " ");
    if(endspaces) $5 = concat($5, " ");
    if(endspaces) $6 = concat($6, " ");
    if(spaces) $7 = concat($7, " ");
    if(endspaces) $8 = concat($8, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);
    char * concat3 = concat(concat2, $4);
    char * concat4 = concat(concat3, $5);
    char * concat5 = concat(concat4, $6);
    char * concat6 = concat(concat5, $7);
    char * concat7 = concat(concat6, $8);
    char * express = concat($6, $7);
    express = concat(express, $8);
    if(macro) add_entry(remove_white_spaces($2), remove_white_spaces($4), remove_white_spaces(express), 1);
    if(!macro) $$ = concat7;
}
                    ;

MacroDefExpression  : DEFINE Identifier LEFT_NORMAL_PAREN IdenCommaIdenPlus RIGHT_NORMAL_PAREN LEFT_NORMAL_PAREN Expression RIGHT_NORMAL_PAREN{
    if(endspaces) $1 = concat($1, " ");
    if(spaces) $2 = concat($2, " ");
    if(endspaces) $3 = concat($3, " ");
    if(spaces) $4 = concat($4, " ");
    if(endspaces) $5 = concat($5, " ");
    if(endspaces) $6 = concat($6, " ");
    if(spaces) $7 = concat($7, " ");
    if(endspaces) $8 = concat($8, " ");
    char * concat1 = concat($1, $2);
    char * concat2 = concat(concat1, $3);
    char * concat3 = concat(concat2, $4);
    char * concat4 = concat(concat3, $5);
    char * concat5 = concat(concat4, $6);
    char * concat6 = concat(concat5, $7);
    char * concat7 = concat(concat6, $8);
    char * express = concat($6, $7);
    express = concat(express, $8);
    if(macro) add_entry(remove_white_spaces($2), remove_white_spaces($4), remove_white_spaces(express), 0);
    if(!macro) $$ = concat7;
}
                    ;

Identifier: IDENTIFIER  {
    if(endspaces) $1 = concat($1, " ");
    $$ = $1;
}    ;

Integer: INTEGER_LITERAL  {
    if(endspaces) $1 = concat($1, " ");
    $$ = $1;
}
    | MINUS INTEGER_LITERAL{
        if(endspaces) $1 = concat($1, " ");
        if(endspaces) $2 = concat($2, " ");
        $$ = concat($1, $2);
    }
    | PLUS INTEGER_LITERAL{
        if(endspaces) $1 = concat($1, " ");
        if(endspaces) $2 = concat($2, " ");
        $$ = concat($1, $2);
    }
;
%%

int main()
{
    yyparse();
}

void yyerror()
{
    printf("// Failed to parse macrojava code.");
    exit(1);
}