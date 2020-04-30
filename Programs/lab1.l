%{
#include<stdio.h>
int vow=0;
int cons=0;
%}
%%
[aeiouAEIOU] {vow++;}
[a-zA-Z] {cons++;}
. {;}
%%
void main()
{
printf("Enter the input:");
yylex();
printf("No of vowels=%d\n",vow);
printf("No of consonants=%d\n",cons);
}
int yywrap()
{
return 1;
}
