%token NOMBRE PLUS MOINS FOIS DIVISION GPAREN DPAREN EOL PT_VIRG
%left PLUS MOINS
%left FOIS
%left DIVISION
%nonassoc UMOINS
%type <unit> main expression
%start main
%%
main:
expression EOL {}
| expression PT_VIRG {}
;
expression:
expression PLUS expression {}
| expression MOINS expression {}
| expression FOIS expression {}
| expression DIVISION expression {}
| GPAREN expression DPAREN {}
| MOINS expression %prec UMOINS {}
| NOMBRE {}
;
