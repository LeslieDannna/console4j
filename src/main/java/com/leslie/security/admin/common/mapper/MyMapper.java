package com.leslie.security.admin.common.mapper;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

/**
 * @author Leslie.Lam
 * @create 2018-12-12 12:00
 **/
public interface MyMapper<T> extends Mapper<T>,MySqlMapper<T> {
}
