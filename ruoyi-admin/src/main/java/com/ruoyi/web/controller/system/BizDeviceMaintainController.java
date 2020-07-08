package com.ruoyi.web.controller.system;

import java.util.List;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.system.domain.SysRole;
import net.sf.json.JSONObject;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.BizDeviceMaintain;
import com.ruoyi.system.service.IBizDeviceMaintainService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 设备维护 信息操作处理
 * 
 * @author ruoyi
 * @date 2019-12-16
 */
@Controller
@RequestMapping("/system/bizDeviceMaintain")
public class BizDeviceMaintainController extends BaseController
{
    private String prefix = "system/bizDeviceMaintain";
	
	@Autowired
	private IBizDeviceMaintainService bizDeviceMaintainService;
	
	@RequiresPermissions("system:bizDeviceMaintain:view")
	@GetMapping()
	public String bizDeviceMaintain()
	{
	    return prefix + "/bizDeviceMaintain";
	}
	
	/**
	 * 查询设备维护列表
	 */
	@RequiresPermissions("system:bizDeviceMaintain:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(BizDeviceMaintain bizDeviceMaintain)
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
					" OR {}.maintain_works IN ( SELECT works_id FROM sys_role_work WHERE role_id = {} ) ", "a",
					role.getRoleId()));
		}
		if (StringUtils.isNotBlank(sqlString.toString()))
		{
			bizDeviceMaintain.getParams().put("dataScope", " AND (" + sqlString.substring(4) + ")");
		}
        List<BizDeviceMaintain> list = bizDeviceMaintainService.selectBizDeviceMaintainList(bizDeviceMaintain);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出设备维护列表
	 */
	@RequiresPermissions("system:bizDeviceMaintain:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BizDeviceMaintain bizDeviceMaintain)
    {
    	List<BizDeviceMaintain> list = bizDeviceMaintainService.selectBizDeviceMaintainList(bizDeviceMaintain);
        ExcelUtil<BizDeviceMaintain> util = new ExcelUtil<BizDeviceMaintain>(BizDeviceMaintain.class);
        return util.exportExcel(list, "bizDeviceMaintain");
    }
	
	/**
	 * 新增设备维护
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存设备维护
	 */
	@RequiresPermissions("system:bizDeviceMaintain:add")
	@Log(title = "新增设备维护", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(BizDeviceMaintain bizDeviceMaintain)
	{		
		return toAjax(bizDeviceMaintainService.insertBizDeviceMaintain(bizDeviceMaintain));
	}

	/**
	 * 修改设备维护
	 */
	@GetMapping("/edit/{maintainId}")
	public String edit(@PathVariable("maintainId") Long maintainId, ModelMap mmap)
	{
		BizDeviceMaintain bizDeviceMaintain = bizDeviceMaintainService.selectBizDeviceMaintainById(maintainId);
		mmap.put("bizDeviceMaintain", bizDeviceMaintain);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存设备维护
	 */
	@RequiresPermissions("system:bizDeviceMaintain:edit")
	@Log(title = "修改设备维护", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(BizDeviceMaintain bizDeviceMaintain)
	{		
		return toAjax(bizDeviceMaintainService.updateBizDeviceMaintain(bizDeviceMaintain));
	}
	
	/**
	 * 删除设备维护
	 */
	@RequiresPermissions("system:bizDeviceMaintain:remove")
	@Log(title = "删除设备维护", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(bizDeviceMaintainService.deleteBizDeviceMaintainByIds(ids));
	}



	@PostMapping("/endmaintain")
	@ResponseBody
	public AjaxResult endmaintain(@RequestBody JSONObject params) {
		long  maintainId = params.getLong("maintainId");
		BizDeviceMaintain maintain = bizDeviceMaintainService.selectBizDeviceMaintainById(maintainId);
		if(maintain!=null){
			maintain.setMaintainResult("0");
			bizDeviceMaintainService.updateBizDeviceMaintain(maintain);
		}
		AjaxResult ajax = AjaxResult.success();
		ajax.put("result", "修改成功");
		return ajax;
	}
}
