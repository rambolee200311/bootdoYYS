package com.bootdo.employee.service.impl;

import com.bootdo.employee.domain.EmploystatusDO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.bootdo.employee.dao.EmployeeDao;
import com.bootdo.employee.domain.EmployeeDO;
import com.bootdo.employee.service.EmployeeService;



@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	private EmployeeDao employeeDao;
	
	@Override
	public EmployeeDO get(Long id){
		return employeeDao.get(id);
	}

	@Override
	public EmployeeDO getParent(Long id){
		return employeeDao.getParent(id);
	}

	@Override
	public List<EmployeeDO> list(Map<String, Object> map){
		return employeeDao.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return employeeDao.count(map);
	}
	
	@Override
	public int save(EmployeeDO employee){
		return employeeDao.save(employee);
	}
	
	@Override
	public int update(EmployeeDO employee){
		return employeeDao.update(employee);
	}
	
	@Override
	public int remove(Long id){
		return employeeDao.remove(id);
	}
	
	@Override
	public int batchRemove(Long[] ids){
		return employeeDao.batchRemove(ids);
	}
	
}
