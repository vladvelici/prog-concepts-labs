(* File sdllexer.mll *)
{
open Path
open Sdlparser
exception Eof
}
rule token = parse
      [' ' '\t']     { token lexbuf }     (* skip blanks *)
    | ['\n' ]  { EOL }
    | ['0'-'9']+ as lxm { INT(int_of_string lxm) }
    | "left"   { LEFT }
    | "right"  { RIGHT }
    | "down"   { DOWN }
    | "up"     { UP }
    | "?"      { IFFREE }
    | ":"      { ELSE }
    | '('      { LPAREN }
    | ')'      { RPAREN }
    | eof      { raise Eof }

