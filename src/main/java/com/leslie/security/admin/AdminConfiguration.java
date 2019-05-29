package com.leslie.security.admin;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Configuration;

//@EnableScheduling
@Configuration
@MapperScan(value = "com.leslie.security.admin.mapper")
public class AdminConfiguration {


}
