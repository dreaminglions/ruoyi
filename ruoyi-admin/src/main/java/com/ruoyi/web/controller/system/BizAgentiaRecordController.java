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
import com.ruoyi.system.domain.BizAgentiaRecord;
import com.ruoyi.system.service.IBizAgentiaRecordService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 化验药剂记录 信息操作处理
 * 
 * @author ruoyi
 * @date 2020-03-10
 */
@Controller
@RequestMapping("/system/bizAgentiaRecord")
public class BizAgentiaRecordController extends BaseController
{
    private String prefix = "system/bizAgentiaRecord";
	
	@Autowired
	private IBizAgentiaRecordService bizAgentiaRecordService;
	
	@RequiresPermissions("system:bizAgentiaRecord:view")
	@GetMapping()
	public String bizAgentiaRecord()
	{
	    return prefix + "/bizAgentiaRecord";
	}
	
	/**
	 * 查询化验药剂记录列表
	 */
	@RequiresPermissions("system:bizAgentiaRecord:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(BizAgentiaRecord bizAgentiaRecord)
	{
		startPage();
        List<BizAgentiaRecord> list = bizAgentiaRecordService.selectBizAgentiaRecordList(bizAgentiaRecord);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出化验药剂记录列表
	 */
	@RequiresPermissions("system:bizAgentiaRecord:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BizAgentiaRecord bizAgentiaRecord)
    {
    	List<BizAgentiaRecord> list = bizAgentiaRecordService.selectBizAgentiaRecordList(bizAgentiaRecord);
        ExcelUtil<BizAgentiaRecord> util = new ExcelUtil<BizAgentiaRecord>(BizAgentiaRecord.class);
        return util.exportExcel(list, "bizAgentiaRecord");
    }
	
	/**
	 * 新增化验药剂记录
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存化验药剂记录
	 */
	@RequiresPermissions("system:bizAgentiaRecord:add")
	@Log(title = "新增化验药剂记录", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(BizAgentiaRecord bizAgentiaRecord)
	{		
		return toAjax(bizAgentiaRecordService.insertBizAgentiaRecord(bizAgentiaRecord));
	}

	/**
	 * 修改化验药剂记录
	 */
	@GetMapping("/edit/{recordId}")
	public String edit(@PathVariable("recordId") Long recordId, ModelMap mmap)
	{
		BizAgentiaRecord bizAgentiaRecord = bizAgentiaRecordService.selectBizAgentiaRecordById(recordId);
		mmap.put("bizAgentiaRecord", bizAgentiaRecord);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存化验药剂记录
	 */
	@RequiresPermissions("system:bizAgentiaRecord:edit")
	@Log(title = "修改化验药剂记录", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(BizAgentiaRecord bizAgentiaRecord)
	{		
		return toAjax(bizAgentiaRecordService.updateBizAgentiaRecord(bizAgentiaRecord));
	}
	
	/**
	 * 删除化验药剂记录
	 */
	@RequiresPermissions("system:bizAgentiaRecord:remove")
	@Log(title = "删除化验药剂记录", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(bizAgentiaRecordService.deleteBizAgentiaRecordByIds(ids));
	}
	
}
