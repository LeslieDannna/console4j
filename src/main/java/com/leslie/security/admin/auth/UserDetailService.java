package com.leslie.security.admin.auth;

import com.leslie.security.admin.bean.User;
import com.leslie.security.admin.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

/**
 * @author Leslie.Lam
 * @create 2018-12-10 13:12
 **/
@Component
public class UserDetailService implements UserDetailsService {

    @Autowired
    private SysUserService sysUserService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = sysUserService.getUserByUserName(username);
        Assert.notNull(user,"unknown userName");
        return AuthUserFactory.create(user);
    }
}
