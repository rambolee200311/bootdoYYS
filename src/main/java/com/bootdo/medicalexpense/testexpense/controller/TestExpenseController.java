package com.bootdo.medicalexpense.testexpense.controller;
import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.Query;
import com.bootdo.common.utils.R;
import com.bootdo.employee.domain.EmployeeDO;
import com.bootdo.employee.service.EmployeeService;
import com.bootdo.medicalexpense.medicalexpense1.domain.Medicalexpense1DO;
import com.bootdo.medicalexpense.testexpense.domain.TestExpense;
import com.bootdo.medicalexpense.testexpense.service.TestExpenseService;
import org.apache.commons.collections.map.HashedMap;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/medicalexpense/testexpense")
public class TestExpenseController {
    @Autowired
    private TestExpenseService testExpenseService;
    @GetMapping()
    @RequiresPermissions("medicalexpense:testexpense:testexpense")
    String TestExpense(){
        return "medicalexpense/testexpense/testexpense";
    }
    @ResponseBody
    @PostMapping("/list")
    @RequiresPermissions("medicalexpense:testexpense:testexpense")
    public List<TestExpense> list(@RequestParam("file") MultipartFile file){
        List<TestExpense> testExpenseList = testExpenseService.list(file);
        return testExpenseList;
    }
    @ResponseBody
    @PostMapping("/save")
    //@RequiresPermissions("medicalexpense:testexpense:add")
    //public R save(@RequestParam(value="testExpense[]") List<TestExpense>  testExpense){
    public R save(@RequestBody List<TestExpense>  testExpense){
        if(testExpenseService.save(testExpense)>0){
            return R.ok();
        }
        return R.error();
    }

}
