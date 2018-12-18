package com.leslie.security.admin.model;

import java.util.Date;

/**
 * @author Leslie.Lam
 * @create 2018-12-10 14:22
 **/
public class BaseModel {

    private Date createTime;

    private Date opTime;

    private Byte isDel;

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getOpTime() {
        return opTime;
    }

    public void setOpTime(Date opTime) {
        this.opTime = opTime;
    }

    public Byte getIsDel() {
        return isDel;
    }

    public void setIsDel(Byte isDel) {
        this.isDel = isDel;
    }
}
