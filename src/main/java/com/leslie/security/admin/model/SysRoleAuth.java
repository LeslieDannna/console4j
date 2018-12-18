package com.leslie.security.admin.model;

import javax.persistence.Table;

/**
 * @author Leslie.Lam
 * @create 2018-12-12 11:17
 **/
@Table(name = "sys_user_role")
public class SysRoleAuth {

    private Integer authId;

    private Integer roleId;

    private Byte isDel;

    public Integer getAuthId() {
        return authId;
    }

    public void setAuthId(Integer authId) {
        this.authId = authId;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public Byte getIsDel() {
        return isDel;
    }

    public void setIsDel(Byte isDel) {
        this.isDel = isDel;
    }
}
