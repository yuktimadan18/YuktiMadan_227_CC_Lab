%{
#include "y.tab.h"
#include <stdio.h>
%}

%%
[0-9]+  {
    int i = 0;
    yylval.num = 0;
    while (yytext[i] != '\0') {
        yylval.num = yylval.num * 10 + (yytext[i] - '0');
        i++;
    }
    return NUMBER;
}
"+"     { return PLUS; }
"-"     { return MINUS; }
"*"     { return TIMES; }
"/"     { return DIVIDE; }
"|"     { return '|'; }
" "     ;
\n      { return 0; }
.       { printf("Invalid character: %s\n", yytext); return yytext[0]; }
%%