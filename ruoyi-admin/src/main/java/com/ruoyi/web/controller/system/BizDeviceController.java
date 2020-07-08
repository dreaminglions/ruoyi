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
import com.ruoyi.system.domain.BizDevice;
import com.ruoyi.system.service.IBizDeviceService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 设备 信息操作处理
 * 
 * @author ruoyi
 * @date 2019-12-02
 */
@Controller
@RequestMapping("/system/bizDevice")
public class BizDeviceController extends BaseController
{
    private String prefix = "system/bizDevice";
	
	@Autowired
	private IBizDeviceService bizDeviceService;
	
	@RequiresPermissions("system:bizDevice:view")
	@GetMapping()
	public String bizDevice()
	{
	    return prefix + "/bizDevice";
	}
	
	/**
	 * 查询设备列表
	 */
	@RequiresPermissions("system:bizDevice:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(BizDevice bizDevice)
	{
		startPage();
		//区域中心，水厂判断
		StringBuilder sqlString = new StringBuilder();
		SysRole role = ShiroUtils.getSysUser().getRole();
//		String dataScope = role.getDataScope();
//		if ("1".equals(dataScope))
//		{
//			sqlString = new StringBuilder();
//		}
//		else if ("2".equals(dataScope))
//		{
//			sqlString.append(StringUtils.format(
//					" OR {}.device_works IN ( SELECT works_id FROM sys_role_work WHERE role_id = {} ) ", "d",
//					role.getRoleId()));
//		}
//		if (StringUtils.isNotBlank(sqlString.toString()))
//		{
//			bizDevice.getParams().put("dataScope", " AND (" + sqlString.substring(4) + ")");
//		}
        List<BizDevice> list = bizDeviceService.selectBizDeviceList(bizDevice);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出设备列表
	 */
	@RequiresPermissions("system:bizDevice:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BizDevice bizDevice)
    {
    	List<BizDevice> list = bizDeviceService.selectBizDeviceList(bizDevice);
        ExcelUtil<BizDevice> util = new ExcelUtil<BizDevice>(BizDevice.class);
        return util.exportExcel(list, "bizDevice");
    }
	
	/**
	 * 新增设备
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存设备
	 */
	@RequiresPermissions("system:bizDevice:add")
	@Log(title = "新增设备", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(BizDevice bizDevice)
	{		
		return toAjax(bizDeviceService.insertBizDevice(bizDevice));
	}

	/**
	 * 修改设备
	 */
	@GetMapping("/edit/{deviceId}")
	public String edit(@PathVariable("deviceId") Long deviceId, ModelMap mmap)
	{
		BizDevice bizDevice = bizDeviceService.selectBizDeviceById(deviceId);
		mmap.put("bizDevice", bizDevice);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存设备
	 */
	@RequiresPermissions("system:bizDevice:edit")
	@Log(title = "修改设备", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(BizDevice bizDevice)
	{		
		return toAjax(bizDeviceService.updateBizDevice(bizDevice));
	}
	
	/**
	 * 删除设备
	 */
	@RequiresPermissions("system:bizDevice:remove")
	@Log(title = "删除设备", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(bizDeviceService.deleteBizDeviceByIds(ids));
	}
	
}
