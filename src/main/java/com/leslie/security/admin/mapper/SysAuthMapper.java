package com.leslie.security.admin.mapper;

import com.leslie.security.admin.bean.Auth;
import com.leslie.security.admin.common.mapper.MyMapper;
import com.leslie.security.admin.model.SysAuth;

import java.util.List;

/**
 * @author Leslie.Lam
 * @create 2018-12-10 14:31
 **/
public interface SysAuthMapper extends MyMapper<SysAuth> {

    /**
     * 根据roleIds查询用户权限（菜单）
     * @param roleIds
     * @return
     */
    List<Auth> getAuthsByRoleIds(List<Integer> roleIds);

    /**
     * 根据userId查询用户权限（菜单）
     * @param userId
     * @return
     */
    List<Auth> getAuthsByUserId(Integer userId);
}
