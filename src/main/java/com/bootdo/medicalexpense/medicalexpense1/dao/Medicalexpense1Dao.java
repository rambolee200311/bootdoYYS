package com.bootdo.medicalexpense.medicalexpense1.dao;

import com.bootdo.medicalexpense.medicalexpense1.domain.Medicalexpense1DO;
import com.bootdo.medicalexpense.medicalexpense1.domain.MedicalexpenseInfoDO;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 医保人员录入信息
 * @author chglee
 * @email 932145579@qq.com
 * @date 2021-09-11 02:09:43
 */
@Mapper
public interface Medicalexpense1Dao {

	Medicalexpense1DO get(String id);
	
	List<Medicalexpense1DO> list(Map<String,Object> map);
	List<MedicalexpenseInfoDO> listinfo(Map<String,Object> map);
	int count(Map<String,Object> map);
	
	int save(Medicalexpense1DO medicalexpense1);
	
	int update(Medicalexpense1DO medicalexpense1);
	
	int remove(String id);
	
	int batchRemove(String[] ids);
}
