package com.bootdo.relation.controller;
import com.bootdo.common.controller.BaseController;
import com.bootdo.common.utils.PageUtils;
import com.bootdo.common.utils.Query;
import com.bootdo.common.utils.R;
import com.bootdo.employee.domain.EmployeeDO;
import io.swagger.annotations.ApiOperation;
import org.apache.commons.collections.map.HashedMap;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.Date;
import java.util.List;
import java.util.Map;
import com.bootdo.relation.domain.RelationDO;
import com.bootdo.relation.service.RelationService;
import com.bootdo.employee.service.EmployeeService;
/**
 * 家属档案
 *
 * @author chglee
 * @email 932145579@qq.com
 * @date 2021-09-10 15:16:36
 */

@Controller
@RequestMapping("/relation/relation")
public class RelationController extends BaseController {
    @Autowired
    private RelationService relationService;
    @Autowired
    private EmployeeService employeeService;


    @GetMapping()
    @RequiresPermissions("relation:relation:relation")
    String Relation(){
        return "relation/relation";
    }

    @ResponseBody
    @GetMapping("/list")
    @RequiresPermissions("relation:relation:relation")
    public PageUtils list(@RequestParam Map<String, Object> params){
        //查询列表数据
        Query query = new Query(params);
        List<RelationDO> relationList = relationService.list(query);
        int total = relationService.count(query);
        PageUtils pageUtils = new PageUtils(relationList, total);
        return pageUtils;
    }
    @ApiOperation(value="获取员工列表", notes="")
    @ResponseBody
    @GetMapping("/listAll")
    @RequiresPermissions("relation:relation:relation")
    public List<RelationDO> listAll(@RequestParam Map<String, Object> params)
    {
		/*Map<String, Object> paramsMap=new HashMap<>();
		paramsMap.put("deptId",params.getString("deptId"));*/
        Query query = new Query(params);
        List<RelationDO> relationList = relationService.list(query);
        return relationList;
    }
    @GetMapping("/add")
    @RequiresPermissions("relation:relation:add")
    String add(Model model){
        List<EmployeeDO> employee=employeeService.list(new HashedMap(16));
        model.addAttribute("employee",employee);
        return "relation/add";
    }

    @GetMapping("/addrelation/{parentid}")
    @RequiresPermissions("relation:relation:add")
    String addrelation(@PathVariable("parentid") Long parentid,Model model){
        model.addAttribute("parentid",parentid);
        return "relation/relation/add";
    }

    @GetMapping("/edit/{id}")
    @RequiresPermissions("relation:relation:edit")
    String edit(@PathVariable("id") Long id,Model model){
        RelationDO relation = relationService.get(id);
        model.addAttribute("relation", relation);
        List<EmployeeDO> employee=employeeService.list(new HashedMap(16));
        model.addAttribute("employee",employee);
        return "relation/edit";
    }

    /**
     * 保存
     */
    @ResponseBody
    @PostMapping("/save")
    @RequiresPermissions("relation:relation:add")
    public R save( RelationDO relation){
        relation.setUserIdCreate(getUserId());
        Date date=new Date();
        relation.setGmtCreate(date);
        if(relationService.save(relation)>0){
            return R.ok();
        }
        return R.error();
    }
    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("relation:relation:edit")
    public R update( RelationDO relation){
        Date date=new Date();
        relation.setGmtModified(date);
        relationService.update(relation);
        return R.ok();
    }

    /**
     * 删除
     */
    @PostMapping( "/remove")
    @ResponseBody
    @RequiresPermissions("relation:relation:remove")
    public R remove( Long id){
        if(relationService.remove(id)>0){
            return R.ok();
        }
        return R.error();
    }

    /**
     * 删除
     */
    @PostMapping( "/batchRemove")
    @ResponseBody
    @RequiresPermissions("relation:relation:batchRemove")
    public R remove(@RequestParam("ids[]") Long[] ids){
        relationService.batchRemove(ids);
        return R.ok();
    }

    @GetMapping( "/getById/{id}")
    @ResponseBody
    public RelationDO getById(@PathVariable("id") Long id){
        RelationDO relation = relationService.get(id);
        return relation;
    }
    @GetMapping( "/getByParentId/{id}")
    @ResponseBody
    public RelationDO getByParentId(@PathVariable("id") Long id){
        RelationDO relation = relationService.getParent(id);
        return relation;
    }
}
