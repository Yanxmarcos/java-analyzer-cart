package trabajoimplementacion;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ \t]+
newline=\n
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* Manejo de nuevas líneas */
{newline} { 
    yycolumn = 0; 
}

/* Espacios en blanco */
{espacio} { 
    yycolumn += yytext().length(); /* Ignorar espacios, pero actualizar columna */ 
}

/* Palabras clave */
"Carrito" { yycolumn += yytext().length(); return symbol(sym.Carrito, yytext()); }
"Espacio" { yycolumn += yytext().length(); return symbol(sym.Espacio, yytext()); }
"SetEspacio" { yycolumn += yytext().length(); return symbol(sym.SetEspacio, yytext()); }
"Color" { yycolumn += yytext().length(); return symbol(sym.Color, yytext()); }
"SetForma" { yycolumn += yytext().length(); return symbol(sym.SetForma, yytext()); }
"Velocidad" { yycolumn += yytext().length(); return symbol(sym.Velocidad, yytext()); }
"Direccion" { yycolumn += yytext().length(); return symbol(sym.Direccion, yytext()); }
"Avanzar" { yycolumn += yytext().length(); return symbol(sym.Avanzar, yytext()); }
"Retroceder" { yycolumn += yytext().length(); return symbol(sym.Retroceder, yytext()); }
"Girar" { yycolumn += yytext().length(); return symbol(sym.Girar, yytext()); }
"Detener" { yycolumn += yytext().length(); return symbol(sym.Detener, yytext()); }
"Sensor" { yycolumn += yytext().length(); return symbol(sym.Sensor, yytext()); }
"Sonido" { yycolumn += yytext().length(); return symbol(sym.Sonido, yytext()); }

/* Símbolos */
"(" { yycolumn += yytext().length(); return symbol(sym.ParentesisAbierto, yytext()); }
")" { yycolumn += yytext().length(); return symbol(sym.ParentesisCerrado, yytext()); }
"," { yycolumn += yytext().length(); return symbol(sym.Coma, yytext()); }
";" { yycolumn += yytext().length(); return symbol(sym.PuntoComa, yytext()); }
"=" { yycolumn += yytext().length(); return symbol(sym.Igual, yytext()); }
"." { yycolumn += yytext().length(); return symbol(sym.Punto, yytext()); }
"+" { yycolumn += yytext().length(); return symbol(sym.Suma, yytext()); }
"-" { yycolumn += yytext().length(); return symbol(sym.Resta, yytext()); }
"*" { yycolumn += yytext().length(); return symbol(sym.Multiplicacion, yytext()); }
"/" { yycolumn += yytext().length(); return symbol(sym.Division, yytext()); }

/* Números */
{D}"."{D} { 
    yycolumn += yytext().length(); 
    return symbol(sym.NumeroDecimal, yytext()); 
}
{D}+ { 
    yycolumn += yytext().length(); 
    return symbol(sym.Numero, yytext()); 
}

/* Identificadores */
{L}({L}|{D})* { 
    yycolumn += yytext().length(); 
    return symbol(sym.Identificador, yytext()); 
}

/* Cadenas de texto */
\"([^\"\\]|\\.)*\" { 
    yycolumn += yytext().length(); 
    return symbol(sym.CadenaTexto, yytext()); 
}


/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Caracteres no reconocidos */
. { 
    return symbol(sym.ERROR, yytext()); 
}


