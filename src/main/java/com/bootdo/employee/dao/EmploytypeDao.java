package com.bootdo.employee.dao;

import com.bootdo.employee.domain.EmploytypeDO;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 人员类别
 * @author chglee
 * @email 932145579@qq.com
 * @date 2021-09-09 21:25:36
 */
@Mapper
public interface EmploytypeDao {

	EmploytypeDO get(Integer id);
	
	List<EmploytypeDO> list(Map<String,Object> map);
	
	int count(Map<String,Object> map);
	
	int save(EmploytypeDO employtype);
	
	int update(EmploytypeDO employtype);
	
	int remove(Integer id);
	
	int batchRemove(Integer[] ids);
}
