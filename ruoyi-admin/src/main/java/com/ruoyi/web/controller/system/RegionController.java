package com.ruoyi.web.controller.system;

import java.util.List;
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
import com.ruoyi.system.domain.Region;
import com.ruoyi.system.service.IRegionService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 地区（省市区） 信息操作处理
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
@Controller
@RequestMapping("/system/region")
public class RegionController extends BaseController
{
    private String prefix = "system/region";
	
	@Autowired
	private IRegionService regionService;
	
	@RequiresPermissions("system:region:view")
	@GetMapping()
	public String region()
	{
	    return prefix + "/region";
	}
	
	/**
	 * 查询地区（省市区）列表
	 */
	@RequiresPermissions("system:region:list")
	@GetMapping("/list")
	@ResponseBody
	public List<Region> list(Region region)
	{
        List<Region> list = regionService.selectRegionList(region);
		return list;
	}
	
	
	/**
	 * 导出地区（省市区）列表
	 */
	@RequiresPermissions("system:region:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Region region)
    {
    	List<Region> list = regionService.selectRegionList(region);
        ExcelUtil<Region> util = new ExcelUtil<Region>(Region.class);
        return util.exportExcel(list, "region");
    }
	
	/**
	 * 新增地区（省市区）
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存地区（省市区）
	 */
	@RequiresPermissions("system:region:add")
	@Log(title = "新增地区", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(Region region)
	{		
		return toAjax(regionService.insertRegion(region));
	}

	/**
	 * 修改地区（省市区）
	 */
	@GetMapping("/edit/{regionId}")
	public String edit(@PathVariable("regionId") Long regionId, ModelMap mmap)
	{
		Region region = regionService.selectRegionById(regionId);
		mmap.put("region", region);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存地区（省市区）
	 */
	@RequiresPermissions("system:region:edit")
	@Log(title = "修改地区", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(Region region)
	{		
		return toAjax(regionService.updateRegion(region));
	}
	
	/**
	 * 删除地区（省市区）
	 */
	@RequiresPermissions("system:region:remove")
	@Log(title = "删除地区", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(regionService.deleteRegionByIds(ids));
	}
	
}
