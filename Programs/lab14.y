%{
#include<stdio.h>
%}
%token A B NL
%%
stmt: S NL {printf("Valid string\n");exit(0);}
    ;
S: A A A A A A A A A A K B
 |
 ;
K: A K
 |
 ;
%%
int yyerror(char *msg){
 printf("Invalid string\n");
}
int main(){
 printf("Enter the string:");
 yyparse();
}
