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
OR = "|"
PLUS = "+"

%state WAITING_VALUE

%%

{END_OF_LINE_COMMENT}                           { return SimpleTypes.COMMENT; }

{STRING}                                        { return SimpleTypes.STRING; }

{SEPARATOR}                                     { return SimpleTypes.SEPARATOR; }

{OR}                                            { return SimpleTypes.OR;}

{PLUS}                                          { return SimpleTypes.PLUS;}

{CRLF}                                          { return SimpleTypes.CRLF; }

{WHITE_SPACE}+                                  { return TokenType.WHITE_SPACE; }

.                                               { return TokenType.BAD_CHARACTER; }
