%{
#include <stdio.h>
#include <stdlib.h>

void decimalToHex(int decimal) {
    char hex[100];
    int index = 0;


    while (decimal > 0) {
        int remainder = decimal % 16;


        if (remainder < 10)
            hex[index++] = '0' + remainder;
        else
            hex[index++] = 'A' + (remainder - 10);

        decimal = decimal / 16;
    }


    printf("Hex: ");
    for (int i = index - 1; i >= 0; i--)
        printf("%c", hex[i]);
    printf("\n");
}
%}

%%
[0-9]+ {
    int decimal = atoi(yytext);  
    printf("Decimal: %d\t", decimal);
    decimalToHex(decimal);
}
[ \t\n]+  ;  
.         { printf("Invalid character: %s\n", yytext); }
%%

int main(int argc, char *argv[])
{
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            perror("Error opening file");
            return 1;
        }
    }
    yylex();
    return 0;
}
