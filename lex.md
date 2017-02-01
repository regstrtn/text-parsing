%{
#include<stdio.h>
#include<math.h>
#include "cali.tab.h"
int yywrap(void);
%}
%%



[0-9]+ {
 yylval.dval=atoi(yytext);
 return NUMBER;
 }
[t];
n {   
	
	return 0;
  }
\n {
	printf("this is new line\n");
	}
. {return yytext[0];}


%%


  User defined routines will go here. Remove this line

  int yywrap(){
	  printf("End of parsing \n");
  }
void yyerror(const char *str)
{
 printf("n Invalid Character...");
}
int main(){
 printf("Enter Expression => ");
 
 yyparse();
 return(0);
}
