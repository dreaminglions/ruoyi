package com.ruoyi.web.controller.system;

import java.util.List;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.util.ShiroUtils;
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
import com.ruoyi.system.domain.BizDeviceUnit;
import com.ruoyi.system.service.IBizDeviceUnitService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 设备部件 信息操作处理
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
@Controller
@RequestMapping("/system/bizDeviceUnit")
public class BizDeviceUnitController extends BaseController
{
    private String prefix = "system/bizDeviceUnit";
	
	@Autowired
	private IBizDeviceUnitService bizDeviceUnitService;
	
	@RequiresPermissions("system:bizDeviceUnit:view")
	@GetMapping()
	public String bizDeviceUnit()
	{
	    return prefix + "/bizDeviceUnit";
	}
	
	/**
	 * 查询设备部件列表
	 */
	@RequiresPermissions("system:bizDeviceUnit:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(BizDeviceUnit bizDeviceUnit)
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
					" OR {}.device_works IN ( SELECT works_id FROM sys_role_work WHERE role_id = {} ) ", "u",
					role.getRoleId()));
		}
		if (StringUtils.isNotBlank(sqlString.toString()))
		{
			bizDeviceUnit.getParams().put("dataScope", " AND (" + sqlString.substring(4) + ")");
		}
        List<BizDeviceUnit> list = bizDeviceUnitService.selectBizDeviceUnitList(bizDeviceUnit);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出设备部件列表
	 */
	@RequiresPermissions("system:bizDeviceUnit:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BizDeviceUnit bizDeviceUnit)
    {
    	List<BizDeviceUnit> list = bizDeviceUnitService.selectBizDeviceUnitList(bizDeviceUnit);
        ExcelUtil<BizDeviceUnit> util = new ExcelUtil<BizDeviceUnit>(BizDeviceUnit.class);
        return util.exportExcel(list, "bizDeviceUnit");
    }
	
	/**
	 * 新增设备部件
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存设备部件
	 */
	@RequiresPermissions("system:bizDeviceUnit:add")
	@Log(title = "新增设备部件", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(BizDeviceUnit bizDeviceUnit)
	{		
		return toAjax(bizDeviceUnitService.insertBizDeviceUnit(bizDeviceUnit));
	}

	/**
	 * 修改设备部件
	 */
	@GetMapping("/edit/{unitId}")
	public String edit(@PathVariable("unitId") Long unitId, ModelMap mmap)
	{
		BizDeviceUnit bizDeviceUnit = bizDeviceUnitService.selectBizDeviceUnitById(unitId);
		mmap.put("bizDeviceUnit", bizDeviceUnit);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存设备部件
	 */
	@RequiresPermissions("system:bizDeviceUnit:edit")
	@Log(title = "修改设备部件", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(BizDeviceUnit bizDeviceUnit)
	{		
		return toAjax(bizDeviceUnitService.updateBizDeviceUnit(bizDeviceUnit));
	}
	
	/**
	 * 删除设备部件
	 */
	@RequiresPermissions("system:bizDeviceUnit:remove")
	@Log(title = "删除设备部件", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(bizDeviceUnitService.deleteBizDeviceUnitByIds(ids));
	}
	
}
