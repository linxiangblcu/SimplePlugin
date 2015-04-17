package com.simpleplugin;

import com.intellij.lexer.FlexAdapter;

import java.io.Reader;

/**
 * Created by linxiang on 15/4/16.
 */
public class SimpleLexerAdapter extends FlexAdapter {
    public SimpleLexerAdapter() {
        super(new SimpleLexer((Reader) null));
    }
}
