package com.bootdo.employee.controller;

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

import com.bootdo.employee.domain.EmploytypeDO;
import com.bootdo.employee.service.EmploytypeService;
import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.Query;
import com.bootdo.common.utils.R;

/**
 * 人员类别
 * 
 * @author chglee
 * @email 932145579@qq.com
 * @date 2021-09-09 21:25:36
 */
 
@Controller
@RequestMapping("/employee/employtype")
public class EmploytypeController {
	@Autowired
	private EmploytypeService employtypeService;
	
	@GetMapping()
	@RequiresPermissions("employee:employtype:employtype")
	String Employtype(){
	    return "employee/employtype/employtype";
	}
	
	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("employee:employtype:employtype")
	public PageUtils list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);
		List<EmploytypeDO> employtypeList = employtypeService.list(query);
		int total = employtypeService.count(query);
		PageUtils pageUtils = new PageUtils(employtypeList, total);
		return pageUtils;
	}
	
	@GetMapping("/add")
	@RequiresPermissions("employee:employtype:add")
	String add(){
	    return "employee/employtype/add";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("employee:employtype:edit")
	String edit(@PathVariable("id") Integer id,Model model){
		EmploytypeDO employtype = employtypeService.get(id);
		model.addAttribute("employtype", employtype);
	    return "employee/employtype/edit";
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("employee:employtype:add")
	public R save( EmploytypeDO employtype){
		if(employtypeService.save(employtype)>0){
			return R.ok();
		}
		return R.error();
	}
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("employee:employtype:edit")
	public R update( EmploytypeDO employtype){
		employtypeService.update(employtype);
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/remove")
	@ResponseBody
	@RequiresPermissions("employee:employtype:remove")
	public R remove( Integer id){
		if(employtypeService.remove(id)>0){
		return R.ok();
		}
		return R.error();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/batchRemove")
	@ResponseBody
	@RequiresPermissions("employee:employtype:batchRemove")
	public R remove(@RequestParam("ids[]") Integer[] ids){
		employtypeService.batchRemove(ids);
		return R.ok();
	}
	@GetMapping("/getById/{id}")
	@ResponseBody
	EmploytypeDO getById(@PathVariable("id") Integer id){
		EmploytypeDO employtype = employtypeService.get(id);
		return employtype;
	}

}
