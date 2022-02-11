package com.bootdo.employee.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.bootdo.employee.dao.EmploystatusDao;
import com.bootdo.employee.domain.EmploystatusDO;
import com.bootdo.employee.service.EmploystatusService;



@Service
public class EmploystatusServiceImpl implements EmploystatusService {
	@Autowired
	private EmploystatusDao employstatusDao;
	
	@Override
	public EmploystatusDO get(Integer id){
		return employstatusDao.get(id);
	}
	@Override
	public List<EmploystatusDO> listAll(){
		return employstatusDao.listAll();
	}
	@Override
	public List<EmploystatusDO> list(Map<String, Object> map){
		return employstatusDao.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return employstatusDao.count(map);
	}
	
	@Override
	public int save(EmploystatusDO employstatus){
		return employstatusDao.save(employstatus);
	}
	
	@Override
	public int update(EmploystatusDO employstatus){
		return employstatusDao.update(employstatus);
	}
	
	@Override
	public int remove(Integer id){
		return employstatusDao.remove(id);
	}
	
	@Override
	public int batchRemove(Integer[] ids){
		return employstatusDao.batchRemove(ids);
	}
	
}
