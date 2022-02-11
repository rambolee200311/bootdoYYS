package com.bootdo.medicalexpense.closeexpense.controller;

import java.util.List;
import java.util.Map;

import com.bootdo.medicalexpense.claimexpense.domain.ClaimexpenseDO;
import com.bootdo.medicalexpense.claimexpense.service.ClaimexpenseService;
import com.bootdo.medicalexpense.closeexpense.domain.CloseexpenseSumDO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bootdo.medicalexpense.closeexpense.domain.CloseexpenseDO;
import com.bootdo.medicalexpense.claimexpense.domain.MonthEnd;
import com.bootdo.medicalexpense.closeexpense.service.CloseexpenseService;
import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.Query;
import com.bootdo.common.utils.R;

@Controller
@RequestMapping("/medicalexpense/closeexpense")
public class CloseexpenseController {
    @Autowired
    private CloseexpenseService closeexpenseService;

    @GetMapping()
    @RequiresPermissions("medicalexpense:closeexpense:closeexpense")
    String Closeexpense(){
        return "medicalexpense/closeexpense/closeexpense";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("medicalexpense:closeexpense:closeexpense")
    public PageUtils list(@RequestParam Map<String, Object> params){
        //查询列表数据
        Query query = new Query(params);
        List<CloseexpenseSumDO> claimexpenseList = closeexpenseService.list(query);
        int total = closeexpenseService.count(query);
        PageUtils pageUtils = new PageUtils(claimexpenseList, total);
        return pageUtils;
    }
}
