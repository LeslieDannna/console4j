package com.leslie.security.admin.service.impl;

import com.leslie.security.admin.model.SysUser;
import com.leslie.security.admin.service.SysUserService;
import com.leslie.security.admin.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author Leslie.Lam
 * @create 2019-05-01 12:45
 **/
@Service
public class TestServiceImpl implements TestService {

    @Autowired
    private SysUserService sysUserService;

    @Override
//    @Transactional(rollbackFor = Exception.class)
    public void testRollback(SysUser user) {
        sysUserService.update(user);

    }
}
