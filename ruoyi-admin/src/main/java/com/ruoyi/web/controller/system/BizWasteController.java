package com.ruoyi.web.controller.system;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.service.IBizWasteRecordService;
import net.sf.json.JSONObject;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.service.IBizWasteService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 废液 信息操作处理
 * 
 * @author ruoyi
 * @date 2020-03-03
 */
@Controller
@RequestMapping("/system/bizWaste")
public class BizWasteController extends BaseController
{
    private String prefix = "system/bizWaste";
	
	@Autowired
	private IBizWasteService bizWasteService;

	@Autowired
	private IBizWasteRecordService bizWasteRecordService;

	
	@RequiresPermissions("system:bizWaste:view")
	@GetMapping()
	public String bizWaste()
	{
	    return prefix + "/bizWaste";
	}
	
	/**
	 * 查询废液列表
	 */
	@RequiresPermissions("system:bizWaste:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(BizWaste bizWaste)
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
					" OR {}.waste_works IN ( SELECT works_id FROM sys_role_work WHERE role_id = {} ) ", "a",
					role.getRoleId()));
		}
		if (StringUtils.isNotBlank(sqlString.toString()))
		{
			bizWaste.getParams().put("dataScope", " AND (" + sqlString.substring(4) + ")");
		}
        List<BizWaste> list = bizWasteService.selectBizWasteList(bizWaste);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出废液列表
	 */
	@RequiresPermissions("system:bizWaste:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BizWaste bizWaste)
    {
    	List<BizWaste> list = bizWasteService.selectBizWasteList(bizWaste);
        ExcelUtil<BizWaste> util = new ExcelUtil<BizWaste>(BizWaste.class);
        return util.exportExcel(list, "bizWaste");
    }
	
	/**
	 * 新增废液
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存废液
	 */
	@RequiresPermissions("system:bizWaste:add")
	@Log(title = "新增废液", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(BizWaste bizWaste)
	{		
		return toAjax(bizWasteService.insertBizWaste(bizWaste));
	}

	/**
	 * 修改废液
	 */
	@GetMapping("/edit/{wasteId}")
	public String edit(@PathVariable("wasteId") Long wasteId, ModelMap mmap)
	{
		BizWaste bizWaste = bizWasteService.selectBizWasteById(wasteId);
		mmap.put("bizWaste", bizWaste);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存废液
	 */
	@RequiresPermissions("system:bizWaste:edit")
	@Log(title = "修改废液", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(BizWaste bizWaste)
	{		
		return toAjax(bizWasteService.updateBizWaste(bizWaste));
	}
	
	/**
	 * 删除废液
	 */
	@RequiresPermissions("system:bizWaste:remove")
	@Log(title = "删除废液", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(bizWasteService.deleteBizWasteByIds(ids));
	}


	@RequiresPermissions("system:bizWaste:list")
	@GetMapping("/wasteReport")
	public String wasteReport()
	{
		return prefix + "/wasteReport";
	}


	/**
	 * 废液统计
	 * @param params
	 * @return
	 */
	@PostMapping("/getWaste")
	@ResponseBody
	public AjaxResult getWaste(@RequestBody JSONObject params) {
		long deviceId = params.getLong("deviceId");
		long worksId = params.getLong("worksId");
		String beginDate = params.getString("beginDate");
		String endDate = params.getString("endDate");

		BizWaste resultData = new BizWaste();
		resultData.setWasteDevice(deviceId);
		resultData.setWasteWorks(worksId);
		if (beginDate != null && endDate != null) {
			Map<String, Object> data_params = new HashMap<>();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String nowTime = format.format(new Date());
			data_params.put("beginTime", beginDate);
			data_params.put("endTime", endDate);
			resultData.setParams(data_params);
		}
		List<BizWaste> resultList = bizWasteService.selectBizWasteList(resultData);
		String resultdata="[";
		String waste_total="[";
		if(resultList!=null){
			for(BizWaste object:resultList){
				resultdata +="'"+object.getRepairTime()+"',";
				waste_total +=object.getWasteTotal()+",";
			}
			if(resultdata.length()>1){
				resultdata = resultdata.substring(0,resultdata.length()-1);
			}
			if(waste_total.length()>1){
				waste_total = waste_total.substring(0,waste_total.length()-1);
			}
		}
		resultdata +="]";
		waste_total +="]";

		String jsonData = "{resultdate:"+resultdata+",waste_total:"+waste_total+"}";
		AjaxResult ajax = AjaxResult.success();
		ajax.put("resultdata", jsonData);
		return ajax;

	}


	/**
	 * 查询废液记录
	 */
	@GetMapping("/getRecord/{wasteId}")
	public String getRecord(@PathVariable("wasteId") Long wasteId, ModelMap mmap)
	{
		mmap.put("bizWaste",  bizWasteService.selectBizWasteById(wasteId));
		return prefix + "/wasteRecord";
	}

	/**
	 * 查询废液记录列表
	 */
	@RequiresPermissions("system:bizWaste:list")
	@PostMapping("/recordlist")
	@ResponseBody
	public TableDataInfo recordlist(BizWasteRecord bizWasteRecord)
	{
		startPage();
		List<BizWasteRecord> list = bizWasteRecordService.selectBizWasteRecordList(bizWasteRecord);
		return getDataTable(list);
	}
	
}
