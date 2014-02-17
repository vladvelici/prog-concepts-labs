/* File sldparser.mly */
%{ open Path %}
%token <int> INT
%token IFFREE ELSE UP DOWN LEFT RIGHT
%token LPAREN RPAREN
%token EOL
%start main             /* the entry point */
%type <Path.pTerm> main
%%
main:
   expr EOL                { $1 }
;
expr:
 | LPAREN expr RPAREN           { $2 }
 | INT IFFREE expr ELSE expr    { IF (Blocked $1, $3, $5) }
 | LEFT INT                     { Left $2 }
 | RIGHT INT                    { Right $2 }
 | UP INT                       { Up $2 }
 | DOWN INT                     { Down $2 }
 | expr expr                    { Seq ($1, $2) } 
;

