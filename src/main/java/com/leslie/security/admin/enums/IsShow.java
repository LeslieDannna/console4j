package com.leslie.security.admin.enums;

/**
 * @author Leslie.Lam
 * @create 2018-12-12 13:41
 **/
public enum IsShow {

    YES((byte)1,"是"),NO((byte)0,"否")
    ;

    IsShow(Byte code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public final Byte code;

    public final String desc;

}
