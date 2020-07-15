package com.ruoyi.web.controller.system;

import java.util.Arrays;
import java.util.List;

import com.ruoyi.common.core.domain.Ztree;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.service.IBizAreaWaterService;
import com.ruoyi.system.service.IBizScopeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.service.IBizWaterWorkService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 水厂 信息操作处理
 * 
 * @author ruoyi
 * @date 2020-02-24
 */
@Controller
@RequestMapping("/system/bizWaterWork")
public class BizWaterWorkController extends BaseController
{
    private String prefix = "system/bizWaterWork";
	
	@Autowired
	private IBizWaterWorkService bizWaterWorkService;
	@Autowired
	private IBizScopeService bizScopeService;
	@Autowired
	private IBizAreaWaterService bizAreaWaterService;

	@RequiresPermissions("system:bizWaterWork:view")
	@GetMapping()
	public String bizWaterWork(ModelMap mmap)
	{
		long worksId = ShiroUtils.getSysUser().getWorksId();
		BizWaterWork work = bizWaterWorkService.selectBizWaterWorkById(worksId);
		long parentId = work.getParentId();
		mmap.put("rootIdValue",parentId);
	    return prefix + "/bizWaterWork";
	}
	
	/**
	 * 查询水厂列表
	 */
	@RequiresPermissions("system:bizWaterWork:list")
	@GetMapping("/list")
	@ResponseBody
	public List<BizWaterWork> list(BizWaterWork bizWaterWork)
	{
        List<BizWaterWork> list = bizWaterWorkService.selectBizWaterWorkList(bizWaterWork);
		return list;
	}
	
	
	/**
	 * 导出水厂列表
	 */
	@RequiresPermissions("system:bizWaterWork:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BizWaterWork bizWaterWork)
    {
    	List<BizWaterWork> list = bizWaterWorkService.selectBizWaterWorkList(bizWaterWork);
        ExcelUtil<BizWaterWork> util = new ExcelUtil<BizWaterWork>(BizWaterWork.class);
        return util.exportExcel(list, "bizWaterWork");
    }
	
	/**
	 * 新增水厂
	 */
	@GetMapping("/add/{parentId}")
	public String add(@PathVariable("parentId") Long parentId, ModelMap mmap)
	{
		mmap.put("WaterWork", bizWaterWorkService.selectBizWaterWorkById(parentId));
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存水厂
	 */
	@RequiresPermissions("system:bizWaterWork:add")
	@Log(title = "新增水厂", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(BizWaterWork bizWaterWork)
	{
		bizWaterWork.setCreateBy(ShiroUtils.getLoginName());
		return toAjax(bizWaterWorkService.insertBizWaterWork(bizWaterWork));
	}

	/**
	 * 修改水厂
	 */
	@GetMapping("/edit/{worksId}")
	public String edit(@PathVariable("worksId") Long worksId, ModelMap mmap)
	{
		BizWaterWork bizWaterWork = bizWaterWorkService.selectBizWaterWorkById(worksId);
		mmap.put("bizWaterWork", bizWaterWork);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存水厂
	 */
	@RequiresPermissions("system:bizWaterWork:edit")
	@Log(title = "修改水厂", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(BizWaterWork bizWaterWork)
	{		
		return toAjax(bizWaterWorkService.updateBizWaterWork(bizWaterWork));
	}
	
	/**
	 * 删除水厂
	 */
	@RequiresPermissions("system:bizWaterWork:remove")
	@Log(title = "删除水厂", businessType = BusinessType.DELETE)
	@GetMapping( "/remove/{worksId}")
	@ResponseBody
	public AjaxResult remove(@PathVariable("worksId") Long worksId)
	{
		return toAjax(bizWaterWorkService.deleteBizWaterWorkByIds(worksId+""));
	}


	/**
	 * 加载水厂列表树
	 */
	@GetMapping("/treeData")
	@ResponseBody
	public List<Ztree> treeData()
	{
		List<Ztree> ztrees = bizWaterWorkService.selectWorksTree(new BizWaterWork());
		return ztrees;
	}

	/**
	 * 加载区域水厂列表树
	 */
	@GetMapping("/areaTreeData/{areaId}")
	@ResponseBody
	public List<Ztree> areaTreeData(@PathVariable("areaId") Long areaId)
	{
		List<Ztree> ztrees = bizWaterWorkService.selectAreaWaterTree(areaId);
		return ztrees;
	}

	/**
	 * 选择水厂树
	 */
	@GetMapping("/selectWorksTree/{worksId}")
	public String selectDeptTree(@PathVariable("worksId") Long worksId, ModelMap mmap)
	{
		mmap.put("WaterWork", bizWaterWorkService.selectBizWaterWorkById(worksId));
		return prefix + "/tree";
	}

	/**
	 * 分配水厂树
	 */
	@GetMapping("/assignWorksTree/{worksId}")
	public String assignWorksTree(@PathVariable("worksId") Long worksId, ModelMap mmap)
	{
		mmap.put("WaterWork", bizWaterWorkService.selectBizWaterWorkById(worksId));
		List<Long> areaWater = bizAreaWaterService.selectAreaWaterByArea(worksId);
		String waterIds = StringUtils.join(areaWater.toArray(), ",");
		mmap.put("waterIds",waterIds);
		return prefix + "/workTree";
	}

	/**
	 * 插入区域水厂数
	 */
	@PostMapping("/batchAreaWater")
	@ResponseBody
	public AjaxResult batchAreaWater(Long areaId, String waterIds, ModelMap mmap)
	{
		return toAjax(bizAreaWaterService.batchInsertBizAreaWater(areaId,waterIds));
	}


	/**
	 * 加载角色部门（数据权限）列表树
	 */
	@GetMapping("/roleWorkTreeData")
	@ResponseBody
	public List<Ztree> workTreeData(SysRole role)
	{
		SysUser user = ShiroUtils.getSysUser();
		List<Ztree> ztrees = bizWaterWorkService.roleWorkTreeData(role,user);
		return ztrees;
	}



	/**
	 *新增化验范围
	 */
	@GetMapping("/addScope/{worksId}")
	public String addScope(@PathVariable("worksId") Long worksId, ModelMap mmap)
	{
		BizScope bizScope = bizScopeService.selectBizScopeByWorks(worksId);
		if(bizScope==null){
			mmap.put("worksId", worksId);
			return prefix + "/addScope";
		}else{
			mmap.put("bizScope", bizScope);
			return prefix + "/editScope";
		}
	}

	/**
	 * 新增保存水厂化验数据范围
	 */
	@RequiresPermissions("system:bizWaterWork:edit")
	@Log(title = "新增水厂化验数据范围", businessType = BusinessType.INSERT)
	@PostMapping("/addScope")
	@ResponseBody
	public AjaxResult addScope(BizScope bizScope)
	{
		bizScope.setCreateBy(ShiroUtils.getLoginName());
		return toAjax(bizScopeService.insertBizScope(bizScope));
	}


	/**
	 * 修改保存水厂
	 */
	@RequiresPermissions("system:bizWaterWork:edit")
	@Log(title = "修改水厂化验数据范围", businessType = BusinessType.UPDATE)
	@PostMapping("/editScope")
	@ResponseBody
	public AjaxResult editScope(BizScope bizScope)
	{
		return toAjax(bizScopeService.updateBizScope(bizScope));
	}

}
