package com.ruoyi.web.controller.system;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.system.domain.BizAgentia;
import com.ruoyi.system.domain.BizDeviceAgentia;
import com.ruoyi.system.domain.BizAgentiaRecord;
import com.ruoyi.system.domain.SysRole;
import com.ruoyi.system.service.IBizAgentiaRecordService;
import com.ruoyi.system.service.IBizDeviceAgentiaService;
import net.sf.json.JSONObject;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 设备药剂 信息操作处理
 * 
 * @author ruoyi
 * @date 2019-12-02
 */
@Controller
@RequestMapping("/system/bizDeviceAgentia")
public class BizDeviceAgentiaController extends BaseController
{
    private String prefix = "system/bizAgentia";
	private String prefixGroup = "system/bizAgentiaGroup";
	private String prefixWork = "system/bizAgentiaWork";
	private String prefixDevice = "system/bizAgentiaDevice";
	private String prefixPlatform = "system/bizAgentiaPlatform";


	@Autowired
	private IBizDeviceAgentiaService bizDeviceAgentiaService;
	@Autowired
	private IBizAgentiaRecordService bizAgentiaRecordService;


	@RequiresPermissions("system:bizAgentiaDevice:view")
	@GetMapping("/device")
	public String bizAgentiaDevice()
	{
		return prefixDevice + "/bizAgentiaDevice";
	}

