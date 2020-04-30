%{
#include<stdio.h>
int w=0,c=0,l=0,s=0;
%}
WORD [^ \t\n\.,:]+
EOL [\n]
BLANK [ ]
%%
{WORD} {w++;c=c+yyleng;}
{EOL} {l++;}
{BLANK} {s++;}
. {;}
%%
void main(int argc,char*argv[])
{
if(argc!=2)
{
printf("Usage:<./a.out><Sourcefile>\n");
exit(0);
}
yyin=fopen(argv[1],"r");
yylex();
printf("No of characters:%d\n",c);
printf("No of words:%d\n",w);
printf("No of space:%d\n",s);
printf("No of lines:%d\n",l);
}
int yywrap()
{
return 1;
}
