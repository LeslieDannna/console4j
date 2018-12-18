package com.leslie.security.admin.bean;

import com.leslie.security.admin.model.SysAuth;
import org.springframework.beans.BeanUtils;

import java.util.List;

/**
 * @author Leslie.Lam
 * @create 2018-12-10 13:50
 **/
public class Auth extends SysAuth{

    private Boolean leaf = true;
    private List<Auth> children;

    public Auth() {
    }

    public Auth(SysAuth auth) {
        BeanUtils.copyProperties(auth,this);
    }

    public Boolean getLeaf() {
        return leaf;
    }

    public void setLeaf(Boolean leaf) {
        this.leaf = leaf;
    }

    public List<Auth> getChildren() {
        return children;
    }

    public void setChildren(List<Auth> children) {
        this.children = children;
    }
}
