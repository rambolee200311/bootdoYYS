package com.bootdo.medicalexpense.medicalexpense2.controller;

import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.Query;
import com.bootdo.common.utils.R;
import com.bootdo.employee.domain.EmployeeDO;
import com.bootdo.employee.service.EmployeeService;
import com.bootdo.relation.domain.RelationDO;
import com.bootdo.relation.service.RelationService;
import com.bootdo.medicalexpense.medicalexpense2.domain.Medicalexpense2DO;
import com.bootdo.medicalexpense.medicalexpense2.service.Medicalexpense2Service;
import org.apache.commons.collections.map.HashedMap;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 医保人员录入信息
 * 
 * @author chglee
 * @email 932145579@qq.com
 * @date 2021-09-11 02:09:43
 */
 
@Controller
@RequestMapping("/medicalexpense/medicalexpense2")
public class Medicalexpense2Controller {
	@Autowired
	private Medicalexpense2Service medicalexpense2Service;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private RelationService relationService;
	@GetMapping()
	@RequiresPermissions("medicalexpense:medicalexpense2:medicalexpense2")
	String medicalexpense2(){
	    return "medicalexpense/medicalexpense2/medicalexpense2";
	}
	
	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("medicalexpense:medicalexpense2:medicalexpense2")
	public PageUtils list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);
		List<Medicalexpense2DO> medicalexpense2List = medicalexpense2Service.list(query);
		int total = medicalexpense2Service.count(query);
		PageUtils pageUtils = new PageUtils(medicalexpense2List, total);
		return pageUtils;
	}
	
	@GetMapping("/add")
	@RequiresPermissions("medicalexpense:medicalexpense2:add")
	String add(Model modle){
	    //List<EmployeeDO> employee=employeeService.list(new HashedMap(16));
		List<RelationDO> employee=relationService.list(new HashedMap(16));
		modle.addAttribute("employee",employee);
		return "medicalexpense/medicalexpense2/add";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("medicalexpense:medicalexpense2:edit")
	String edit(@PathVariable("id") String id,Model model){
		Medicalexpense2DO medicalexpense2 = medicalexpense2Service.get(id);
		model.addAttribute("medicalexpense2", medicalexpense2);
	    return "medicalexpense/medicalexpense2/edit";
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("medicalexpense:medicalexpense2:add")
	public R save( Medicalexpense2DO medicalexpense2){
		if(medicalexpense2Service.save(medicalexpense2)>0){
			return R.ok();
		}
		return R.error();
	}
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("medicalexpense:medicalexpense2:edit")
	public R update( Medicalexpense2DO medicalexpense2){
		medicalexpense2Service.update(medicalexpense2);
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/remove")
	@ResponseBody
	@RequiresPermissions("medicalexpense:medicalexpense2:remove")
	public R remove( String id){
		if(medicalexpense2Service.remove(id)>0){
		return R.ok();
		}
		return R.error();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/batchRemove")
	@ResponseBody
	@RequiresPermissions("medicalexpense:medicalexpense2:batchRemove")
	public R remove(@RequestParam("ids[]") String[] ids){
		medicalexpense2Service.batchRemove(ids);
		return R.ok();
	}
	
}
