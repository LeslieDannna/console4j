package com.leslie.security.admin.mapper;

import com.leslie.security.admin.bean.Role;
import com.leslie.security.admin.common.mapper.MyMapper;
import com.leslie.security.admin.model.SysRole;

import java.util.List;

/**
 * @author Leslie.Lam
 * @create 2018-12-10 14:30
 **/
public interface SysRoleMapper extends MyMapper<SysRole> {

    /**
     * 根据userId and isDel 查询用户角色
     * @param userId
     * @return
     */
    List<Role> getRolesByUserId(Integer userId);

}
