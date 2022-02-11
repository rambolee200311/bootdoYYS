package com.bootdo.medicalexpense.claimexpense.dao;

import com.bootdo.medicalexpense.claimexpense.domain.ClaimexpenseDO;
import com.bootdo.medicalexpense.medicalexpense1.domain.Medicalexpense1DO;
import com.bootdo.medicalexpense.claimexpense.domain.RegulationDO;
import com.bootdo.medicalexpense.claimexpense.domain.MonthEnd;
import com.bootdo.employee.domain.EmployeeDO;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 计算报销金额
 * @author chglee
 * @email 932145579@qq.com
 * @date 2021-10-09 18:15:59
 */
@Mapper
public interface ClaimexpenseDao {

	ClaimexpenseDO get(String id);
	
	List<ClaimexpenseDO> list(Map<String,Object> map);

	List<Medicalexpense1DO> listExpense(Map<String,Object> map);

	int count(Map<String,Object> map);
	
	int save(ClaimexpenseDO claimexpense);
	
	int update(ClaimexpenseDO claimexpense);
	
	int remove(String id);
	
	int batchRemove(String[] ids);
	String getUdate(Map<String,Object> map);
	String getLdate(Map<String,Object> map);
	EmployeeDO getEmployee(int id);
	String getEmployeeStatus(int id);
	String getEmployeeType(int id);
	Double getzf1(Map<String,Object> map);
	Double getzf2(Map<String,Object> map);
	Double getzf3(Map<String,Object> map);
	int delOldClaimExpense(Map<String,Object> map);
	RegulationDO getRegulation1(int age);
	RegulationDO getRegulation2(int age);
	double getSumzf3(Map<String,Object> map);
	double getSumClaimzf3(Map<String,Object> map);
	int getMonthEndyear();
	int getMonthEndmonth(int year);
}
