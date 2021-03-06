package com.simpleplugin;

import com.intellij.lexer.FlexAdapter;
import com.intellij.lexer.Lexer;
import com.intellij.openapi.editor.DefaultLanguageHighlighterColors;
import com.intellij.openapi.editor.colors.TextAttributesKey;
import com.intellij.openapi.editor.markup.TextAttributes;
import com.intellij.openapi.fileTypes.SyntaxHighlighterBase;
import com.intellij.psi.TokenType;
import com.intellij.psi.tree.IElementType;
import com.simpleplugin.psi.SimpleTypes;
import org.jetbrains.annotations.NotNull;

import java.awt.*;
import java.io.Reader;

import static com.intellij.openapi.editor.colors.TextAttributesKey.createTextAttributesKey;

public class SimpleSyntaxHighlighter extends SyntaxHighlighterBase {
    public static final TextAttributesKey SEPARATOR = createTextAttributesKey("SIMPLE_SEPARATOR",
        DefaultLanguageHighlighterColors.IDENTIFIER);

    public static final TextAttributesKey RULE = createTextAttributesKey("SIMPLE_RULE", DefaultLanguageHighlighterColors.KEYWORD);

    public static final TextAttributesKey FEATURE = createTextAttributesKey("SIMPLE_FEATURE", DefaultLanguageHighlighterColors.STRING);

    public static final TextAttributesKey word = createTextAttributesKey("SIMPLE_word", DefaultLanguageHighlighterColors.LABEL);

    public static final TextAttributesKey stem = createTextAttributesKey("SIMPLE_stem", DefaultLanguageHighlighterColors.LABEL);

    public static final TextAttributesKey COMMENT = createTextAttributesKey("SIMPLE_COMMENT", DefaultLanguageHighlighterColors.LINE_COMMENT);

    static final TextAttributesKey BAD_CHARACTER = createTextAttributesKey("SIMPLE_BAD_CHARACTER",
        new TextAttributes(Color.RED, null, null, null, Font.BOLD));


    private static final TextAttributesKey[] SEPARATOR_KEYS = new TextAttributesKey[]{SEPARATOR};

    private static final TextAttributesKey[] KEY_FEATURE = new TextAttributesKey[]{FEATURE};

    private static final TextAttributesKey[] KEY_RULE = new TextAttributesKey[]{RULE};

    private static final TextAttributesKey[] KEY_WORD = new TextAttributesKey[]{word};

    private static final TextAttributesKey[] KEY_STEM = new TextAttributesKey[]{stem};

    private static final TextAttributesKey[] COMMENT_KEYS = new TextAttributesKey[]{COMMENT};

    private static final TextAttributesKey[] EMPTY_KEYS = new TextAttributesKey[0];

    private static final TextAttributesKey[] BAD_CHAR_KEYS = new TextAttributesKey[]{BAD_CHARACTER};

    @NotNull
    @Override
    public Lexer getHighlightingLexer() {
        return new FlexAdapter(new SimpleLexer((Reader) null));
    }

    @NotNull
    @Override
    public TextAttributesKey[] getTokenHighlights(IElementType tokenType) {
        if (tokenType.equals(SimpleTypes.SEPARATOR)) {
            return SEPARATOR_KEYS;
        } else if (tokenType.equals(SimpleTypes.FEATURE)) {
            return KEY_FEATURE;
        } else if (tokenType.equals(SimpleTypes.RULE)) {
            return KEY_RULE;
        }else if (tokenType.equals(SimpleTypes.ONEWORD)) {
            return KEY_WORD;
        }else if (tokenType.equals(SimpleTypes.ONESTEM)) {
            return KEY_STEM;
        }else if (tokenType.equals(SimpleTypes.COMMENT)) {
            return COMMENT_KEYS;
        } else if (tokenType.equals(TokenType.BAD_CHARACTER)) {
            return BAD_CHAR_KEYS;
        } else {
            return EMPTY_KEYS;
        }
    }
}
