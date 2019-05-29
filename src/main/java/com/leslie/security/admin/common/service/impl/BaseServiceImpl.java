package com.leslie.security.admin.common.service.impl;

import com.leslie.security.admin.common.mapper.MyMapper;
import com.leslie.security.admin.common.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

public abstract  class BaseServiceImpl<T> implements BaseService<T> {

    @Autowired
    protected MyMapper<T> mapper;
    
    @Override
    public T selectByPrimaryKey(Object key) {
        return mapper.selectByPrimaryKey(key);
    }

    @Override
    public T selectOne(T t) {
        return mapper.selectOne(t);
    }

    @Override
    public List<T> selectAll() {
        return mapper.selectAll();
    }

    @Override
    public int selectCount(T t) {
        return mapper.selectCount(t);
    }

    @Override
    public List<T> select(T t) {
        return mapper.select(t);
    }

    @Override
    public int insert(T t) {
        return mapper.insert(t);
    }

    @Override
    public int insertSelective(T t) {
        return mapper.insertSelective(t);
    }

    @Override
    public int updateByPrimaryKey(T t) {
        return mapper.updateByPrimaryKey(t);
    }

    @Override
    public int updateByPrimaryKeySelective(T t) {
        return mapper.updateByPrimaryKeySelective(t);
    }

    @Override
    public int delete(T t) {
        return mapper.delete(t);
    }

    @Override
    public int deleteByPrimaryKey(Object key) {
        return mapper.deleteByPrimaryKey(key);
    }

    @Override
    public int selectCountByExample(Example example) {
        return mapper.selectCountByExample(example);
    }

    @Override
    public List<T> selectByExample(Example example) {
        return mapper.selectByExample(example);
    }

    @Override
    public int deleteByExample(Example example) {
        return mapper.deleteByExample(example);
    }

    @Override
    public int updateByExample(T t, Example example) {
        return mapper.updateByExample(t,example);
    }

    @Override
    public int updateByExampleSelective(T t, Example example) {
        return mapper.updateByExampleSelective(t,example);
    }

}
