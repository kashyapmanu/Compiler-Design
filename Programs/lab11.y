%{
#include<stdio.h>
%}
%token DIGIT LETTER NL UND
%%
stmt:variable NL {printf("Valid\n");exit(0);}
	;
variable:LETTER alphanumeric |LETTER
	;
alphanumeric:LETTER alphanumeric
	       |DIGIT alphanumeric
	       |UND alphanumeric
	       |UND
	       |LETTER
	       |DIGIT
	      ;
%%
int yyerror(char *msg)
{
	printf("Invalid\n");
}
int main()
{
	printf("Enter the variable:");
	yyparse();
}
	       
