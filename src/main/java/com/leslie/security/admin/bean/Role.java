package com.leslie.security.admin.bean;

import com.leslie.security.admin.model.SysRole;

import java.util.List;

/**
 * @author Leslie.Lam
 * @create 2018-12-10 13:50
 **/
public class Role extends SysRole {

    private List<Auth> auths;

    public Role() {
    }

    public Role(String code) {
        setCode(code);
    }

    public List<Auth> getAuths() {
        return auths;
    }

    public void setAuths(List<Auth> auths) {
        this.auths = auths;
    }

}
