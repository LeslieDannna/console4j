package com.leslie.security.admin.auth;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Leslie.Lam
 * @create 2018-12-09 14:30
 **/
public class UserAuthenticationEntryPoint implements AuthenticationEntryPoint {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Override
    public void commence(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, AuthenticationException e) throws IOException, ServletException {
        logger.error("Sorry Sir!There is a problem:{}",e.getMessage());
        httpServletResponse.sendError(401, e.getMessage());
    }
}
