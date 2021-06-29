%option noyywarp
%option yylineno

%{
    //includes
%}
ESPACIO_EN_BLANCO   (" ")+
TABULACION          (\t)+
/* PALABRA RESERVADA */
PALABRA_RESERVADA   auto|break|case|char|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while
NO_DIGITO           [_a-zA-Z]
DIGITO              [0-9]
/* IDENTIFICADOR */
IDENTIFICADOR       {NO_DIGITO}({NO_DIGITO}|{DIGITO})*
/* OPERADOR O CARACTER DE PUNTUACIÓN */
OPERADOR_O_CARACTER_DE_PUNTUACION   "["|"]"|"("|")"|"{"|"}"|"."|"->"|"++"|"--"|"&"|"*"|"+"|"-"|"~"|"!"|"/"|"%"|"<<"|">>"|"<"|">"|"<="|">="|"=="|"!="|"^"|"|"|"&&"|"||"|"="|"*="|"/="|"%="|"+="|"-="|"<<="|">>="|"&="|"^="|"|="|"?"|":"|";"|"..."|","|"#"|"##"
DIGITO_HEXADECIMAL [0-9a-fA-F]
SECUENCIA_DE_ESCAPE_HEXADECIMAL \\x{DIGITO_HEXADECIMAL}{1,2}
DIGITO_OCTAL    [0-7]
SECUENCIA_DE_ESCAPE_OCTAL    \\{DIGITO_OCTAL}{1,3}
SECUENCIA_DE_ESCAPE_SIMPLE   \\(\'|\"|\?|\\|a|b|f|n|r|t|v)
SECUENCIA_DE_ESCAPE {SECUENCIA_DE_ESCAPE_SIMPLE}|{SECUENCIA_DE_ESCAPE_OCTAL}|{SECUENCIA_DE_ESCAPE_HEXADECIMAL}
CUALQUIER_CARACTER_EXCEPTO_COMILLAS_O_BARRA_INVERTIDA   [^"\\]
CARACTER    {CUALQUIER_CARACTER_EXCEPTO_COMILLAS_O_BARRA_INVERTIDA}|{SECUENCIA_DE_ESCAPE}
SECUENCIA_DE_CARACTERES {CARACTER}+
/* LITERAL CADENA */
LITERAL_CADENA  \"{SECUENCIA_DE_CARACTERES}\"

%%
{ESPACIO_EN_BLANCO}|{TABULACION}    {;//ignora los espacios en blanco y las tabulaciones}
                                    {;}
%%
int main()
{
    return 0;
}