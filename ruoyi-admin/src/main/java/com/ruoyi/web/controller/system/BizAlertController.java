package com.ruoyi.web.controller.system;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ruoyi.system.domain.BizWaste;
import net.sf.json.JSONObject;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.BizAlert;
import com.ruoyi.system.service.IBizAlertService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 告警 信息操作处理
 * 
 * @author ruoyi
 * @date 2019-12-14
 */
@Controller
@RequestMapping("/system/bizAlert")
public class BizAlertController extends BaseController
{
    private String prefix = "system/bizAlert";
	
	@Autowired
	private IBizAlertService bizAlertService;
	
	@RequiresPermissions("system:bizAlert:view")
	@GetMapping()
	public String bizAlert()
	{
	    return prefix + "/bizAlert";
	}
	
	/**
	 * 查询告警列表
	 */
	@RequiresPermissions("system:bizAlert:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(BizAlert bizAlert)
	{
		startPage();
        List<BizAlert> list = bizAlertService.selectBizAlertList(bizAlert);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出告警列表
	 */
	@RequiresPermissions("system:bizAlert:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BizAlert bizAlert)
    {
    	List<BizAlert> list = bizAlertService.selectBizAlertList(bizAlert);
        ExcelUtil<BizAlert> util = new ExcelUtil<BizAlert>(BizAlert.class);
        return util.exportExcel(list, "bizAlert");
    }
	
	/**
	 * 新增告警
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存告警
	 */
	@RequiresPermissions("system:bizAlert:add")
	@Log(title = "新增告警", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(BizAlert bizAlert)
	{		
		return toAjax(bizAlertService.insertBizAlert(bizAlert));
	}

	/**
	 * 修改告警
	 */
	@GetMapping("/edit/{alertId}")
	public String edit(@PathVariable("alertId") Long alertId, ModelMap mmap)
	{
		BizAlert bizAlert = bizAlertService.selectBizAlertById(alertId);
		mmap.put("bizAlert", bizAlert);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存告警
	 */
	@RequiresPermissions("system:bizAlert:edit")
	@Log(title = "修改告警", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(BizAlert bizAlert)
	{		
		return toAjax(bizAlertService.updateBizAlert(bizAlert));
	}
	
	/**
	 * 删除告警
	 */
	@RequiresPermissions("system:bizAlert:remove")
	@Log(title = "删除告警", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(bizAlertService.deleteBizAlertByIds(ids));
	}

	@RequiresPermissions("system:bizAlert:list")
	@GetMapping("/alertReport")
	public String wasteReport()
	{
		return prefix + "/alertReport";
	}


	/**
	 * 告警统计
	 * @param params
	 * @return
	 */
	@PostMapping("/getAlert")
	@ResponseBody
	public AjaxResult getAlert(@RequestBody JSONObject params) {
		long deviceId = params.getLong("deviceId");
		long worksId = params.getLong("worksId");
		String beginDate = params.getString("beginDate");
		String endDate = params.getString("endDate");

		BizAlert resultData = new BizAlert();
		resultData.setAlertDevice(deviceId);
		resultData.setAlertWorks(worksId);
		if (beginDate != null && endDate != null) {
			Map<String, Object> data_params = new HashMap<>();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String nowTime = format.format(new Date());
			data_params.put("beginTime", beginDate);
			data_params.put("endTime", endDate);
			resultData.setParams(data_params);
		}
		List<BizAlert> resultList = bizAlertService.selectBizAlertList(resultData);
		String resultdata="[";
		String waste_total="[";
		int i=0;
		if(resultList!=null){
			for(BizAlert object:resultList){
				i++;
				resultdata +="'"+object.getCreateTime()+"',";
				waste_total +=i+",";
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
}
