%{
   #include "y.tab.h"
%}
%%
[ ] {return SP;}
[\n] {return NL;}
[;] {return SC;}
[,] {return CM;}
"int" {return INT;}
"char" {return CHAR;}
[a-zA-Z]+ {return ID;}
. {;}
%%
int yywrap()
{
  return 1;
}
