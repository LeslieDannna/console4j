package com.leslie.security.admin.bean;

import com.leslie.security.admin.model.SysAuth;
import com.leslie.security.admin.model.SysUser;

import java.util.List;

/**
 * @author Leslie.Lam
 * @create 2018-12-10 13:50
 **/
public class User extends SysUser {

    private List<Role> roles;
    private List<? extends SysAuth> auths;

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public List<? extends SysAuth> getAuths() {
        return auths;
    }

    public void setAuths(List<? extends SysAuth> auths) {
        this.auths = auths;
    }
}
