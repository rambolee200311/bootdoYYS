package com.bootdo.medicalexpense.closeexpense.service;
import java.util.List;
import java.util.Map;
import com.bootdo.medicalexpense.claimexpense.domain.ClaimexpenseDO;
import com.bootdo.medicalexpense.closeexpense.domain.CloseexpenseDO;
import com.bootdo.medicalexpense.closeexpense.domain.CloseexpenseSumDO;
public interface CloseexpenseService {
    List<CloseexpenseSumDO> list(Map<String, Object> map);
    int Save(CloseexpenseDO closeexpenseDO);
    int batchRemove(String[] ids);
    int count(Map<String, Object> map);
}
