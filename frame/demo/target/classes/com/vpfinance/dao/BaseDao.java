package com.vpfinance.dao;


import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.vpfinance.mybatis.annotion.SearchOperator;
import org.apache.ibatis.annotations.*;

import com.vpfinance.mybatis.util.SQLProvider;

import java.util.List;
import java.util.Map;


/**
 * MyBatis CRUD基接口
 *
 * @param <T> 处理的POJO对象
 * @author
 */
public interface BaseDao<T> {

    /**
     * 添加语句从CUDTemplate类中生成
     *
     * @param t
     */
//	@SelectKey(statement="select @@IDENTITY ",keyProperty="id", before=true, resultType=Long.class)
    @SelectKey(statement = "select last_insert_id() as id", keyProperty = "id", before = false, resultType = Long.class)
    @InsertProvider(type = SQLProvider.class, method = "insert")
    public int insert(T t);

    /**
     * Update语句从CUDTemplate类中生成
     *
     * @param t
     */
    @UpdateProvider(type = SQLProvider.class, method = "update")
    public int update(T t);

    /**
     * Delete语句从CUDTemplate类中生成
     *
     * @param t
     */
    @DeleteProvider(type = SQLProvider.class, method = "deleteById")
    public int deleteById(T t);

    @DeleteProvider(type = SQLProvider.class, method = "delete")
    public int delete(T t);


	/**
	 * get语句从CUDTemplate类中生成
	 * @param t
	 */
	@SelectProvider(type = SQLProvider.class,method = "get")
	public T get(T t);

	/**
	 * selectList语句从CUDTemplate类中生成
	 * @param t
	 */
	@SelectProvider(type = SQLProvider.class,method = "getAll")
	public List<T> getAll(T t, PageBounds row);

	@SelectProvider(type = SQLProvider.class,method = "getAllBy")
	public List<T> getAllBy(T t, Map<String,SearchOperator> options, PageBounds row);

}
