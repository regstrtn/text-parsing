# Text Parsing using lex and yacc

What are lex and yacc? And why are they referred together. In very simple terms, lex will read a stream of text and identify useful terms/substrings (also known as tokens). These could be function names, if else statements etc. 
Yacc will then take these tokens and find the general structure of the text stream, eg, detecting the start and end of a block of code etc.

#### *What will we need for part 2 and 3 of this assignment?* 

1. One lex file (extension .l) - This file will have regular expressions to extract email addresses, html tags etc.
2. One yacc file (extension .y)- This file will have grammar rules which will help us de-construct the html page into blocks: contact information, publications, research scholars etc.

The lex and yacc tools will then take these files as input and will automatically generate C files. Commands:

1. lex lexfile.l
2. yacc -d parsefile.y (Don't omit the -d flag)

You will see new C files in the same folder. Compile these generated C files. You might need to use some libraries while compiling (similar to -lpthread, -lm etc.)

__In summary, when building a general a lex/yacc application, the general process is:__

    Run yacc on your parser definition file.
    Run lex on your lexical definition file.
    Compile the generated yacc source .
    Compile the generated lex source.
    Compile any other modules.
    Link lex, yacc, and your other sources into an executable.

Now run this executable on the raw HTML files that we downloaded using the crawler, and voila, page is parsed. 
Only problem is, I do not know how to write the grammar or regular expressions. If anyone has the grammar or any helpful pointers, please message me.

#### [General structure of a lex file is explained here](lex.md)
#### If anyone wants to explain the general structure of a yacc file, please do mail me. 

Thanks,

Mohammad Luqman

--------------------------------------------------------------------------------------------------------------
##### *This part is under construction*


##### How do we redirect the Stdin to a particular FILE * ?
Normally the Lex takes the input from the Standard input through a macro definition

    #define  lex_input() (((yytchar=yysptr>yysbuf?U(*--yysptr):getc(yyin))==10?(yylineno++,yytchar):yytchar)==EOF?0:yytchar)

    To redirect the yyyin from stdin just do the following
    FILE * fp=fopen("Filename","r");
    yyin=fp;

Another  leagal but bad workaround is to redefine this Macro in the definitions section by replacing yyin with fp. However this will always give a Warning during compilation.
