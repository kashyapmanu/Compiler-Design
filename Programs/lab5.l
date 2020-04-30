%{
#include<stdio.h>
int isSimple=1;
%}
%%
[ \n\t][aA][nN][dD][ \n\t] {isSimple=0;}
[ \n\t][oO][rR][ \n\t] {isSimple=0;}
[ \n\t][bB][uU][ \n\t] {isSimple=0;}
. {;}
%%
void main()
{
printf("Enter the sentence:\n");
yylex();
if(isSimple==1)
{
printf("Sentence is simple\n");
}
else
{
printf("Sentence is compound\n");
}
}
int yywrap()
{
return 1;
}

