package com.leslie.security.admin.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

/**
 * @author Leslie.Lam
 * @create 2018-12-17 14:41
 **/
@Component
public class AppContextHelper implements ApplicationContextAware {

    private static ApplicationContext cxt =null;

    @Override
    public void setApplicationContext(ApplicationContext context) throws BeansException {
        AppContextHelper.cxt =context;
    }

    public static <T> T getBean(Class<T> t){
        return cxt.getBean(t);
    }

    public static HttpServletRequest getRequest(){

        RequestAttributes ra = RequestContextHolder.getRequestAttributes();
        ServletRequestAttributes sra = (ServletRequestAttributes) ra;
        return sra.getRequest();
    }


}
