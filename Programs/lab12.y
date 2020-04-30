%{
#include<stdio.h>
%}
%token NUMBER ID NL
%left '+''-'
%left '*''/'
%%
stmt:exp NL {printf("Value=%d\n",$1);exit(0);}
    ;
exp:exp '+' exp {$$=$1+$3;}
   |exp '-' exp {$$=$1-$3;}
   |exp '*' exp {$$=$1*$3;}
   |exp '/' exp {if($3==0)
		 {
 		   printf("Divide by zero error\n");
		   exit(0);
		 }
		 else
		   $$=$1/$3;}
   |'('exp')' {$$=$2;}
   |ID {$$=$1;}
   |NUMBER {$$=$1;}
   ;
%%
int yyerror(char *msg)
{
printf("Invalid expression\n");
}
int main()
{
printf("Enter the expression:");
yyparse();
}
