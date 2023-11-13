%{
    #include <stdio.h>
    struct varStr{
        char* varName;
        int varVal;
    };
    struct varStr var_map[1000];
    int numVar = 0;

    void update_map(char* name,int val)
    {
        for(int i=0;i<numVar;i++)
        {
            if(strcmp(name,var_map[i].varName)==0)
            {
                var_map[i].varVal=val;
                return;
            }
        }
        struct varStr tempVar;
        tempVar.varName = name;
        tempVar.varVal = val;
        var_map[numVar] = tempVar;
        numVar++;
    }

    int getVal(char* name)
    {
        for(int i=0;i<numVar;i++)
        {
            if(strcmp(name,var_map[i].varName)==0)
            {
                return var_map[i].varVal;
            }
        }
    }
    int execFlag = 1;
%}

%union 
{
    char* str;
    int num;
}

%token<num> NUMBER
%token<str> ADD SUB MUL DIV ABS MAX
%token<str> LBRACKET RBRACKET STP    
%token<str> EOL
%token<str> ID
%token<str> EQL
%token<str> PRINT
%token<str> IF
%token<str> THEN

%type<num> calclist exp factor term

%%

calclist:{}
    | calclist exp STP EOL {}
    ;


exp: factor {$$ = $1;}   
    | exp ADD factor {$$ = $1 + $3; }
    | exp SUB factor {$$ = $1 - $3; }

    ;

factor: term {$$ = $1;}    
    | factor MUL term {if(execFlag) {$$ = $1 * $3; }}
    | factor DIV term {if(execFlag) {$$ = $1 / $3; }}
    ;



term: NUMBER {$$ = $1;}
    | ID EQL exp {
    	if(execFlag)
    	{ 
	update_map($1,$3);
	$$ = $3;
        }
    }
    | ID {if(execFlag) {$$ = getVal($1);}}
    | MAX exp STP exp STP {if(execFlag) {$$ = $2>$4? $2 : $4;}} 
    | LBRACKET exp RBRACKET {if(execFlag) {$$ = $2;}}
    | SUB term {if(execFlag) {$$ = -$2;}}   
    | ABS term {if(execFlag) {$$ = $2 >=0? $2 : -$2;} }
    | IF exp { if(execFlag) {if($2==0){execFlag=0;}}} THEN exp {if(execFlag) {$$ = $5;} execFlag=1;}
    | PRINT exp {if(execFlag) {printf("= %d\n",$2);}}
    ;
%%    

int main(int argc, char **argv)
{
    yyparse();
}

yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}
