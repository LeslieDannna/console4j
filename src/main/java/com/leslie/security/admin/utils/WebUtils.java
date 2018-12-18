package com.leslie.security.admin.utils;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

/**
 * @author Leslie.Lam
 * @create 2018-12-12 14:32
 **/
public class WebUtils {

    public static <T extends UserDetails> T getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return (T) authentication.getPrincipal();
    }

}
