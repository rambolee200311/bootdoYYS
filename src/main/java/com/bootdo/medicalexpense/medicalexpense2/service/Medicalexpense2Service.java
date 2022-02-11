package com.bootdo.medicalexpense.medicalexpense2.service;

import java.util.List;
import java.util.Map;
import  com.bootdo.medicalexpense.medicalexpense2.domain.Medicalexpense2DO;
/**
 * 医保人员录入信息
 * 
 * @author chglee
 * @email 932145579@qq.com
 * @date 2021-09-11 02:09:43
 */
public interface Medicalexpense2Service {
	
	Medicalexpense2DO get(String id);
	
	List<Medicalexpense2DO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(Medicalexpense2DO medicalexpense1);
	
	int update(Medicalexpense2DO medicalexpense1);
	
	int remove(String id);
	
	int batchRemove(String[] ids);
}
