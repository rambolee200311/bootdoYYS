package com.bootdo.employee.controller;

import java.util.List;
import java.util.Map;

import com.bootdo.employee.domain.EmploytypeDO;
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

import com.bootdo.employee.domain.EmploystatusDO;
import com.bootdo.employee.service.EmploystatusService;
import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.Query;
import com.bootdo.common.utils.R;

/**
 * 用工状态
 * 
 * @author chglee
 * @email 932145579@qq.com
 * @date 2021-09-09 11:37:06
 */
 
@Controller
@RequestMapping("/employee/employstatus")
public class EmploystatusController {
	@Autowired
	private EmploystatusService employstatusService;
	
	@GetMapping()
	@RequiresPermissions("employee:employstatus:employstatus")
	String Employstatus(){
	    return "employee/employstatus/employstatus";
	}
	
	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("employee:employstatus:employstatus")
	public PageUtils list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);
		List<EmploystatusDO> employstatusList = employstatusService.list(query);
		int total = employstatusService.count(query);
		PageUtils pageUtils = new PageUtils(employstatusList, total);
		return pageUtils;
	}
	
	@GetMapping("/add")
	@RequiresPermissions("employee:employstatus:add")
	String add(){
	    return "employee/employstatus/add";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("employee:employstatus:edit")
	String edit(@PathVariable("id") Integer id,Model model){
		EmploystatusDO employstatus = employstatusService.get(id);
		model.addAttribute("employstatus", employstatus);
	    return "employee/employstatus/edit";
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("employee:employstatus:add")
	public R save( EmploystatusDO employstatus){
			if (employstatusService.save(employstatus) > 0) {
				//employstatusService.save(employstatus);
				return R.ok();
			}
			return R.error();
	}
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("employee:employstatus:edit")
	public R update( EmploystatusDO employstatus){
		employstatusService.update(employstatus);
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/remove")
	@ResponseBody
	@RequiresPermissions("employee:employstatus:remove")
	public R remove( Integer id){
		if(employstatusService.remove(id)>0){
		return R.ok();
		}
		return R.error();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/batchRemove")
	@ResponseBody
	@RequiresPermissions("employee:employstatus:batchRemove")
	public R remove(@RequestParam("ids[]") Integer[] ids){
		employstatusService.batchRemove(ids);
		return R.ok();
	}
	@GetMapping("/getById/{id}")
	@ResponseBody
	EmploystatusDO getById(@PathVariable("id") Integer id){
		EmploystatusDO employtype = employstatusService.get(id);
		return employtype;
	}
}
