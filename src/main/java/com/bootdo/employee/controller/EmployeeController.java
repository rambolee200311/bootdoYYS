package com.bootdo.employee.controller;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.HashMap;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.bootdo.common.controller.BaseController;
import com.bootdo.employee.domain.EmploystatusDO;
import com.bootdo.employee.domain.EmploytypeDO;
import com.bootdo.employee.service.EmploystatusService;
import com.bootdo.system.domain.RoleDO;
import io.swagger.annotations.ApiOperation;
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
import com.bootdo.employee.service.EmploystatusService;
import com.bootdo.employee.service.EmploytypeService;
import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.Query;
import com.bootdo.common.utils.R;

/**
 * 员工档案
 * 
 * @author chglee
 * @email 932145579@qq.com
 * @date 2021-09-10 15:16:36
 */
 
@Controller
@RequestMapping("/employee/employee")
public class EmployeeController  extends BaseController {
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private EmploystatusService employStatusService;
	@Autowired
	private EmploytypeService employtypeService;
	@GetMapping()
	@RequiresPermissions("employee:employee:employee")
	String Employee(){
	    return "employee/employee/employee";
	}
	
	@ResponseBody
	@GetMapping("/list")
	@RequiresPermissions("employee:employee:employee")
	public PageUtils list(@RequestParam Map<String, Object> params){
		//查询列表数据
        Query query = new Query(params);
		List<EmployeeDO> employeeList = employeeService.list(query);
		int total = employeeService.count(query);
		PageUtils pageUtils = new PageUtils(employeeList, total);
		return pageUtils;
	}
	@ApiOperation(value="获取员工列表", notes="")
	@ResponseBody
	@GetMapping("/listAll")
	@RequiresPermissions("employee:employee:employee")
	public List<EmployeeDO> listAll(@RequestParam Map<String, Object> params)
	{
		/*Map<String, Object> paramsMap=new HashMap<>();
		paramsMap.put("deptId",params.getString("deptId"));*/
		Query query = new Query(params);
		List<EmployeeDO> employeeList = employeeService.list(query);
		return employeeList;
	}
	@GetMapping("/add/{parentid}")
	@RequiresPermissions("employee:employee:add")
	String add(@PathVariable("parentid") Long parentid,Model model){
		List<EmploystatusDO> employStatus = employStatusService.listAll();
		List<EmploytypeDO> employType=employtypeService.list(new HashedMap(16));
		model.addAttribute("employStatus", employStatus);
		model.addAttribute("employType", employType);
		model.addAttribute("parentid",parentid);
		return "employee/employee/add";
	}

	@GetMapping("/addrelation/{parentid}")
	@RequiresPermissions("employee:employee:add")
	String addrelation(@PathVariable("parentid") Long parentid,Model model){
		List<EmploystatusDO> employStatus = employStatusService.listAll();
		List<EmploytypeDO> employType=employtypeService.list(new HashedMap(16));
		model.addAttribute("employStatus", employStatus);
		model.addAttribute("employType", employType);
		model.addAttribute("parentid",parentid);
		return "employee/employee/add";
	}

	@GetMapping("/edit/{id}")
	@RequiresPermissions("employee:employee:edit")
	String edit(@PathVariable("id") Long id,Model model){
		EmployeeDO employee = employeeService.get(id);
		model.addAttribute("employee", employee);
		List<EmploystatusDO> employStatus = employStatusService.listAll();
		List<EmploytypeDO> employType=employtypeService.list(new HashedMap(16));
		model.addAttribute("employStatus", employStatus);
		model.addAttribute("employType", employType);
	    return "employee/employee/edit";
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@PostMapping("/save")
	@RequiresPermissions("employee:employee:add")
	public R save( EmployeeDO employee){
		employee.setUserIdCreate(getUserId());
		Date date=new Date();
		employee.setGmtCreate(date);
		if(employeeService.save(employee)>0){
			return R.ok();
		}
		return R.error();
	}
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("employee:employee:edit")
	public R update( EmployeeDO employee){
		Date date=new Date();
		employee.setGmtModified(date);
		employeeService.update(employee);
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/remove")
	@ResponseBody
	@RequiresPermissions("employee:employee:remove")
	public R remove( Long id){
		if(employeeService.remove(id)>0){
		return R.ok();
		}
		return R.error();
	}
	
	/**
	 * 删除
	 */
	@PostMapping( "/batchRemove")
	@ResponseBody
	@RequiresPermissions("employee:employee:batchRemove")
	public R remove(@RequestParam("ids[]") Long[] ids){
		employeeService.batchRemove(ids);
		return R.ok();
	}

	@GetMapping( "/getById/{id}")
	@ResponseBody
	public EmployeeDO getById(@PathVariable("id") Long id){
		EmployeeDO employee = employeeService.get(id);
		return employee;
	}
	@GetMapping( "/getByParentId/{id}")
	@ResponseBody
	public EmployeeDO getByParentId(@PathVariable("id") Long id){
		EmployeeDO employee = employeeService.getParent(id);
		return employee;
	}
}
