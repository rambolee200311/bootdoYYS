package com.bootdo.medicalexpense.MonthEnd.controller;
import com.bootdo.common.utils.R;
import org.springframework.ui.Model;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.bootdo.medicalexpense.MonthEnd.service.MonthEndService;
import com.bootdo.medicalexpense.MonthEnd.domain.MonthEndDO;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/medicalexpense/monthend")
public class MonthEndController {
    @Autowired
    private MonthEndService monthEndService;
    @GetMapping("")
    @RequiresPermissions("medicalexpense:monthend:monthend")
    String MonthEnd(Model model){
        MonthEndDO lastMonthEndDO=monthEndService.getLast();
        MonthEndDO nextMonthEndDO=monthEndService.getNext();
        model.addAttribute("lastMonthEndDO",lastMonthEndDO);
        model.addAttribute("nextMonthEndDO",nextMonthEndDO);
        return "medicalexpense/monthend/monthend";
    }
    @ResponseBody
    @PostMapping("/close")
    @RequiresPermissions("medicalexpense:monthend:close")
    public R close(MonthEndDO monthEndDO){
        if(monthEndService.closeMonthEnd(monthEndDO)>0){
            return R.ok();
        }else{
            return R.error();
        }
    }
    @ResponseBody
    @PostMapping("/open")
    @RequiresPermissions("medicalexpense:monthend:open")
    public R open(MonthEndDO monthEndDO){
        if(monthEndService.openMonthEnd(monthEndDO)>0){
            return R.ok();
        }else{
            return R.error();
        }
    }
}
