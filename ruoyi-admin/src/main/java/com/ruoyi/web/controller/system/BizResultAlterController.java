package com.ruoyi.web.controller.system;

import java.util.List;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.system.domain.BizAssayResult;
import com.ruoyi.system.domain.SysRole;
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
import com.ruoyi.system.domain.BizResultAlter;
import com.ruoyi.system.service.IBizResultAlterService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 化验结果修改 信息操作处理
 * 
 * @author ruoyi
 * @date 2019-12-02
 */
@Controller
@RequestMapping("/system/bizResultAlter")
public class BizResultAlterController extends BaseController
{
    private String prefix = "system/bizResultAlter";
	
	@Autowired
	private IBizResultAlterService bizResultAlterService;
	
	@RequiresPermissions("system:bizResultAlter:view")
	@GetMapping()
	public String bizResultAlter()
	{
	    return prefix + "/bizResultAlter";
	}
	
	/**
	 * 查询化验结果修改列表
	 */
	@RequiresPermissions("system:bizResultAlter:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(BizResultAlter bizResultAlter)
	{
		startPage();
		//区域中心，水厂判断
		StringBuilder sqlString = new StringBuilder();
		SysRole role = ShiroUtils.getSysUser().getRole();
		String dataScope = role.getDataScope();
		if ("1".equals(dataScope))
		{
			sqlString = new StringBuilder();
		}
		else if ("2".equals(dataScope))
		{
			sqlString.append(StringUtils.format(
					" OR {}.alter_works IN ( SELECT works_id FROM sys_role_work WHERE role_id = {} ) ", "a",
					role.getRoleId()));
		}
		if (StringUtils.isNotBlank(sqlString.toString()))
		{
			bizResultAlter.getParams().put("dataScope", " AND (" + sqlString.substring(4) + ")");
		}
        List<BizResultAlter> list = bizResultAlterService.selectBizResultAlterList(bizResultAlter);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出化验结果修改列表
	 */
	@RequiresPermissions("system:bizResultAlter:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BizResultAlter bizResultAlter)
    {
    	List<BizResultAlter> list = bizResultAlterService.selectBizResultAlterList(bizResultAlter);
        ExcelUtil<BizResultAlter> util = new ExcelUtil<BizResultAlter>(BizResultAlter.class);
        return util.exportExcel(list, "bizResultAlter");
    }
	
	/**
	 * 新增化验结果修改
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存化验结果修改
	 */
	@RequiresPermissions("system:bizResultAlter:add")
	@Log(title = "新增化验结果", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(BizResultAlter bizResultAlter)
	{		
		return toAjax(bizResultAlterService.insertBizResultAlter(bizResultAlter));
	}

	/**
	 * 查看化验结果
	 */
	@GetMapping("/check/{resultId}")
	public String check(@PathVariable("resultId") Long resultId, ModelMap mmap)
	{
		BizResultAlter bizResultAlter = bizResultAlterService.selectBizResultAlterById(resultId);
		mmap.put("bizResultAlter", bizResultAlter);
		return prefix + "/check";
	}

	/**
	 * 修改化验结果修改
	 */
	@GetMapping("/edit/{alterId}")
	public String edit(@PathVariable("alterId") Long alterId, ModelMap mmap)
	{
		BizResultAlter bizResultAlter = bizResultAlterService.selectBizResultAlterById(alterId);
		mmap.put("bizResultAlter", bizResultAlter);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存化验结果修改
	 */
	@RequiresPermissions("system:bizResultAlter:edit")
	@Log(title = "修改化验结果", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(BizResultAlter bizResultAlter)
	{		
		return toAjax(bizResultAlterService.updateBizResultAlter(bizResultAlter));
	}
	
	/**
	 * 删除化验结果修改
	 */
	@RequiresPermissions("system:bizResultAlter:remove")
	@Log(title = "删除化验结果", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(bizResultAlterService.deleteBizResultAlterByIds(ids));
	}
	
}
