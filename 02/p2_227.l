%{
    #include<stdio.h>
    int linecount=0,spacecount=0,charcount=0,tabcount=0,wordcount=0;
%}

%%
[\n] {linecount++; charcount+=yyleng;}
[\t] {spacecount++; charcount+=yyleng;}
[^\t] {tabcount++; charcount+=yyleng;}
[^\t\n] {wordcount++; charcount+=yyleng;}
%%

int yywrap() {
    return 1;
}
int main() {
    printf("Enter the sentence: ");
    yylex();
    printf("Line Count: %d \n", linecount);
    printf("Space Count: %d \n", spacecount);
    printf("Tab Count: %d \n", tabcount);
    printf("Word Count: %d \n", wordcount);
    printf("Character Count: %d \n",charcount);
    return 0;
}