%{
#include <stdio.h>
#include "y.tab.h"
%}
%%

\<p\>\<span[ \r]*class=\"glyphicon[ \r]*glyphicon\-circle\-arrow\-right\"\>\<\/span\>            {
                  //printf("p lexed %s\n", yytext); 
                  return PPUB; 
                }

\<\/p\>           {  return P_CLOSE;}

\<[^\>]*\>  {
                    /*ignore other tags*/
                    //printf("Other tags ignored %s\n", yytext);
                  }

[ \r\t\n]+    {yylval.str = strdup(" "); return TXT;}

.            { yylval.str = strdup(yytext); return TXT; }

%%
