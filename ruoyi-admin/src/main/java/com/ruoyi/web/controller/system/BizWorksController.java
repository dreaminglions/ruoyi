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
import com.ruoyi.system.domain.BizWorks;
import com.ruoyi.system.service.IBizWorksService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 水厂 信息操作处理
 * 
 * @author ruoyi
 * @date 2019-12-02
 */
@Controller
@RequestMapping("/system/bizWorks")
public class BizWorksController extends BaseController
{
    private String prefix = "system/bizWorks";
	
	@Autowired
	private IBizWorksService bizWorksService;
	
	@RequiresPermissions("system:bizWorks:view")
	@GetMapping()
	public String bizWorks()
	{
	    return prefix + "/bizWorks";
	}
	
	/**
	 * 查询水厂列表
	 */
	@RequiresPermissions("system:bizWorks:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(BizWorks bizWorks)
	{
		startPage();
        List<BizWorks> list = bizWorksService.selectBizWorksList(bizWorks);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出水厂列表
	 */
	@RequiresPermissions("system:bizWorks:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BizWorks bizWorks)
    {
    	List<BizWorks> list = bizWorksService.selectBizWorksList(bizWorks);
        ExcelUtil<BizWorks> util = new ExcelUtil<BizWorks>(BizWorks.class);
        return util.exportExcel(list, "bizWorks");
    }
	
	/**
	 * 新增水厂
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存水厂
	 */
	@RequiresPermissions("system:bizWorks:add")
	@Log(title = "水厂", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(BizWorks bizWorks)
	{		
		return toAjax(bizWorksService.insertBizWorks(bizWorks));
	}

	/**
	 * 修改水厂
	 */
	@GetMapping("/edit/{worksId}")
	public String edit(@PathVariable("worksId") Long worksId, ModelMap mmap)
	{
		BizWorks bizWorks = bizWorksService.selectBizWorksById(worksId);
		mmap.put("bizWorks", bizWorks);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存水厂
	 */
	@RequiresPermissions("system:bizWorks:edit")
	@Log(title = "水厂", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(BizWorks bizWorks)
	{		
		return toAjax(bizWorksService.updateBizWorks(bizWorks));
	}
	
	/**
	 * 删除水厂
	 */
	@RequiresPermissions("system:bizWorks:remove")
	@Log(title = "水厂", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(bizWorksService.deleteBizWorksByIds(ids));
	}
	
}
