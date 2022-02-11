package com.bootdo.medicalexpense.closeexpense.service.impl;
import com.bootdo.employee.domain.EmployeeDO;
import com.bootdo.medicalexpense.claimexpense.dao.ClaimexpenseDao;
import com.bootdo.medicalexpense.closeexpense.service.CloseexpenseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;
import java.math.BigDecimal;
import com.bootdo.medicalexpense.claimexpense.domain.ClaimexpenseDO;
import com.bootdo.medicalexpense.closeexpense.dao.CloseExpenseDao;
import com.bootdo.medicalexpense.closeexpense.domain.CloseexpenseDO;
import com.bootdo.medicalexpense.closeexpense.domain.CloseexpenseSumDO;
@Service
public class CloseexpenseServiceImpl implements CloseexpenseService {
    @Autowired
    private CloseExpenseDao closeExpenseDao;
    @Autowired
    private ClaimexpenseDao claimexpenseDao;
    @Override
    public List<CloseexpenseSumDO> list(Map<String, Object> map){
        List<CloseexpenseSumDO> listCloseexpenseSumDO=new ArrayList<CloseexpenseSumDO>();
        //1、删除旧数据
        closeExpenseDao.delOldCloseExpense(map);
        // 2、list 本月报销计算
        List<ClaimexpenseDO> listClaimexpenseDO=closeExpenseDao.listClaim(map);
        //3、按人 sum 截止本月报销计算
        //3、在职一般员工，sum 截止本月报销计算<300,closeamount=0//其他人员 closeamount=amount
        for(ClaimexpenseDO claimexpenseDO:listClaimexpenseDO){
            Map<String,Object> map2=new HashMap<String,Object>();
            map2.put("year",Integer.parseInt(map.get("year").toString()));
            map2.put("month",Integer.parseInt(map.get("month").toString()));
            map2.put("employeeid",claimexpenseDO.getEmployeeid());
            double dSum=closeExpenseDao.getHistoryClaimexpenseSum(map2);
            double dSumClose=closeExpenseDao.getHistoryCloseexpenseSum(map2);
            //人员信息
            EmployeeDO employeeDO=claimexpenseDao.getEmployee(
                    claimexpenseDO.getEmployeeid()
            );
            //如果非一般在职
            if (!((employeeDO.getEmploystatusId()==1)&&(employeeDO.getEmploytypeId()==1))) {
                CloseexpenseDO closeexpenseDO = new CloseexpenseDO();
                closeexpenseDO.setEmployeeid(claimexpenseDO.getEmployeeid());
                closeexpenseDO.setEmploystatusid(employeeDO.getEmploystatusId().intValue());
                closeexpenseDO.setEmploytypeid(employeeDO.getEmploytypeId().intValue());
                closeexpenseDO.setClaimamount3(claimexpenseDO.getClaimamount3());
                closeexpenseDO.setClaimamount10(claimexpenseDO.getClaimamount10());
                closeexpenseDO.setClaimamount22(claimexpenseDO.getClaimamount22());
                closeexpenseDO.setYear(Integer.parseInt(map.get("year").toString()));
                closeexpenseDO.setMonth(Integer.parseInt(map.get("month").toString()));
                //如果家属取第一家长
                if(employeeDO.getParentid()!=0){
                    closeexpenseDO.setCloseemployeeid(employeeDO.getParentid());
                }else{
                    closeexpenseDO.setCloseemployeeid(claimexpenseDO.getEmployeeid());
                }
                closeexpenseDO.setId(claimexpenseDO.getId());
                BigDecimal b = new BigDecimal(claimexpenseDO.getClaimamount3()+claimexpenseDO.getClaimamount10()+claimexpenseDO.getClaimamount22());
                closeexpenseDO.setCloseamount(b.setScale(2,BigDecimal.ROUND_HALF_UP).doubleValue());
                closeExpenseDao.Save(closeexpenseDO);
            }else {
                //在职一般员工-300
                if ((dSum > 300)) {
                    CloseexpenseDO closeexpenseDO = new CloseexpenseDO();
                    closeexpenseDO.setEmployeeid(claimexpenseDO.getEmployeeid());
                    closeexpenseDO.setEmploystatusid(employeeDO.getEmploystatusId().intValue());
                    closeexpenseDO.setEmploytypeid(employeeDO.getEmploytypeId().intValue());
                    closeexpenseDO.setClaimamount3(claimexpenseDO.getClaimamount3());
                    closeexpenseDO.setClaimamount10(claimexpenseDO.getClaimamount10());
                    closeexpenseDO.setClaimamount22(claimexpenseDO.getClaimamount22());
                    closeexpenseDO.setYear(Integer.parseInt(map.get("year").toString()));
                    closeexpenseDO.setMonth(Integer.parseInt(map.get("month").toString()));
                    closeexpenseDO.setCloseemployeeid(claimexpenseDO.getEmployeeid());
                    closeexpenseDO.setId(claimexpenseDO.getId());
                    //BigDecimal b = new BigDecimal(claimexpenseDO.getClaimamount3() + claimexpenseDO.getClaimamount10() + claimexpenseDO.getClaimamount22());
                    BigDecimal b = new BigDecimal(dSum-300-dSumClose);
                    closeexpenseDO.setCloseamount(b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue());
                    closeExpenseDao.Save(closeexpenseDO);
                }
            }
        }
        //4、get按收款人SUM
        listCloseexpenseSumDO=closeExpenseDao.list(map);
        return listCloseexpenseSumDO;
    }
    @Override
    public  int Save(CloseexpenseDO closeexpenseDO){
       return closeExpenseDao.Save(closeexpenseDO);
    }
    @Override
    public int batchRemove(String[] ids){
        int iResult=0;
        return iResult;
    }
    @Override
    public int count(Map<String, Object> map){
        return closeExpenseDao.count(map);
    }
}
