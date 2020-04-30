%{
	#include<stdio.h>
	int wordCount=0;
%}
chars [A-Za-z\_\'\.\"]
numbers ([0-9])+
delim [" "\n\t]
whitespace {delim}+
words {chars}+
%%
{words} {wordCount++;}
{whitespace} { }
{numbers} { }
%%

void main()
{
	printf("Enter the input:");
	yylex();
	printf("No. of words:%d\n",wordCount);
}
int yywrap()
{
	return 1;
}
