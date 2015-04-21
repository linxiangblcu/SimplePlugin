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
STRING = [:letter:]*
RULE = [:letter:]*
OR = "|"
PLUS = "+"


%state EXPRESSION

%%

<YYINITIAL> {END_OF_LINE_COMMENT}               { yybegin(YYINITIAL); return SimpleTypes.COMMENT; }

<YYINITIAL> {RULE}                              { yybegin(YYINITIAL); return SimpleTypes.RULE; }

<YYINITIAL> {SEPARATOR}                         { yybegin(EXPRESSION); return SimpleTypes.SEPARATOR; }

<EXPRESSION>{CRLF}                              { yybegin(YYINITIAL); return SimpleTypes.CRLF; }

<EXPRESSION> {WHITE_SPACE}+                     { yybegin(EXPRESSION); return TokenType.WHITE_SPACE; }

<EXPRESSION> {STRING}                           { yybegin(EXPRESSION); return SimpleTypes.STRING; }

<EXPRESSION>{OR}                                { yybegin(EXPRESSION); return SimpleTypes.OR;}

<EXPRESSION>{PLUS}                              { yybegin(EXPRESSION); return SimpleTypes.PLUS;}

{CRLF}                                          { yybegin(YYINITIAL); return SimpleTypes.CRLF; }

{WHITE_SPACE}+                                  { return TokenType.WHITE_SPACE; }

.                                               { return TokenType.BAD_CHARACTER; }
