%{   
#include "parser.hpp"
#define YY_USER_ACTION yylloc.first_line = yylloc.last_line = yylineno;
%}

%option noyywrap

NONDIGIT [A-Za-z_]
DIGIT    [0-9]
NEWLINE  [\r\n]

   
%%
"."            {yylval.node = new Node();yylval.node->val = yytext; return DOT;}
"["            {yylval.node = new Node();yylval.node->val = "ArraySubscriptExp:[]"; return L_SQ;}
"]"            {return R_SQ;}
";"            {return END;}

{NONDIGIT}({NONDIGIT}|{DIGIT})* {yylval.node = new Node();yylval.node->val = yytext; return Identifier;}
{DIGIT}+ {yylval.node = new Node();yylval.node->val = yytext; return DIGIT;}
{NEWLINE}+ {}
[ \t\r\n]+         {/* ignore spaces */}

%%
