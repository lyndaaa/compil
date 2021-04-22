%{
open AST
%}
%token <int> NOMBRE
%token PLUS MOINS FOIS DIV GPAREN DPAREN EOL
%left PLUS MOINS
%left FOIS
%left DIV
%nonassoc UMOINS
%type <AST.expression_a> main expression
%start main
%%
main:
expression EOL { $1 }
;
expression:
expression PLUS expression { Plus ($1,$3) }
| expression MOINS expression { Moins($1,$3) }
| expression FOIS expression { Mult ($1,$3) }
| expression DIV expression { Div ($1,$3) }
| GPAREN expression DPAREN { $2 }
| MOINS expression %prec UMOINS { Neg $2 }
| NOMBRE { Num $1 }
;
