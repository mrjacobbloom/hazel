{
  open SkelExprParser
}

let white = [' ']+
let digit = ['0'-'9']
let placeholder = digit+

rule read = 
  parse
  | white { read lexbuf }
  | "+" { PLUS }
  | "*" { TIMES }
  | "_" { SPACEOP }
  | "," { COMMA }
  | "::" { CONS }
  | "<" { LT }
  | placeholder { PLACEHOLDER (int_of_string (Lexing.lexeme lexbuf)) }
  | eof { EOF }

