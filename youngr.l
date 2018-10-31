/*
Reagan Young
Prog Lang & Trans
Lex spec for analyzer
*/

/* Regular Expressions */

WSPACE    [ \t\r]+
NEWLINE   \n
DIGIT     [0-9]
LETTER    [a-zA-Z]
COMMENT   (\;)(.)*

IDENT			({LETTER}|_)({LETTER}|{DIGIT}|_)* 
INTCONST  (\-|\+)?{DIGIT}+
STRCONST  (\")(.)*(\") 

LETSTAR   let\*
LAMBDA    lambda
INPUT     input
PRINT     print
IF        if
LPAREN    [(]
RPAREN    [)]
ADD       (\+)
MULT      (\*)
DIV       (\/)
SUB       (\-)
AND       and
OR        or
NOT       not
LT        (\<)
GT        (\>)
LE        (\<=)
GE        (\>=)
EQ        (\=)
NE        (\/=)
T         t
NIL       nil

%%
{LETSTAR}	{
            printTokenInfo("LETSTAR", yytext);
            beginScope();
            return T_LETSTAR;
          }
{LAMBDA}	{
            printTokenInfo("LAMBDA", yytext);
            beginScope();
            return T_LAMBDA;
          }
{INPUT}	  {
            printTokenInfo("INPUT", yytext);
            return T_INPUT;
          }
{PRINT}   {
            printTokenInfo("PRINT", yytext);
            return T_PRINT;
          }
{IF}  {
        printTokenInfo("IF", yytext);
        return T_IF;
      }
{LPAREN}  {
            printTokenInfo("LPAREN", yytext);
            return T_LPAREN;
          }
{RPAREN}  {
      printTokenInfo("RPAREN", yytext);
      return T_RPAREN;
    }
{ADD}  {
      printTokenInfo("ADD", yytext);
      return T_ADD;
    }
{MULT}  {
      printTokenInfo("MULT", yytext);
      return T_MULT;
    }
{DIV}  {
      printTokenInfo("DIV", yytext);
      return T_DIV;
    }
{SUB}  {
      printTokenInfo("SUB", yytext);
      return T_SUB;
    }
{AND}  {
      printTokenInfo("AND", yytext);
      return T_AND;
    }
{OR}  {
      printTokenInfo("OR", yytext);
      return T_OR;
    }
{NOT}  {
      printTokenInfo("NOT", yytext);
      return T_NOT;
    }
{LT}  {
      printTokenInfo("LT", yytext);
      return T_LT;
    }
{GT}  {
      printTokenInfo("GT", yytext);
      return T_GT;
    }
{LE}  {
      printTokenInfo("LE", yytext);
      return T_LE;
    }
{GE}  {
      printTokenInfo("GE", yytext);
      return T_GE;
    }
{EQ}  {
      printTokenInfo("EQ", yytext);
      return T_EQ;
    }
{NE}  {
      printTokenInfo("NE", yytext);
      return T_NE;
    }
{T}  {
      printTokenInfo("T", yytext);
      return T_T;
    }
{NIL} {
        printTokenInfo("NIL", yytext);
        return T_NIL;
      }
{STRCONST}  {
              printTokenInfo("STRCONST", yytext);
              return T_STRCONST;
            }
{INTCONST}  {
              printTokenInfo("INTCONST", yytext);
              return T_INTCONST;
            }
{IDENT} {
          yylval.text = strdup(yytext);
          printTokenInfo("IDENT", yytext);
          return T_IDENT;
        }
{NEWLINE}	{
            numLines++;
          }
{WSPACE}	{ }
{COMMENT} { }
.	{
    printTokenInfo("UNKNOWN", yytext);
		return T_UNKNOWN;
	}

%%