%{
#include<stdio.h>
#include<string.h>
int com=0;
%}
%s COMMENT
%%
"//".*\n {com++;}
"/*".*"*/" {com++;}
"/*" {BEGIN COMMENT;}
<COMMENT>"*/" {com++;BEGIN 0;}
<COMMENT>.|\n {;}
.|\n {fprintf(yyout,"%s",yytext);}
%%
void main(int argc,char *argv[]){
if(argc!=3){
printf("Usage:<./a.out><sourcefile><destfile>\n");
exit(0);
}
yyin=fopen(argv[1],"r");
yyout=fopen(argv[2],"w");
yylex();
printf("No. of comments:%d\n",com);
}
int yywrap(){
return 1;
}
