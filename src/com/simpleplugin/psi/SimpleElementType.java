package com.simpleplugin.psi;

import com.intellij.psi.tree.IElementType;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import com.simpleplugin.SimpleLanguage;

/**
 * Created by linxiang on 15/4/7.
 */
public class SimpleElementType extends IElementType {
    public SimpleElementType(@NotNull @NonNls String debugName) {
        super(debugName, SimpleLanguage.INSTANCE);
    }
}
