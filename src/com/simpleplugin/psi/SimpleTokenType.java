package com.simpleplugin.psi;

import com.intellij.psi.tree.IElementType;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import com.simpleplugin.SimpleLanguage;

/**
 * Created by linxiang on 15/4/7.
 */
public class SimpleTokenType extends IElementType {
    public SimpleTokenType(@NotNull @NonNls String debugName) {
        super(debugName, SimpleLanguage.INSTANCE);
    }

    @Override
    public String toString() {
        return "SimpleTokenType." + super.toString();
    }
}
