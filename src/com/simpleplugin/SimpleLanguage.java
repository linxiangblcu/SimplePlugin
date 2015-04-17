/**
 * Created by linxiang on 15/4/3.
 */
package com.simpleplugin;

import com.intellij.lang.Language;


public class SimpleLanguage extends Language {
    public static final SimpleLanguage INSTANCE = new SimpleLanguage();

    private SimpleLanguage() {
        super("Simple");
    }
}
