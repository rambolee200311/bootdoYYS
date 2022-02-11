package com.bootdo.employee.service;

import com.bootdo.employee.domain.EmploytypeDO;

import java.util.List;
import java.util.Map;

/**
 * 人员类别
 * 
 * @author chglee
 * @email 932145579@qq.com
 * @date 2021-09-09 21:25:36
 */
public interface EmploytypeService {
	
	EmploytypeDO get(Integer id);
	
	List<EmploytypeDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(EmploytypeDO employtype);
	
	int update(EmploytypeDO employtype);
	
	int remove(Integer id);
	
	int batchRemove(Integer[] ids);
}
