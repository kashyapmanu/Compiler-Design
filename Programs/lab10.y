%{
#include<stdio.h>
%}
%token NUMBER ID NL
%left '+' '-'
%left '*' '/'
%%
stmt: exp NL {printf("Valid expression\n");exit(0);}
	;
exp:exp '+' exp
   |exp '-' exp
   |exp '*' exp
   |exp '/' exp
   |'(' exp ')'
   |ID
   |NUMBER
   ;
%%
int yyerror(char *msg)
{
	printf("Invalid input\n");
}
int main()
{
printf("Enter the expresion:");
yyparse();
}  
