%{
#include <stdio.h>
%}
%%
.*com$    { printf("Line ends with 'com': %s\n", yytext); }
.*        { printf("Line doesn't end with 'com'\n"); }
%%
int main() {
    yylex();
    return 0;
}