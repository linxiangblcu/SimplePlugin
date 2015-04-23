package com.simpleplugin;

import com.intellij.lexer.FlexLexer;
import com.intellij.psi.tree.IElementType;
import com.simpleplugin.psi.SimpleTypes;
import com.intellij.psi.TokenType;

%%

%class SimpleLexer
%implements FlexLexer
%unicode
%function advance
%type IElementType
%eof{  return;
%eof}

CRLF= \n|\r|\r\n
WHITE_SPACE=[\ \t\f]

END_OF_LINE_COMMENT=("#"|"!")[^\r\n]*

SEPARATOR= "="
FEATURE = [:letter:]*
RULE = [:letter:]*
ONEWORD = [:letter:]*
ONESTEM = [:letter:]*

OR = "|"
PLUS = "+"
LCURLY = "{"
RCURLY = "}"
SINGLEQUOTATION = "'"
DOUBLEQUOTATION = "\""
NOT = "!"

%state EXPRESSION
%state WORD
%state STEM
%state FEATURE

%%

<YYINITIAL> {END_OF_LINE_COMMENT}               { yybegin(YYINITIAL); return SimpleTypes.COMMENT; }

<YYINITIAL> {RULE}                              { yybegin(YYINITIAL); return SimpleTypes.RULE; }

<YYINITIAL> {SEPARATOR}                         { yybegin(EXPRESSION); return SimpleTypes.SEPARATOR; }

<EXPRESSION>{SINGLEQUOTATION}                   { yybegin(STEM); return SimpleTypes.SINGLEQUOTATION;}

<STEM>{SINGLEQUOTATION}                         { yybegin(EXPRESSION); return SimpleTypes.SINGLEQUOTATION;}

<EXPRESSION>{DOUBLEQUOTATION}                   { yybegin(WORD); return SimpleTypes.DOUBLEQUOTATION;}

<WORD>{DOUBLEQUOTATION}                        { yybegin(EXPRESSION); return SimpleTypes.DOUBLEQUOTATION;}

<EXPRESSION> {FEATURE}                          { yybegin(EXPRESSION); return SimpleTypes.FEATURE; }

<STEM> {ONESTEM}                                { yybegin(STEM); return SimpleTypes.ONESTEM; }

<WORD> {ONEWORD}                               { yybegin(WORD); return SimpleTypes.ONEWORD; }

//<EXPRESSION>{OR}                                { yybegin(EXPRESSION); return SimpleTypes.OR;}

//<EXPRESSION>{PLUS}                              { yybegin(EXPRESSION); return SimpleTypes.PLUS;}

<EXPRESSION>{LCURLY}                            { yybegin(EXPRESSION); return SimpleTypes.LCURLY;}

<EXPRESSION>{RCURLY}                            { yybegin(EXPRESSION); return SimpleTypes.RCURLY;}

//<EXPRESSION>{NOT}                               { yybegin(EXPRESSION); return SimpleTypes.NOT;}

//<EXPRESSION>{CRLF}                              { yybegin(YYINITIAL); return SimpleTypes.CRLF; }

<EXPRESSION> {WHITE_SPACE}+                     { yybegin(EXPRESSION); return TokenType.WHITE_SPACE; }

{CRLF}                                          { yybegin(YYINITIAL); return SimpleTypes.CRLF; }

{WHITE_SPACE}+                                  { return TokenType.WHITE_SPACE; }

{OR}                                            { return SimpleTypes.OR;}

{PLUS}                                          { return SimpleTypes.PLUS;}

{NOT}                                           { return SimpleTypes.NOT;}

.                                               { return TokenType.BAD_CHARACTER; }


