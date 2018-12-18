package com.leslie.security.admin.service.impl;

import com.leslie.security.admin.auth.Roles;
import com.leslie.security.admin.bean.Auth;
import com.leslie.security.admin.bean.Role;
import com.leslie.security.admin.bean.User;
import com.leslie.security.admin.common.service.impl.BaseServiceImpl;
import com.leslie.security.admin.enums.IsShow;
import com.leslie.security.admin.mapper.SysAuthMapper;
import com.leslie.security.admin.mapper.SysRoleMapper;
import com.leslie.security.admin.mapper.SysUserMapper;
import com.leslie.security.admin.model.SysAuth;
import com.leslie.security.admin.model.SysUser;
import com.leslie.security.admin.service.SysUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.weekend.Weekend;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @author Leslie.Lam
 * @create 2018-12-10 14:11
 **/
@Service
public class SysUserServiceImpl extends BaseServiceImpl<SysUser> implements SysUserService {

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SysRoleMapper sysRoleMapper;

    @Autowired
    private SysAuthMapper sysAuthMapper;

    @Override
    public User getUserByUserName(String userName) {
        Weekend<SysUser> weekend = Weekend.of(SysUser.class);
        weekend.weekendCriteria().andEqualTo(SysUser::getUserName,userName);
        List<SysUser> users = sysUserMapper.selectByExample(weekend);
        return users.isEmpty()?null: Optional.of(users.get(0)).map(e->{
            Integer id = e.getId();
            User user = new User();
            BeanUtils.copyProperties(e,user);
            if (SysUser.ADMIN_USER_ID.equals(id)){
                user.setRoles(Arrays.asList(new Role(Roles.ADMIN.name())));
                user.setAuths(sysAuthMapper.selectAll());
            }else {
                List<Role> roles = sysRoleMapper.getRolesByUserId(id);
                user.setRoles(roles);
                user.setAuths(roles.isEmpty()? Collections.EMPTY_LIST:sysAuthMapper.getAuthsByRoleIds(roles.stream().map(Role::getId).collect(Collectors.toList())));
            }
            return user;
        }).get();
    }

    @Override
    public Map<String, Object> getMenuNav(Integer userId) {
        Map<String, Object> result = new HashMap<>(2);
        List<? extends SysAuth> auths = SysUser.ADMIN_USER_ID.equals(userId)?sysAuthMapper.selectAll():sysAuthMapper.getAuthsByUserId(userId);
        result.put("menus",makeAuthTree(auths,true));
        result.put("permission", auths.stream().map(SysAuth::getPermission).collect(Collectors.toList()));
        return result;
    }

    /**
     * 构建权限树（即菜单树）
     * @param auths
     * @return
     */
    private List<Auth> makeAuthTree(List<? extends SysAuth> auths,boolean useShow){
        List<SysAuth> authsStore = new ArrayList<>(auths);
        List<Auth> tops = Collections.EMPTY_LIST;
        if (!auths.isEmpty()){
            // 顶级节点
            List<SysAuth> temps = authsStore.stream()
                    .filter(e -> Objects.equals(e.getParentId(), 0)&&(IsShow.YES.code.equals(e.getIsShow())||!useShow))
                    .collect(Collectors.toList());
            authsStore.removeAll(temps);
            tops = temps.stream().map(Auth::new).collect(Collectors.toList());
            tops.forEach(e->findChildren(e,authsStore,useShow));
        }
        return tops;
    }

    private List<Auth> findChildren(Auth parent,List<SysAuth> auths,boolean useShow){
        List<Auth> children = new ArrayList<>();
        for (Iterator<SysAuth> iterator=auths.iterator();iterator.hasNext();){
            SysAuth next = iterator.next();
            if (parent.getId().equals(next.getParentId())){
                if (IsShow.YES.code.equals(next.getIsShow())||!useShow){
                    children.add(new Auth(next));
                }
                iterator.remove();
            }
        }
        if (!children.isEmpty()){
            children.forEach(e->findChildren(e,auths,useShow));
            parent.setLeaf(false);
        }
        parent.setChildren(children);
        return children;
    }
}
