%{
#include <stdio.h>
#include <string.h>
extern FILE *yyin;

void yyerror(const char *str) {
        fprintf(stderr,"error: %s\n",str);
}
 
int yywrap() {
        return 1;
} 
  
void main(int argc, char**argv ) {
              if(argc<2) {
               fprintf(stderr, "Provide filename\n");
               exit(0);
       }
        char inp[256] = {0};
        strcpy(inp,"./htmpages/");
        strcat(inp, argv[1]);
        FILE *fp = fopen(inp, "r");
        yyin = fp;
        yyparse();
} 

%}

%union
{
        char *str;
        int numeric;
}

%token <str> PRJ STD PUBSTART PUBEND TXT H3 PPUB P_CLOSE
%type <str> ignore txt pub

%%
pub:    /*empty*/
        | pub PPUB txt P_CLOSE { 
                printf("%s\n", $3); printf("--++--");
                //int len = strlen($1) + strlen($3) + 1;
                //char *s = malloc(sizeof(char)*len);
                //$$ = strdup(s); 
         }
        | pub ignore 
        ;

txt:    txt TXT     {
                char *s = malloc(sizeof(char)*(strlen($1)+strlen($2)+2));
                strcpy(s, $1); //strcat(s, "$"); 
                strcat(s, $2);
                $$ = strdup(s);
                }
        | TXT {
                char *s = malloc(sizeof(char)*(strlen($1)+2));
                strcpy(s, $1); //strcat(s, "$");
                $$ = strdup(s);
                }
        ;

ignore: /*empty*/
        | ignore txt | ignore P_CLOSE
        ;
%%
