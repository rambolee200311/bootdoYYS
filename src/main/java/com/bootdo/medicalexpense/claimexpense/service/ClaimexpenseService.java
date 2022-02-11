package com.bootdo.medicalexpense.claimexpense.service;

import com.bootdo.medicalexpense.claimexpense.domain.ClaimexpenseDO;
import com.bootdo.medicalexpense.claimexpense.domain.MonthEnd;
import java.util.List;
import java.util.Map;

/**
 * 计算报销金额
 * 
 * @author chglee
 * @email 932145579@qq.com
 * @date 2021-10-09 18:15:59
 */
public interface ClaimexpenseService {
	
	ClaimexpenseDO get(String id);
	
	List<ClaimexpenseDO> list(Map<String, Object> map);
	
	int count(Map<String, Object> map);
	
	int save(ClaimexpenseDO claimexpense);
	
	int update(ClaimexpenseDO claimexpense);
	
	int remove(String id);
	
	int batchRemove(String[] ids);

	MonthEnd getMonthEnd();
}
