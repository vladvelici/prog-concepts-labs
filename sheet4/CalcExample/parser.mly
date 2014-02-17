/* File parser.mly */
%token <int> INT
%token PLUS MINUS TIMES DIV EXPONENTIAL MODULO
%token LPAREN RPAREN
%token EOL
%left PLUS MINUS        /* lowest precedence */
%left MODULO
%left TIMES DIV         /* medium precedence */
%left EXPONENTIAL
%nonassoc UMINUS        /* highest precedence */
%start main             /* the entry point */
%type <int> main
%%
main:
   expr EOL                { $1 }
;
expr:
   INT                     { $1 }
 | LPAREN expr RPAREN      { $2 }
 | expr PLUS expr          { $1 + $3 }
 | expr MINUS expr         { $1 - $3 }
 | expr TIMES expr         { $1 * $3 }
 | expr MODULO expr        { $1 mod $3 }
 | expr EXPONENTIAL expr   { int_of_float ((float_of_int $1) ** (float_of_int $3)) }
 | expr DIV expr           { $1 / $3 }
 | MINUS expr %prec UMINUS { - $2 }
;

