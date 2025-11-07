%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
int yyerror(const char *);
%}
%union {
    int num;
}
%token <num> NUMBER
%token PLUS MINUS TIMES DIVIDE
%type <num> expr exp_unit
%start expr
%%
expr:   exp_unit { printf("Result: %d\n", $1); }
      ;
exp_unit: NUMBER
        | exp_unit exp_unit PLUS   { $$ = $1 + $2; }
        | exp_unit exp_unit MINUS  { $$ = $1 - $2; }
        | exp_unit exp_unit TIMES  { $$ = $1 * $2; }
        | exp_unit exp_unit DIVIDE {
            if ($2 == 0) {
                fprintf(stderr, "Error: Division by zero\n");
                exit(1);
            }
            $$ = $1 / $2;
        }
        ;
%%
int yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
int main() {
    printf("Enter a postfix expression (e.g., 5 3 - 2 /): \n");
    yyparse();
    return 0;
}