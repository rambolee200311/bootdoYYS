package com.bootdo.medicalexpense.medicalexpense2.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bootdo.medicalexpense.medicalexpense2.service.Medicalexpense2Service;
import com.bootdo.medicalexpense.medicalexpense2.domain.Medicalexpense2DO;
import com.bootdo.medicalexpense.medicalexpense2.dao.Medicalexpense2Dao;
import java.util.List;
import java.util.Map;


@Service
public class Medicalexpense2ServiceImpl implements Medicalexpense2Service {
	@Autowired
	private Medicalexpense2Dao medicalexpense2Dao;
	
	@Override
	public Medicalexpense2DO get(String id){
		return medicalexpense2Dao.get(id);
	}
	
	@Override
	public List<Medicalexpense2DO> list(Map<String, Object> map){
		return medicalexpense2Dao.list(map);
	}
	
	@Override
	public int count(Map<String, Object> map){
		return medicalexpense2Dao.count(map);
	}
	
	@Override
	public int save(Medicalexpense2DO medicalexpense1){

		return medicalexpense2Dao.save(medicalexpense1);
	}
	
	@Override
	public int update(Medicalexpense2DO medicalexpense1){
		return medicalexpense2Dao.update(medicalexpense1);
	}
	
	@Override
	public int remove(String id){
		return medicalexpense2Dao.remove(id);
	}
	
	@Override
	public int batchRemove(String[] ids){
		return medicalexpense2Dao.batchRemove(ids);
	}
	
}
