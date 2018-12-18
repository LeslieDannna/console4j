package com.leslie.security.admin.auth;

import org.springframework.security.core.GrantedAuthority;

/**
 * @author Leslie.Lam
 * @create 2018-12-16 19:34
 **/
public enum Roles implements GrantedAuthority {
    ADMIN,USER
    ;


    @Override
    public String getAuthority() {
        return AuthUser.ROLE_PREFIX+name();
    }
}
