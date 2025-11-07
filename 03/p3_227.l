%{
#include <stdio.h>
int count = 0;
%}

%%
[Aa][a-zA-Z]*   { count++; }     // Matches words starting with A or a
[^ \n\t]+       ;                // Matches any other word (ignored)
[\n\t ]+        ;                // Skip whitespace
%%

int main()
{
    printf("Enter text:\n");
    yylex();
    printf("Number of words starting with 'A' or 'a' = %d\n", count);
    return 0;
}