package com.ruoyi.web.controller.system;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.service.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 故障信息 信息操作处理
 * 
 * @author ruoyi
 * @date 2019-11-29
 */
@Controller
@RequestMapping("/system/faultInfo")
public class BizFaultInfoController extends BaseController
{
    private String prefix = "system/faultInfo";
	
	@Autowired
	private IAssayFaultInfoService assayFaultInfoService;


	
	@RequiresPermissions("system:faultInfo:view")
	@GetMapping()
	public String bizAssay()
	{
	    return prefix + "/faultInfo";
	}
	
	/**
	 * 查询故障信息列表
	 */
	@RequiresPermissions("system:faultInfo:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(AssayFaultInfo assayFaultInfo)
	{
		startPage();
        List<AssayFaultInfo> list = assayFaultInfoService.selectAssayFaultInfoList(assayFaultInfo);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出故障信息列表
	 */
	@RequiresPermissions("system:faultInfo:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(AssayFaultInfo assayFaultInfo)
    {
    	List<AssayFaultInfo> list = assayFaultInfoService.selectAssayFaultInfoList(assayFaultInfo);
        ExcelUtil<AssayFaultInfo> util = new ExcelUtil<AssayFaultInfo>(AssayFaultInfo.class);
        return util.exportExcel(list, "assayFaultInfo");
    }
	
	/**
	 * 新增故障信息
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存故障信息
	 */
	@RequiresPermissions("system:faultInfo:add")
	@Log(title = "新增故障信息", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(AssayFaultInfo assayFaultInfo)
	{		
		return toAjax(assayFaultInfoService.insertAssayFaultInfo(assayFaultInfo));
	}


	/**
	 * 修改故障信息
	 */
	@GetMapping("/edit/{infoId}")
	public String edit(@PathVariable("infoId") Long infoId, ModelMap mmap)
	{
		AssayFaultInfo assayFaultInfo = assayFaultInfoService.selectAssayFaultInfoById(infoId);
		mmap.put("assayFaultInfo", assayFaultInfo);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存故障信息
	 */
	@RequiresPermissions("system:faultInfo:edit")
	@Log(title = "修改故障信息", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(AssayFaultInfo assayFaultInfo)
	{
		return toAjax(assayFaultInfoService.updateAssayFaultInfo(assayFaultInfo));
	}
	
	/**
	 * 删除故障信息
	 */
	@RequiresPermissions("system:faultInfo:remove")
	@Log(title = "删除故障信息", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(assayFaultInfoService.deleteAssayFaultInfoByIds(ids));
	}


}
