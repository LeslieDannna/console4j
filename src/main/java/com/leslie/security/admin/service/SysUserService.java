package com.leslie.security.admin.service;


import com.leslie.security.admin.bean.User;
import com.leslie.security.admin.common.service.BaseService;
import com.leslie.security.admin.model.SysUser;

import java.util.Map;

/**
 * @author Leslie.Lam
 * @create 2018-12-10 14:10
 **/
public interface SysUserService extends BaseService<SysUser>{

    User getUserByUserName(String userName);

    Map<String,Object> getMenuNav(Integer userId);
}
