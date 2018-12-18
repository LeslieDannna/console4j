package com.leslie.security.admin.auth;

import com.leslie.security.admin.jwt.JwtTokenUtil;
import io.jsonwebtoken.Claims;
import org.springframework.security.authentication.AuthenticationDetailsSource;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author Leslie.Lam
 * @create 2018-12-08 21:24
 **/
public class AuthenticationTokenFilter extends OncePerRequestFilter {

    private AuthenticationDetailsSource ads = new WebAuthenticationDetailsSource();

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain) throws ServletException, IOException {
        String authHeader = request.getHeader(JwtTokenUtil.AUTH_HEADER);
        Claims claims = JwtTokenUtil.getClaimFromAuthHeader(authHeader);
        if (null!=claims){
            AuthUser user = new AuthUser();
            user.setId(claims.get("userId",Integer.class));
            user.setUserName(claims.getAudience());
            UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());
            token.setDetails(ads.buildDetails(request));
            SecurityContextHolder.getContext().setAuthentication(token);
        }
        chain.doFilter(request, response);
    }

}
