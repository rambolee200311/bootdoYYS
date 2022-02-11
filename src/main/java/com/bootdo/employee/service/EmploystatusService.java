package com.bootdo.employee.service;

import com.bootdo.employee.domain.EmploystatusDO;

import java.util.List;
import java.util.Map;

/**
 * 用工状态
 * 
 * @author chglee
 * @email 932145579@qq.com
 * @date 2021-09-09 11:37:06
 */
public interface EmploystatusService {
	
	EmploystatusDO get(Integer id);
	List<EmploystatusDO> listAll();
	List<EmploystatusDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(EmploystatusDO employstatus);
	
	int update(EmploystatusDO employstatus);
	
	int remove(Integer id);
	
	int batchRemove(Integer[] ids);
}
