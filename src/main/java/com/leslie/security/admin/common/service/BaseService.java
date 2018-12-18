package com.leslie.security.admin.common.service;

import tk.mybatis.mapper.entity.Example;

import java.util.List;

public interface BaseService<T> {

    /**
     * 根据主键查询记录
     * @param key
     * @return
     */
	T selectByPrimaryKey(Object key);

    /**
     * 根据条件查询一套记录
     * @param t
     * @return
     */
    T selectOne(T t);

    /**
     * 查询单表所有记录
     * @return
     */
    List<T> selectAll();

    /**
     * 根据条件查询多条记录
     * @param t
     * @return
     */
    List<T> select(T t);

    /**
     * 根据条件查询总数
     * @param t
     * @return
     */
    int selectCount(T t);

    /**
     * 插入一条记录(不判空)
     * @param record
     * @return
     */
    int insert(T record);

    /**
     * 插入一条记录(判空)
     * @param t
     * @return
     */
    int insertSelective(T t);

    /**
     * 根据主键更新记录(不判空)
     * @param t
     * @return
     */
    int updateByPrimaryKey(T t);

    /**
     * 根据主键更新记录(判空)
     * @param t
     * @return
     */
    int updateByPrimaryKeySelective(T t);

    /**
     * 根据条件删除记录
     * @param t
     * @return
     */
    int delete(T t);

    /**
     * 根据主键删除记录
     * @param key
     * @return
     */
    int deleteByPrimaryKey(Object key);

    List<T> selectByExample(Example example);

    int selectCountByExample(Example example);

    int deleteByExample(Example example);

    int updateByExample(T t, Example example);

    int updateByExampleSelective(T t, Example example);

}
