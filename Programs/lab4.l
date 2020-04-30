%{
#include<stdio.h>
int pf=0,sf=0;
%}
%%
"printf" {fprintf(yyout,"writef"); pf++;}
"scanf" {fprintf(yyout,"readf"); sf++;}
%%
void main(int argc,char *argv[]){
if(argc!=3){
printf("Usage:<./a.out><sourcefile><destinationfile>\n");
exit(0);
}
yyin=fopen(argv[1],"r");
yyout=fopen(argv[2],"w");
yylex();
printf("No. of scanf statements=%d\n",sf);
printf("No. of printf statements=%d\n",pf);
}
int yywrap(){
return 1;
}
