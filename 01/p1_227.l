%{
    #include<stdio.h>
%}

%%
one ONE One printf("1");
two TWO Two printf("2");
three|THREE|Three printf("3");
four | FOUR|Four printf("4");
five|FIVE|Five printf("5");
six|SIX|Six printf("6");
seven | SEVEN | Seven printf("7");
eight|EIGHT|Eight printf("8");
nine | NINE|Nine printf("9");
zero ZERO|Zero printf("0");
%%

int main()
{
    yylex();
    return 0;
}
