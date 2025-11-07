%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char *s);
%}
%token NUMBER
%token PLUS MINUS MULT DIV LPAREN RPAREN
%token EOL
%left PLUS MINUS
%left MULT DIV
%%
input:
    | input line
    ;
line:
      expr EOL       { printf("= %d\n", $1); }
    | error EOL      { yyerror("Invalid expression, try again."); yyerrok; }
    ;
expr:
      expr PLUS expr      { $$ = $1 + $3; }
    | expr MINUS expr     { $$ = $1 - $3; }
    | expr MULT expr      { $$ = $1 * $3; }
    | expr DIV expr       { 
                              if ($3 == 0) {
                                  yyerror("Division by zero! Result set to 0.");
                                  $$ = 0;
                              } else {
                                  $$ = $1 / $3;
                              }
                           }
    | LPAREN expr RPAREN  { $$ = $2; }
    | NUMBER              { $$ = $1; }
    ;
%%
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
int main() {
    printf("Enter expressions:\n");
    yyparse();
    return 0;
}