# text-parsing

When compiling a lex/yacc application, the general process is:

    Run yacc on your parser definition.
    Run lex on your lexical definition.
    Compile the generated yacc source.
    Compile the generated lex source.
    Compile any other modules.
    Link lex, yacc, and your other sources into an executable.
