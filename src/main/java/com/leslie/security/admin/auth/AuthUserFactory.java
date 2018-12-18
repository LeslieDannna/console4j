package com.leslie.security.admin.auth;

import com.leslie.security.admin.bean.Role;
import com.leslie.security.admin.bean.User;
import com.leslie.security.admin.enums.Enable;
import com.leslie.security.admin.model.SysAuth;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.util.List;
import java.util.stream.Collectors;

public final class AuthUserFactory {

    private AuthUserFactory() {
    }

    /**
     * Create auth user.
     *
     * @param user the user
     * @return the auth user
     */
    public static AuthUser create(User user) {
        AuthUser authUser = new AuthUser();
        BeanUtils.copyProperties(user,authUser);
        authUser.setEnabled(Enable.YES.code.equals(user.getEnabled()));
        authUser.setAuthorities(mapToGrantedAuthorities(user.getRoles(), user.getAuths()));
        return authUser;
    }

    /**
     * 权限转换
     * @return 权限列表
     */
    private static List<SimpleGrantedAuthority> mapToGrantedAuthorities(List<Role> roles, List<? extends SysAuth> auths) {
        List<SimpleGrantedAuthority> authorities =
                roles.stream().filter(role -> Enable.YES.code.equals(role.getEnabled()))
                .map(sysRole -> new SimpleGrantedAuthority(AuthUser.ROLE_PREFIX+sysRole.getCode())).collect(Collectors.toList());

        // 添加基于Permission的权限信息
        auths.stream().filter(auth -> StringUtils.isNotBlank(auth.getPermission())).forEach(auth -> {
            // 添加基于Permission的权限信息
            authorities.add(new SimpleGrantedAuthority(auth.getPermission()));
        });

        return authorities;
    }

}
