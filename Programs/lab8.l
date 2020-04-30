%{
#include<stdio.h>
int noprt=0,nopnd=0,valid=1,top=-1,l=0,j=0;
char a[10],opnd[10][10],oprt[10][10];
%}
%%
"(" {top++;a[top]='(';}
"[" {top++;a[top]='[';}
"{" {top++;a[top]='{';}
")" {if(a[top]!='(')
     {
	valid=0;
	return -99;
     }
    else
	top--;
    }
"]" {if(a[top]!='[')
     {
	valid=0;
	return -99;
     }
    else
	top--;
    }
"}" {if(a[top]!='{')
     {
	valid=0;
	return -99;
     }
    else
	top--;
    }
"+"|"-"|"*"|"/" {noprt++;strcpy(oprt[l],yytext);l++;}
[0-9]+|[a-zA-Z][a-zA-Z0-9_]* {nopnd++;strcpy(opnd[j],yytext);j++;}
%%
int main()
{
int k=0;
printf("Enter the expression:");
yylex();
if(valid==1 && top==-1 && (nopnd-noprt)==1)
{
printf("The expression is valid\n");
printf("The operators are:\n");
for(k=0;k<l;k++)
{
printf("%s\n",oprt[k]);
}
printf("The operands are:\n");
for(k=0;k<j;k++)
{
printf("%s\n",opnd[k]);
}
}
else
{
printf("Invalid expression\n");
}
return 0;
}
int yywrap()
{
return 1;
}
