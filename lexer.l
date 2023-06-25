%option noyywrap
%option nodefault
%option yylineno

%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
%}

Tag_deabertura <([a-z]|[a-z]+|[a-z]+" "[a-z]+=\".*\"|h[0-6])>
Tag_defechamento <\/([a-z]|[a-z][a-z_][a-z]+|h[0-6])>
Tag_sisoladas <([a-z]|[a-z][a-z_][a-z])*" "\/>
Tag_de_conteudo [^<>\n]+
%%
[ \t\r]+     
\n        

{Tag_deabertura} printf("Tag_deabertura encontrado: %s\n", yytext);
{Tag_defechamento} printf("Tag_defechamento encontrado: %s\n", yytext);
{Tag_sisoladas} printf("Tag_isoladas encontrado: %s\n", yytext);
{Tag_de_conteudo} printf("Tag_de_conteudo encontrado: %s\n", yytext);

<<EOF>>	exit(0);
.	;

"\n"	;

%%

int main(){
	yyin = fopen("arquivo.txt", "r");
	yylex();
	return 0;
}