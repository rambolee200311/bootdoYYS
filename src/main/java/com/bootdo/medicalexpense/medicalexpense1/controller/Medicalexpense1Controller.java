package com.bootdo.medicalexpense.medicalexpense1.controller;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
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

import com.bootdo.employee.domain.EmployeeDO;
import com.bootdo.employee.service.EmployeeService;
import com.bootdo.medicalexpense.medicalexpense1.domain.Medicalexpense1DO;
import com.bootdo.medicalexpense.medicalexpense1.domain.MedicalexpenseInfoDO;
import com.bootdo.medicalexpense.medicalexpense1.service.Medicalexpense1Service;
import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.Query;
import com.bootdo.common.utils.R;

/**
 * 医保人员录入信息
 * 
 * @author chglee
 * @email 932145579@qq.com
 * @date 2021-09-11 02:09:43
 */
 
@Controller
@RequestMapping("/medicalexpense/medicalexpense1")
public class Medicalexpense1Controller {
	@Autowired
	private Medicalexpense1Service medicalexpense1Service;
	@Autowired
	private EmployeeService employeeService;
	@GetMapping("")
	@RequiresPermissions("medicalexpense:medicalexpense1:medicalexpense1")
	String Medicalexpense1(){
	    return "medicalexpense/medicalexpense1/medicalexpense1";
	}
	
	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("medicalexpense:medicalexpense1:medicalexpense1")
	public PageUtils list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);
		List<Medicalexpense1DO> medicalexpense1List = medicalexpense1Service.list(query);
		int total = medicalexpense1Service.count(query);
		PageUtils pageUtils = new PageUtils(medicalexpense1List, total);
		return pageUtils;
	}
	@ResponseBody
	@GetMapping("/listinfo")
	@RequiresPermissions("medicalexpense:medicalexpense1:medicalexpense1")
	public PageUtils listinfo(@RequestParam Map<String, Object> params){
		//查询列表数据
		Query query = new Query(params);
		List<MedicalexpenseInfoDO> medicalexpenseInfoList = medicalexpense1Service.listinfo(query);
		int total = medicalexpense1Service.count(query);
		PageUtils pageUtils = new PageUtils(medicalexpenseInfoList, total);
		return pageUtils;
	}
	@GetMapping("/add")
	@RequiresPermissions("medicalexpense:medicalexpense1:add")
	String add(Model modle){
	    List<EmployeeDO> employee=employeeService.list(new HashedMap(16));
		modle.addAttribute("employee",employee);
		return "medicalexpense/medicalexpense1/add";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("medicalexpense:medicalexpense1:edit")
	String edit(@PathVariable("id") String id,Model model){
		Medicalexpense1DO medicalexpense1 = medicalexpense1Service.get(id);
		model.addAttribute("medicalexpense1", medicalexpense1);
	    return "medicalexpense/medicalexpense1/edit";
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("medicalexpense:medicalexpense1:add")
	public R save( Medicalexpense1DO medicalexpense1){
		if(medicalexpense1Service.save(medicalexpense1)>0){
			return R.ok();
		}
		return R.error();
	}
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("medicalexpense:medicalexpense1:edit")
	public R update( Medicalexpense1DO medicalexpense1){
		medicalexpense1Service.update(medicalexpense1);
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/remove")
	@ResponseBody
	@RequiresPermissions("medicalexpense:medicalexpense1:remove")
	public R remove( String id){
		if(medicalexpense1Service.remove(id)>0){
		return R.ok();
		}
		return R.error();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/batchRemove")
	@ResponseBody
	@RequiresPermissions("medicalexpense:medicalexpense1:remove")
	public R remove(@RequestParam("ids[]") String[] ids){
		medicalexpense1Service.batchRemove(ids);
		return R.ok();
	}
	
}
