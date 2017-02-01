# General structure of a lex file

Before we start, let's understand that this sample.l lex file will be used by the lex command to generate a C code. This C code will be able to take a stream of text as input, and match that stream of text against the regular expressions that you have defined in the file. If a match is found, then some action can be taken (which is again, defined by you).

The generated C file will have the name lex.yy.c

The General Format of a Lex File consists of three sections:

##### 1. Definitions:
Anything in this part is simply copied the lex.yy.c file. This part generally includes #define, #include etc.
##### 2. Rules: 
This is the cool part. Where you define regular epxressions and specify what actions will be taken when a match is found. These actions could be simple, or could be very complex functins. If the action is a function, then you need to define that function in section 3 of the file. 
##### 3. User Subroutines
These are C functions that you might want to put in that lex.yy.c file. 

#### A sample lex file is explained below

##### Definition Part
	%{
	#include<stdio.h>
	#include<math.h>
	#include "cali.tab.h"
	int yywrap(void);
	%}
	
##### Rules part
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

##### User Subroutines part

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
