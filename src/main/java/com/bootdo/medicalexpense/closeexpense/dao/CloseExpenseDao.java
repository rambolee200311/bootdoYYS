package com.bootdo.medicalexpense.closeexpense.dao;
import com.bootdo.medicalexpense.claimexpense.domain.ClaimexpenseDO;
import com.bootdo.medicalexpense.closeexpense.domain.CloseexpenseDO;
import com.bootdo.medicalexpense.closeexpense.domain.CloseexpenseSumDO;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;
@Mapper
public interface CloseExpenseDao {
    List<ClaimexpenseDO> listClaim(Map<String, Object> map);
    List<CloseexpenseSumDO> list(Map<String, Object> map);
    double getHistoryClaimexpenseSum(Map<String, Object> map);
    double getHistoryCloseexpenseSum(Map<String, Object> map);
    int Save(CloseexpenseDO closeexpenseDO);
    int batchRemove(String[] ids);
    int delOldCloseExpense(Map<String,Object> map);
    int count(Map<String,Object> map);
}