	/**
	 * 查询设备药剂列表
	 */
	@RequiresPermissions("system:bizAgentiaDevice:list")
	@PostMapping("/devicelist")
	@ResponseBody
	public TableDataInfo devicelist(BizDeviceAgentia bizAgentia)
	{
		startPage();
		bizAgentia.setAgentiaType("4");
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
					" OR {}.works_id IN ( SELECT works_id FROM sys_role_work WHERE role_id = {} ) ", "w",
					role.getRoleId()));
		}
		if (StringUtils.isNotBlank(sqlString.toString()))
		{
			bizAgentia.getParams().put("dataScope", " AND (" + sqlString.substring(4) + ")");
		}
		List<BizDeviceAgentia> list = bizDeviceAgentiaService.selectDeviceAgentiaList(bizAgentia);
		return getDataTable(list);
	}


	/**
	 * 导出药剂列表
	 */
	@RequiresPermissions("system:bizAgentia:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BizDeviceAgentia bizAgentia)
    {
    	List<BizDeviceAgentia> list = bizDeviceAgentiaService.selectDeviceAgentiaList(bizAgentia);
        ExcelUtil<BizDeviceAgentia> util = new ExcelUtil<BizDeviceAgentia>(BizDeviceAgentia.class);
        return util.exportExcel(list, "bizDeviceAgentia");
    }

	/**
	 * 新增设备药剂
	 */
	@GetMapping("/deviceadd")
	public String deviceadd()
	{
		return prefixDevice + "/add";
	}

	/**
	 * 新增保存设备药剂
	 */
	@RequiresPermissions("system:bizAgentiaDevice:add")
	@Log(title = "新增设备药剂", businessType = BusinessType.INSERT)
	@PostMapping("/deviceadd")
	@ResponseBody
	public AjaxResult deviceaddSave(BizDeviceAgentia bizAgentia)
	{
		return toAjax(bizDeviceAgentiaService.insertBizDeviceAgentia(bizAgentia));
	}

	/**
	 * 修改设备药剂
	 */
	@GetMapping("/deviceedit/{agentiaId}")
	public String deviceedit(@PathVariable("agentiaId") Long agentiaId, ModelMap mmap)
	{
		BizDeviceAgentia bizAgentia = bizDeviceAgentiaService.selectDeviceAgentiaById(agentiaId);
		mmap.put("bizAgentia", bizAgentia);
		return prefixDevice + "/edit";
	}

	/**
	 * 修改保存设备药剂
	 */
	@RequiresPermissions("system:bizAgentiaDevice:edit")
	@Log(title = "设备药剂信息修改", businessType = BusinessType.UPDATE)
	@PostMapping("/deviceeditsave")
	@ResponseBody
	public AjaxResult deviceeditSave(BizDeviceAgentia bizAgentia)
	{
		return toAjax(bizDeviceAgentiaService.updateBizAgentia(bizAgentia));
	}

	/**
	 * 删除药剂
	 */
	@RequiresPermissions("system:bizAgentiaDevice:remove")
	@Log(title = "删除药剂", businessType = BusinessType.DELETE)
	@PostMapping( "/deviceremove")
	@ResponseBody
	public AjaxResult deviceremove(String ids)
	{
		return toAjax(bizDeviceAgentiaService.deleteBizAgentiaByIds(ids));
	}

	/**
	 * 查询药剂维护记录
	 */
	@GetMapping("/getRecord/{agentiaId}")
	public String getRecord(@PathVariable("agentiaId") Long agentiaId, ModelMap mmap)
	{
		mmap.put("bizAgentia", bizDeviceAgentiaService.selectDeviceAgentiaById(agentiaId));
		return prefix + "/agentiaRecord";
	}


	/**
	 * 查询药剂对照记录
	 */
	@GetMapping("/getContrast")
	public String getContrast(ModelMap mmap)
	{
		return prefix + "/agentiaContrast";
	}


	/**
	 * 查询化验药剂记录列表
	 */
	@RequiresPermissions("system:bizAgentia:list")
	@PostMapping("/recordlist")
	@ResponseBody
	public TableDataInfo recordlist(BizAgentiaRecord bizAgentiaRecord)
	{
		startPage();
		List<BizAgentiaRecord> list = bizAgentiaRecordService.selectBizAgentiaRecordList(bizAgentiaRecord);
		return getDataTable(list);
	}

	/**
	 * 修改设备药剂量
	 */
	@GetMapping("/changeAgentia/{agentiaId}")
	public String changeAgentia(@PathVariable("agentiaId") Long agentiaId, ModelMap mmap)
	{
		BizDeviceAgentia bizAgentia = bizDeviceAgentiaService.selectDeviceAgentiaById(agentiaId);
		mmap.put("bizAgentia", bizAgentia);
		return prefixDevice + "/doseEdit";
	}


	/**
	 * 修改保存设备药剂
	 */
	@RequiresPermissions("system:bizAgentiaDevice:edit")
	@Log(title = "设备药剂变更,新增药剂记录", businessType = BusinessType.UPDATE)
	@PostMapping("/doseeditSave")
	@ResponseBody
	public AjaxResult doseeditSave(BizAgentiaRecord bizAgentiaRecord)
	{
		Long agentiaId =  bizAgentiaRecord.getAgentiaId();
		String recordType =bizAgentiaRecord.getRecordType();
		float agentiaChange = bizAgentiaRecord.getAgentiaChange();

		BizDeviceAgentia bizAgentia = bizDeviceAgentiaService.selectDeviceAgentiaById(agentiaId);
		float agentiaTotal_old = bizAgentia.getAgentiaTotal();
		float agentiaRemain_old = bizAgentia.getAgentiaRemain();
		float agentiaTotal_new = agentiaTotal_old;
		float agentiaRemain_new = agentiaRemain_old;

		if("0".equals(recordType)){
			 agentiaTotal_new = agentiaTotal_old;
			 agentiaRemain_new = agentiaRemain_old + agentiaChange;
		}else if("1".equals(recordType)){
			 agentiaTotal_new = agentiaTotal_old + agentiaChange;
			 agentiaRemain_new = agentiaRemain_old - agentiaChange;
		}
		bizAgentia.setAgentiaTotal(agentiaTotal_new);
		bizAgentia.setAgentiaRemain(agentiaRemain_new);
		//更新药剂变更
		bizDeviceAgentiaService.updateBizAgentia(bizAgentia);

		SimpleDateFormat format_date = new SimpleDateFormat("yyyy-MM-dd");
		bizAgentiaRecord.setRecordDate(format_date.format(new Date()));
		bizAgentiaRecord.setRecordType(recordType);
		bizAgentiaRecord.setRecordStatus("0");
		bizAgentiaRecord.setBeforeTotal(agentiaTotal_old);
		bizAgentiaRecord.setBeforeRemain(agentiaRemain_old);
		bizAgentiaRecord.setAfterTotal(agentiaTotal_new);
		bizAgentiaRecord.setAfterRemain(agentiaRemain_new);
		bizAgentiaRecord.setAgentiaChange(agentiaChange);

		return toAjax(bizAgentiaRecordService.insertBizAgentiaRecord(bizAgentiaRecord));
	}

}
