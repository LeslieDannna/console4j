package com.leslie.security.admin.fn;

import com.leslie.security.admin.auth.AuthUser;
import tk.mybatis.mapper.weekend.reflection.ReflectionOperationException;

import java.beans.Introspector;
import java.io.Serializable;
import java.lang.invoke.SerializedLambda;
import java.lang.reflect.Method;
import java.util.function.Function;
import java.util.regex.Pattern;

//import tk.mybatis.mapper.weekend.reflection.ReflectionOperationException;

/**
 * @author Leslie.Lam
 * @create 2019-04-16 11:57
 **/
public class FnTest {
    public static void main(String[] args) {
        String name = new FnTest().getName(AuthUser::getAuthorities);
        System.out.println(name);
    }
    private <A, B>  String getName(Fn<A, B> fn) {
        return FnReflections.fnToFieldName(fn);
    }

    public interface Fn<T, R> extends Function<T, R>, Serializable {
    }
    public static class FnReflections {
        private static final Pattern GET_PATTERN = Pattern.compile("^get[A-Z].*");
        private static final Pattern IS_PATTERN = Pattern.compile("^is[A-Z].*");
        public static String fnToFieldName(Function fn) {
            try {
                Method method = fn.getClass().getDeclaredMethod("writeReplace");
                method.setAccessible(Boolean.TRUE);
                SerializedLambda serializedLambda = (SerializedLambda)method.invoke(fn);
                String getter = serializedLambda.getImplMethodName();
                if (GET_PATTERN.matcher(getter).matches()) {
                    getter = getter.substring(3);
                } else if (IS_PATTERN.matcher(getter).matches()) {
                    getter = getter.substring(2);
                }
                return Introspector.decapitalize(getter);
            } catch (ReflectiveOperationException var4) {
                throw new ReflectionOperationException(var4);
            }
        }

    }
}
