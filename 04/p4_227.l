%{
#include <stdio.h>
%}

%%
[a-z]     { printf("%c", yytext[0] - 32); }   // Convert lowercase to uppercase
[A-Z]     { printf("%c", yytext[0] + 32); }   // Convert uppercase to lowercase
.|\n      { printf("%s", yytext); }           // Print other characters as-is
%%

int main()
{
    printf("Enter text:\n");
    yylex();
    return 0;
}