package com.bootdo.medicalexpense.testexpense.dao;
import com.bootdo.employee.domain.EmployeeDO;
import org.apache.ibatis.annotations.Mapper;
import com.bootdo.medicalexpense.testexpense.domain.TestExpense;
import java.util.List;
import java.util.Map;
@Mapper
public interface TestExpenseDao {
    int save(List<TestExpense>  testExpense);
    EmployeeDO getEmployee(Map<String, Object> map);
}
