package trabajoimplementacion;
import static trabajoimplementacion.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t\r\n]+
%{
    public String lexeme;
%}
%%

"Carrito" {lexeme=yytext(); return Carrito;}
"Espacio" {lexeme=yytext(); return Espacio;}
"SetEspacio" {lexeme=yytext(); return SetEspacio;}
"Color" {lexeme=yytext(); return Color;}
"SetForma" {lexeme=yytext(); return SetForma;}
"Velocidad" {lexeme=yytext(); return Velocidad;}
"Avanzar" {lexeme=yytext(); return Avanzar;}
"Retroceder" {lexeme=yytext(); return Retroceder;}
"Girar" {lexeme=yytext(); return Girar;}
"Detener" {lexeme=yytext(); return Detener;}
"Sensor" {lexeme=yytext(); return Sensor;}
"Sonido" {lexeme=yytext(); return Sonido;}

"(" {lexeme=yytext(); return ParentesisAbierto;}
")" {lexeme=yytext(); return ParentesisCerrado;}
"," {lexeme=yytext(); return Coma;}
";" {lexeme=yytext(); return PuntoComa;}

"=" {lexeme=yytext(); return Igual;}
"+" {lexeme=yytext(); return Suma;}
"-" {lexeme=yytext(); return Resta;}
"*" {lexeme=yytext(); return Multiplicacion;}
"/" {lexeme=yytext(); return Division;}
"." {lexeme=yytext(); return Punto;}

{D}+ "." {D}+ {lexeme=yytext(); return NumeroDecimal;}

{L}({L}|{D})* {
    lexeme = yytext();
    return "Direccion".equals(lexeme) ? Direccion : Identificador;
}
{D}+ {lexeme=yytext(); return Numero;}
\"([^\"\\]|\\.)*\" {lexeme=yytext(); return CadenaTexto;}

{espacio} {/* Ignorar espacios y saltos de línea */}
"//".* {/* Ignorar comentarios de línea */}

. {return ERROR;}
