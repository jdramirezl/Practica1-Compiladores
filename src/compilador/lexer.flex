package proyecto;
import java.util.ArrayList;
import java_cup.runtime.*;
%%
%class Lexer
%line
%column
%cup


// Se definen dos variables públicas

%{

public String errlex="";
public ArrayList<Token> ts = new ArrayList<Token>();
public Symbol symbol(int type){
    return new Symbol(type,yyline,yycolumn);

    }
%}

// Alfabetos

a= [a-zA-Z]
n = [0-9]
s= "_"
espacio = [\n\t\r ]

// Expresiones

int="-"?{n}+
float ="-"?{n}+"."{n}+
var = {a}({a}|{n}|{s})*
str = "'"({a}|{n}|{s}|" "|"=")* "'"
op="+"|"-"|"*"|"/"
log="<"|">"|"<="|">="|"=="|"&&"|"||"
nom="Programa "{a}({a}|{n}|{s})*
tipo="string"|"int"|"float"


%%
// Reservados
"("    {ts.add(new Token("p. izquierdo ",yytext()));return symbol(sym.pi);}
")"    {ts.add(new Token("p. derecho ",yytext()));return symbol(sym.pd);}
";"    {ts.add(new Token("punto y coma ",yytext()));return symbol(sym.pc);}
"="    {ts.add(new Token("asignacion ",yytext()));return symbol(sym.ig);}
","    {ts.add(new Token("coma ",yytext()));return symbol(sym.com);}
"input"    {ts.add(new Token("leer ",yytext()));return symbol(sym.rd);}
"print"    {ts.add(new Token("escribir ",yytext()));return symbol(sym.wt);}


// Estructuras
"while"    {ts.add(new Token("while inicio ",yytext()));return symbol(sym.wh);}
"do"    {ts.add(new Token("while condicion ",yytext()));return symbol(sym.doAction);}
"endWhile"    {ts.add(new Token("while fin ",yytext()));return symbol(sym.ew);}

"for"    {ts.add(new Token("for inicio ",yytext()));return symbol(sym.fr);}
"until"    {ts.add(new Token("for condicion ",yytext()));return symbol(sym.ul);}
"step"    {ts.add(new Token("Paso ",yytext()));return symbol(sym.step);}
":"    {ts.add(new Token("Inicio for ",yytext()));return symbol(sym.colon);}
"endFor"    {ts.add(new Token("for fin ",yytext()));return symbol(sym.ef);}

"if"    {ts.add(new Token("if inicio ",yytext()));return symbol(sym.ifCond);}
"else"    {ts.add(new Token("else ",yytext()));return symbol(sym.el);}
"endIf"    {ts.add(new Token("if fin ",yytext()));return symbol(sym.ei);}
"FinPrograma"  {ts.add(new Token("Fin del programa",yytext()));return symbol(sym.fp);}

// Tipos
{tipo}  {ts.add(new Token("Tipo de dato ",yytext()));return symbol(sym.tp);}
{int}  {ts.add(new Token("Entero ",yytext()));return symbol(sym.integer);}
{float}  {ts.add(new Token("Decimal ",yytext()));return symbol(sym.floatNum);}
{str}  {ts.add(new Token("String ",yytext()));return symbol(sym.str);}
{var}  {ts.add(new Token("Variable ",yytext()));return symbol(sym.var);}

// Operadores 
{op}  {ts.add(new Token("Operador ",yytext()));return symbol(sym.op);}
{log}  {ts.add(new Token("Logicos ",yytext()));return symbol(sym.log);}
{espacio}  {}

// Programa
{nom}  {ts.add(new Token("Definicion programa ",yytext()));return symbol(sym.ip);}

.  {errlex+=("\n Error Lexico, en linea : "+ (yyline+1)+" , "+(yycolumn+1)+ "caracter no valido "+yytext());}

// LISTOS -------

// Parentesis

// Punto y coma 
// Asignacion  (=)
// Coma
// Read, Write

// while, do, end while 
// for, until, end for 
// if, else, end if
// Relacionales (<, >, <=, >=, ==)
// Logicos (& |) and or
// tipo de dato (int, float, string)
// Variable, numero 
// String ""
// Operadores (+, -, *, /)

// FALTAN -------
// Programa Nombre, FinPrograma

