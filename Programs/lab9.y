%{
#include<stdio.h>
%}
%token SP SC CM NL ID INT CHAR FLOAT
%%
S:type SP list SC NL {printf("Valid\n");exit(0);}
;
type:INT
    |CHAR
    |FLOAT
    ;
list:list SP CM SP
    |list CM ID
    |ID
    ;
%%
int yyerror(char *msg)
{
  printf("Invalid\n");
}
int main()
{
  printf("Enter the declaration statement:\n");
  yyparse();
}
