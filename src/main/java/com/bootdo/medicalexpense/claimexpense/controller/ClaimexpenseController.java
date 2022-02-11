package com.bootdo.medicalexpense.claimexpense.controller;

import java.util.List;
import java.util.Map;

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

import com.bootdo.medicalexpense.claimexpense.domain.ClaimexpenseDO;
import com.bootdo.medicalexpense.claimexpense.domain.MonthEnd;
import com.bootdo.medicalexpense.claimexpense.service.ClaimexpenseService;
import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.Query;
import com.bootdo.common.utils.R;

/**
 * 计算报销金额
 * 
 * @author chglee
 * @email 932145579@qq.com
 * @date 2021-10-09 18:15:59
 */
 
@Controller
@RequestMapping("/medicalexpense/claimexpense")
public class ClaimexpenseController {
	@Autowired
	private ClaimexpenseService claimexpenseService;
	
	@GetMapping()
	@RequiresPermissions("medicalexpense:claimexpense:claimexpense")
	String Claimexpense(){
		return "medicalexpense/claimexpense/claimexpense";
	}
	
	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("medicalexpense:claimexpense:claimexpense")
	public PageUtils list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);
		List<ClaimexpenseDO> claimexpenseList = claimexpenseService.list(query);
		int total = claimexpenseService.count(query);
		PageUtils pageUtils = new PageUtils(claimexpenseList, total);
		return pageUtils;
	}
	
	@GetMapping("/add")
	@RequiresPermissions("medicalexpense:claimexpense:add")
	String add(){
	    return "medicalexpense/claimexpense/add";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("medicalexpense:claimexpense:edit")
	String edit(@PathVariable("id") String id,Model model){
		ClaimexpenseDO claimexpense = claimexpenseService.get(id);
		model.addAttribute("claimexpense", claimexpense);
	    return "medicalexpense/claimexpense/edit";
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("medicalexpense:claimexpense:add")
	public R save( ClaimexpenseDO claimexpense){
		if(claimexpenseService.save(claimexpense)>0){
			return R.ok();
		}
		return R.error();
	}
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("medicalexpense:claimexpense:edit")
	public R update( ClaimexpenseDO claimexpense){
		claimexpenseService.update(claimexpense);
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/remove")
	@ResponseBody
	@RequiresPermissions("medicalexpense:claimexpense:remove")
	public R remove( String id){
		if(claimexpenseService.remove(id)>0){
		return R.ok();
		}
		return R.error();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/batchRemove")
	@ResponseBody
	@RequiresPermissions("medicalexpense:claimexpense:batchRemove")
	public R remove(@RequestParam("ids[]") String[] ids){
		claimexpenseService.batchRemove(ids);
		return R.ok();
	}
	@GetMapping( "/getMonthEnd")
	@ResponseBody
	@RequiresPermissions("medicalexpense:claimexpense:claimexpense")
	public MonthEnd getMonthEnd(){
		return claimexpenseService.getMonthEnd();
	}
}
