package com.leslie.security.admin.controller;

import com.alibaba.fastjson.JSONObject;
import com.leslie.security.admin.auth.AuthUser;
import com.leslie.security.admin.jwt.JwtTokenUtil;
import com.leslie.security.admin.model.SysUser;
import com.leslie.security.admin.service.SysUserService;
import com.leslie.security.admin.service.TestService;
import com.leslie.security.admin.utils.MyPage;
import com.leslie.security.admin.utils.WebUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * @author Leslie.Lam
 * @create 2018-12-09 15:26
 **/
@CrossOrigin
@RestController
@RequestMapping("auth")
public class AuthController {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Autowired
    private SysUserService sysUserService;

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    private TestService testService;

    @PostMapping("login")
    public String login(@RequestBody JSONObject object){
        String userName = object.getString("userName");
        String password = object.getString("password");
        Authentication authenticate = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(userName, password));
        return JwtTokenUtil.generateToken(AuthUser.class.cast(authenticate.getPrincipal()));
    }

    @GetMapping("menu")
    public Map<String,Object> getMenuNav(){
        return sysUserService.getMenuNav(AuthUser.class.cast(WebUtils.getCurrentUser()).getId());
    }

    @GetMapping(value = "/user/info")
    public AuthUser getCurrentUserInfo() {
        return  WebUtils.getCurrentUser();
    }

    @GetMapping("user/list")
    public MyPage.Info<SysUser> getSysUsers(){
        return MyPage.startPage(()->sysUserService.selectAll());
    }

    @GetMapping(value = "/user/{userId}")
    public SysUser getSysUser(@PathVariable("userId") Integer userId) {
        return sysUserService.selectByPrimaryKey(userId);
    }

    @PostMapping("user/edit")
    public void edit(@RequestBody SysUser user){
        String password = user.getPassword();
        if (StringUtils.isNotBlank(password)){
            user.setPassword(passwordEncoder.encode(password));
        }
        sysUserService.update(user);
    }

    @PostMapping("test")
    public void test(@RequestBody SysUser user){
//        testService.testRollback(user);
//        sysUserService.testRollback(user);
        try {
            int i = 1/0;
        } catch (Exception e) {
            logger.error("哎哟报错了！",e);
        }
    }
}
