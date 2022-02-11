package com.bootdo.medicalexpense.medicalexpense1.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.bootdo.medicalexpense.medicalexpense1.dao.Medicalexpense1Dao;
import com.bootdo.medicalexpense.medicalexpense1.domain.Medicalexpense1DO;
import com.bootdo.medicalexpense.medicalexpense1.service.Medicalexpense1Service;
import com.bootdo.medicalexpense.medicalexpense1.domain.MedicalexpenseInfoDO;


@Service
public class Medicalexpense1ServiceImpl implements Medicalexpense1Service {
	@Autowired
	private Medicalexpense1Dao medicalexpense1Dao;
	
	@Override
	public Medicalexpense1DO get(String id){
		return medicalexpense1Dao.get(id);
	}
	
	@Override
	public List<Medicalexpense1DO> list(Map<String, Object> map){
		return medicalexpense1Dao.list(map);
	}
	@Override
	public List<MedicalexpenseInfoDO> listinfo(Map<String, Object> map){
		return medicalexpense1Dao.listinfo(map);
	}
	@Override
	public int count(Map<String, Object> map){
		return medicalexpense1Dao.count(map);
	}
	
	@Override
	public int save(Medicalexpense1DO medicalexpense1){

		return medicalexpense1Dao.save(medicalexpense1);
	}
	
	@Override
	public int update(Medicalexpense1DO medicalexpense1){
		return medicalexpense1Dao.update(medicalexpense1);
	}
	
	@Override
	public int remove(String id){
		return medicalexpense1Dao.remove(id);
	}
	
	@Override
	public int batchRemove(String[] ids){
		return medicalexpense1Dao.batchRemove(ids);
	}
	
}
