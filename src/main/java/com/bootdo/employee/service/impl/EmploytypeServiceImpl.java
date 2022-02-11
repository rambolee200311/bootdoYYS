package com.bootdo.employee.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.bootdo.employee.dao.EmploytypeDao;
import com.bootdo.employee.domain.EmploytypeDO;
import com.bootdo.employee.service.EmploytypeService;



@Service
public class EmploytypeServiceImpl implements EmploytypeService {
	@Autowired
	private EmploytypeDao employtypeDao;
	
	@Override
	public EmploytypeDO get(Integer id){
		return employtypeDao.get(id);
	}
	
	@Override
	public List<EmploytypeDO> list(Map<String, Object> map){
		return employtypeDao.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return employtypeDao.count(map);
	}
	
	@Override
	public int save(EmploytypeDO employtype){
		return employtypeDao.save(employtype);
	}
	
	@Override
	public int update(EmploytypeDO employtype){
		return employtypeDao.update(employtype);
	}
	
	@Override
	public int remove(Integer id){
		return employtypeDao.remove(id);
	}
	
	@Override
	public int batchRemove(Integer[] ids){
		return employtypeDao.batchRemove(ids);
	}
	
}
