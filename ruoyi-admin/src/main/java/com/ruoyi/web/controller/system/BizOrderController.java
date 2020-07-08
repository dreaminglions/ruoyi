package com.ruoyi.web.controller.system;

import java.util.List;

import com.ruoyi.system.domain.BizAssayResult;
import com.ruoyi.system.service.IBizAssayResultService;
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
import com.ruoyi.system.domain.BizOrder;
import com.ruoyi.system.service.IBizOrderService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 化验单据 信息操作处理
 * 
 * @author ruoyi
 * @date 2019-12-16
 */
@Controller
@RequestMapping("/system/bizOrder")
public class BizOrderController extends BaseController
{
    private String prefix = "system/bizOrder";
	
	@Autowired
	private IBizOrderService bizOrderService;
	@Autowired
	private IBizAssayResultService bizAssayResultService;
	
	@RequiresPermissions("system:bizOrder:view")
	@GetMapping()
	public String bizOrder()
	{
	    return prefix + "/bizOrder";
	}
	
	/**
	 * 查询化验单据列表
	 */
	@RequiresPermissions("system:bizOrder:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(BizOrder bizOrder)
	{
		startPage();
        List<BizOrder> list = bizOrderService.selectBizOrderList(bizOrder);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出化验单据列表
	 */
	@RequiresPermissions("system:bizOrder:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BizOrder bizOrder)
    {
    	List<BizOrder> list = bizOrderService.selectBizOrderList(bizOrder);
        ExcelUtil<BizOrder> util = new ExcelUtil<BizOrder>(BizOrder.class);
        return util.exportExcel(list, "bizOrder");
    }
	
	/**
	 * 新增化验单据
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存化验单据
	 */
	@RequiresPermissions("system:bizOrder:add")
	@Log(title = "新增化验单据", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(BizOrder bizOrder)
	{		
		return toAjax(bizOrderService.insertBizOrder(bizOrder));
	}

	/**
	 * 修改化验单据
	 */
	@GetMapping("/edit/{orderId}")
	public String edit(@PathVariable("orderId") Long orderId, ModelMap mmap)
	{
		BizOrder bizOrder = bizOrderService.selectBizOrderById(orderId);
		mmap.put("bizOrder", bizOrder);
	    return prefix + "/edit";
	}

	/**
	 * 查看化验结果数据
	 */
	@GetMapping("/getAssayData/{reportId}")
	public String getAssayData(@PathVariable("reportId") String reportId, ModelMap mmap)
	{
		BizAssayResult bizAssayResult = bizAssayResultService.selectBizAssayResultByReportId(reportId);
		mmap.put("bizAssayResult", bizAssayResult);
		return prefix + "/check";
	}
	
	/**
	 * 修改保存化验单据
	 */
	@RequiresPermissions("system:bizOrder:edit")
	@Log(title = "修改化验单据", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(BizOrder bizOrder)
	{		
		return toAjax(bizOrderService.updateBizOrder(bizOrder));
	}
	
	/**
	 * 删除化验单据
	 */
	@RequiresPermissions("system:bizOrder:remove")
	@Log(title = "删除化验单据", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(bizOrderService.deleteBizOrderByIds(ids));
	}
	
}
