package com.bootdo.employee.service;

import com.bootdo.employee.domain.EmployeeDO;

import java.util.List;
import java.util.Map;

/**
 * 员工档案
 * 
 * @author chglee
 * @email 932145579@qq.com
 * @date 2021-09-10 15:16:36
 */
public interface EmployeeService {
	
	EmployeeDO get(Long id);
	EmployeeDO getParent(Long id);
	List<EmployeeDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(EmployeeDO employee);
	
	int update(EmployeeDO employee);
	
	int remove(Long id);
	
	int batchRemove(Long[] ids);
}
