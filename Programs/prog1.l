%{
	#include<stdio.h>
	int c=0;
%}
digit [0-9]
letter [a-zA-Z]
id {letter}({letter}|{digit})*
%%
{id} {c++;}
%%
int main(){
	printf("Enter the input\n");
	yylex();
	printf("No of identifiers=%d\n",c);
	return 0;
}
int yywrap()
{
	return 1;
}
