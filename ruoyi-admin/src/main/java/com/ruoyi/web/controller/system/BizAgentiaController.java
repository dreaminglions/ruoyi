package com.ruoyi.web.controller.system;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.framework.web.domain.server.Sys;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.service.*;
import net.sf.json.JSONObject;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 药剂 信息操作处理
 * 
 * @author ruoyi
 * @date 2019-12-02
 */
@Controller
@RequestMapping("/system/bizAgentia")
public class BizAgentiaController extends BaseController
{
    private String prefix = "system/bizAgentia";
	private String prefixGroup = "system/bizAgentiaGroup";
	private String prefixWork = "system/bizAgentiaWork";
	private String prefixDevice = "system/bizAgentiaDevice";
	private String prefixPlatform = "system/bizAgentiaPlatform";


	@Autowired
	private IBizAgentiaService bizAgentiaService;
	@Autowired
	private IBizAgentiaRecordService bizAgentiaRecordService;
	@Autowired
	private IBizAgentiaSendService bizAgentiaSendService;
	@Autowired
	private IBizAgentiaMakeService bizAgentiaMakeService;
	@Autowired
	private IBizDeviceAgentiaService bizDeviceAgentiaService;

	@RequiresPermissions("system:bizAgentia:view")
	@GetMapping()
	public String bizAgentia()
	{
	    return prefix + "/bizAgentia";
	}

	@RequiresPermissions("system:bizAgentiaGroup:view")
	@GetMapping("/group")
	public String bizAgentiaGroup()
	{
		return prefixGroup + "/bizAgentiaGroup";
	}

	@RequiresPermissions("system:bizAgentiaWork:view")
	@GetMapping("/work")
	public String bizAgentiaWork()
	{
		return prefixWork + "/bizAgentiaWork";
	}


	@RequiresPermissions("system:bizAgentiaDevice:view")
	@GetMapping("/device")
	public String bizAgentiaDevice()
	{
		return prefixDevice + "/bizAgentiaDevice";
	}

	@RequiresPermissions("system:bizAgentiaPlatform:view")
	@GetMapping("/platform")
	public String bizAgentiaPlatform()
	{
		return prefixPlatform + "/bizAgentiaPlatform";
	}


	/**
	 * 查询药剂列表
	 */
	@RequiresPermissions("system:bizAgentia:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(BizDeviceAgentia bizAgentia)
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
	 * 查询集团药剂列表
	 */
	@RequiresPermissions("system:bizAgentiaGroup:list")
	@PostMapping("/grouplist")
	@ResponseBody
	public TableDataInfo grouplist(BizAgentia bizAgentia)
	{
		startPage();
		SysRole role = ShiroUtils.getSysUser().getRole();
		String dataScope = role.getDataScope();
		bizAgentia.setAgentiaType("2");
		List<BizAgentia> list = new ArrayList<BizAgentia>();
		if ("1".equals(dataScope)){
			list = bizAgentiaService.selectBizAgentiaList(bizAgentia);
		}else if ("2".equals(dataScope)) {
			long worksId = ShiroUtils.getSysUser().getWorksId();
			bizAgentia.setAgentiaBelong(worksId);
			list = bizAgentiaService.selectBizAgentiaList(bizAgentia);
		}
			return getDataTable(list);
	}

	/**
	 * 查询水厂药剂列表
	 */
	@RequiresPermissions("system:bizAgentiaWork:list")
	@PostMapping("/worklist")
	@ResponseBody
	public TableDataInfo worklist(BizAgentia bizAgentia)
	{
		startPage();
		bizAgentia.setAgentiaType("3");
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
		List<BizAgentia> list = bizAgentiaService.selectBizAgentiaList(bizAgentia);
		return getDataTable(list);
	}

	/**
	 * 查询设备药剂列表
	 */
	@RequiresPermissions("system:bizAgentiaDevice:list")
	@PostMapping("/devicelist")
	@ResponseBody
	public TableDataInfo devicelist(BizAgentia bizAgentia)
	{
		startPage();
		bizAgentia.setAgentiaType("2");
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
		List<BizAgentia> list = bizAgentiaService.selectDeviceAgentiaList(bizAgentia);
		return getDataTable(list);
	}

	/**
	 * 查询平台药剂列表
	 */
	@RequiresPermissions("system:bizAgentiaGroup:list")
	@PostMapping("/platformlist")
	@ResponseBody
	public TableDataInfo platformlist(BizAgentia bizAgentia)
	{
		startPage();
		SysRole role = ShiroUtils.getSysUser().getRole();
		String dataScope = role.getDataScope();
		bizAgentia.setAgentiaType("1");
		List<BizAgentia> list = new ArrayList<BizAgentia>();
		if ("1".equals(dataScope)){
			list = bizAgentiaService.selectBizAgentiaList(bizAgentia);
		}
		return getDataTable(list);
	}


	/**
	 * 导出药剂列表
	 */
	@RequiresPermissions("system:bizAgentia:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BizAgentia bizAgentia)
    {
    	List<BizAgentia> list = bizAgentiaService.selectBizAgentiaList(bizAgentia);
        ExcelUtil<BizAgentia> util = new ExcelUtil<BizAgentia>(BizAgentia.class);
        return util.exportExcel(list, "bizAgentia");
    }

	/**
	 * 新增药剂
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}

	/**
	 * 新增集团药剂
	 */
	@GetMapping("/groupadd")
	public String groupadd()
	{
		return prefixGroup + "/add";
	}


	/**
	 * 新增水厂药剂
	 */
	@GetMapping("/workadd")
	public String workadd()
	{
		return prefixWork + "/add";
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
	 * 新增平台药剂
	 **/
	@GetMapping("/platformadd")
	public String platformadd() {return prefixPlatform + "/add"; }

	/**
	 * 新增保存药剂
	 */
	@RequiresPermissions("system:bizAgentia:add")
	@Log(title = "新增药剂", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(BizAgentia bizAgentia)
	{
		return toAjax(bizAgentiaService.insertBizAgentia(bizAgentia));
	}

	/**
	 * 新增保存集团药剂
	 */
	@RequiresPermissions("system:bizAgentiaGroup:add")
	@Log(title = "新增集团药剂", businessType = BusinessType.INSERT)
	@PostMapping("/groupadd")
	@ResponseBody
	public AjaxResult groupaddSave(BizAgentia bizAgentia)
	{
		return toAjax(bizAgentiaService.insertBizAgentia(bizAgentia));
	}

	/**
	 * 新增保存水厂药剂
	 */
	@RequiresPermissions("system:bizAgentiaWork:add")
	@Log(title = "新增水厂药剂", businessType = BusinessType.INSERT)
	@PostMapping("/workadd")
	@ResponseBody
	public AjaxResult workaddSave(BizAgentia bizAgentia)
	{
		return toAjax(bizAgentiaService.insertBizAgentia(bizAgentia));
	}

	/**
	 * 新增保存设备药剂
	 */
	@RequiresPermissions("system:bizAgentiaDevice:add")
	@Log(title = "新增设备药剂", businessType = BusinessType.INSERT)
	@PostMapping("/deviceadd")
	@ResponseBody
	public AjaxResult deviceaddSave(BizAgentia bizAgentia)
	{
		return toAjax(bizAgentiaService.insertBizAgentia(bizAgentia));
	}




	/**
	 * 修改药剂
	 */
	@GetMapping("/edit/{agentiaId}")
	public String edit(@PathVariable("agentiaId") Long agentiaId, ModelMap mmap)
	{
		BizAgentia bizAgentia = bizAgentiaService.selectBizAgentiaById(agentiaId);
		mmap.put("bizAgentia", bizAgentia);
	    return prefix + "/edit";
	}

	/**
	 * 修改集团药剂
	 */
	@GetMapping("/groupedit/{agentiaId}")
	public String groupedit(@PathVariable("agentiaId") Long agentiaId, ModelMap mmap)
	{
		BizAgentia bizAgentia = bizAgentiaService.selectBizAgentiaById(agentiaId);
		mmap.put("bizAgentia", bizAgentia);
		return prefixGroup + "/edit";
	}


	/**
	 * 修改集团药剂
	 */
	@GetMapping("/workedit/{agentiaId}")
	public String workedit(@PathVariable("agentiaId") Long agentiaId, ModelMap mmap)
	{
		BizAgentia bizAgentia = bizAgentiaService.selectBizAgentiaById(agentiaId);
		mmap.put("bizAgentia", bizAgentia);
		return prefixWork + "/edit";
	}

	/**
	 * 修改设备药剂
	 */
	@GetMapping("/deviceedit/{agentiaId}")
	public String deviceedit(@PathVariable("agentiaId") Long agentiaId, ModelMap mmap)
	{
		BizAgentia bizAgentia = bizAgentiaService.selectDeviceAgentiaById(agentiaId);
		mmap.put("bizAgentia", bizAgentia);
		return prefixDevice + "/edit";
	}

	/**
	 * 修改平台药剂
	 */
	@GetMapping("/platformedit/{agentiaId}")
	public String platformedit(@PathVariable("agentiaId") Long agentiaId, ModelMap mmap)
	{
		BizAgentia bizAgentia = bizAgentiaService.selectBizAgentiaById(agentiaId);
		mmap.put("bizAgentia", bizAgentia);
		return prefixPlatform + "/edit";
	}

	/**
	 * 修改保存药剂
	 */
	@RequiresPermissions("system:bizAgentia:edit")
	@Log(title = "药剂", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(BizAgentia bizAgentia)
	{
		return toAjax(bizAgentiaService.updateBizAgentia(bizAgentia));
	}

	/**
	 * 修改保存集团药剂
	 */
	@RequiresPermissions("system:bizAgentiaGroup:edit")
	@Log(title = "集团药剂信息修改", businessType = BusinessType.UPDATE)
	@PostMapping("/groupedit")
	@ResponseBody
	public AjaxResult groupeditSave(BizAgentia bizAgentia)
	{
		return toAjax(bizAgentiaService.updateBizAgentia(bizAgentia));
	}

	/**
	 * 修改保存集团药剂
	 */
	@RequiresPermissions("system:bizAgentiaWork:edit")
	@Log(title = "水厂药剂信息修改", businessType = BusinessType.UPDATE)
	@PostMapping("/workedit")
	@ResponseBody
	public AjaxResult workeditSave(BizAgentia bizAgentia)
	{
		return toAjax(bizAgentiaService.updateBizAgentia(bizAgentia));
	}

	/**
	 * 修改保存设备药剂
	 */
	@RequiresPermissions("system:bizAgentiaDevice:edit")
	@Log(title = "设备药剂信息修改", businessType = BusinessType.UPDATE)
	@PostMapping("/deviceedit")
	@ResponseBody
	public AjaxResult deviceeditSave(BizAgentia bizAgentia)
	{
		return toAjax(bizAgentiaService.updateBizAgentia(bizAgentia));
	}

	/**
	 * 修改保存平台药剂
	 */
	@RequiresPermissions("system:bizAgentiaDevice:edit")
	@Log(title = "平台药剂信息修改", businessType = BusinessType.UPDATE)
	@PostMapping("/platformeditSave")
	@ResponseBody
	public AjaxResult platformeditSave(BizAgentia bizAgentia)
	{
		return toAjax(bizAgentiaService.updateBizAgentia(bizAgentia));
	}

	/**
	 * 删除药剂
	 */
	@RequiresPermissions("system:bizAgentia:remove")
	@Log(title = "删除药剂", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{
		return toAjax(bizAgentiaService.deleteBizAgentiaByIds(ids));
	}

	/**
	 * 删除药剂
	 */
	@RequiresPermissions("system:bizAgentiaGroup:remove")
	@Log(title = "删除药剂", businessType = BusinessType.DELETE)
	@PostMapping( "/groupremove")
	@ResponseBody
	public AjaxResult groupremove(String ids)
	{
		return toAjax(bizAgentiaService.deleteBizAgentiaByIds(ids));
	}

	/**
	 * 删除药剂
	 */
	@RequiresPermissions("system:bizAgentiaWork:remove")
	@Log(title = "删除药剂", businessType = BusinessType.DELETE)
	@PostMapping( "/workremove")
	@ResponseBody
	public AjaxResult workremove(String ids)
	{
		return toAjax(bizAgentiaService.deleteBizAgentiaByIds(ids));
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
		return toAjax(bizAgentiaService.deleteBizAgentiaByIds(ids));
	}


	/**
	 * 删除平台药剂
	 */
	@RequiresPermissions("system:bizAgentiaDevice:remove")
	@Log(title = "删除平台药剂", businessType = BusinessType.DELETE)
	@PostMapping( "/platformremove")
	@ResponseBody
	public AjaxResult platformremove(String ids)
	{
		return toAjax(bizAgentiaService.deleteBizAgentiaByIds(ids));
	}


	/**
	 * 查询药剂维护记录
	 */
	@GetMapping("/getRecord/{agentiaId}")
	public String getRecord(@PathVariable("agentiaId") Long agentiaId, ModelMap mmap)
	{
		mmap.put("bizAgentia",  bizDeviceAgentiaService.selectDeviceAgentiaById(agentiaId));
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
	 * 修改集团药剂量
	 */
	@GetMapping("/changeGroupAgentia/{agentiaId}")
	public String changeGroupAgentia(@PathVariable("agentiaId") Long agentiaId, ModelMap mmap)
	{
		BizAgentia bizAgentia = bizAgentiaService.selectDeviceAgentiaById(agentiaId);
		mmap.put("bizAgentia", bizAgentia);
		return prefixGroup + "/doseEdit";
	}

	/**
	 * 修改水厂药剂量
	 */
	@GetMapping("/changeWorkAgentia/{agentiaId}")
	public String changeWorkAgentia(@PathVariable("agentiaId") Long agentiaId, ModelMap mmap)
	{
		BizAgentia bizAgentia = bizAgentiaService.selectDeviceAgentiaById(agentiaId);
		mmap.put("bizAgentia", bizAgentia);
		return prefixWork + "/doseEdit";
	}
	/**
	 * 修改设备药剂量
	 */
	@GetMapping("/changeAgentia/{agentiaId}")
	public String changeAgentia(@PathVariable("agentiaId") Long agentiaId, ModelMap mmap)
	{
		BizAgentia bizAgentia = bizAgentiaService.selectDeviceAgentiaById(agentiaId);
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

		BizAgentia bizAgentia = bizAgentiaService.selectDeviceAgentiaById(agentiaId);
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
		bizAgentiaService.updateBizAgentia(bizAgentia);

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

	/**
	 * 平台药剂下发
	 */
	@GetMapping("/addPlatformDist")
	public String addPlatformDist(ModelMap mmap)
	{

		mmap.put("worksId", "212");
		return prefixPlatform + "/addPlatformDist";
	}

	/**
	 * 修改保存平台药剂
	 */
	@RequiresPermissions("system:bizAgentiaPlatform:dist")
	@Log(title = "平台药剂下发", businessType = BusinessType.UPDATE)
	@PostMapping("/addPlatformDist")
	@ResponseBody
	public AjaxResult PlatformDistSave(BizAgentiaSend bizAgentiaSend)
	{
		long agentiaId = bizAgentiaSend.getAgentiaId();
		BizAgentia agentia = bizAgentiaService.selectBizAgentiaById(agentiaId);
		float remain = agentia.getAgentiaRemain();
		float total = agentia.getAgentiaTotal();
		float distTotal =bizAgentiaSend.getSendTotal();
		total = total + distTotal;
		remain = remain - distTotal;
		agentia.setAgentiaRemain(remain);
		agentia.setAgentiaTotal(total);
		//更新药剂变更
		bizAgentiaService.updateBizAgentia(agentia);

		SimpleDateFormat format_date = new SimpleDateFormat("yyyy-MM-dd");
		bizAgentiaSend.setRecordDate(format_date.format(new Date()));
		return toAjax(bizAgentiaSendService.insertBizAgentiaSend(bizAgentiaSend));
	}

	@RequiresPermissions("system:bizAgentiaPlatform:dist")
	@GetMapping("/platformDist")
	public String platformDist()
	{
		return prefixPlatform + "/platformDist";
	}

	/**
	 * 查询平台药剂下发
	 */
	@RequiresPermissions("system:bizAgentiaPlatform:dist")
	@PostMapping("/platformDistlist")
	@ResponseBody
	public TableDataInfo platformDistlist(BizAgentiaSend bizAgentiaSend)
	{
		startPage();
		List<BizAgentiaSend> list = new ArrayList<BizAgentiaSend>();
		bizAgentiaSend.setSendType("1");
		list = bizAgentiaSendService.selectBizAgentiaSendList(bizAgentiaSend);
		return getDataTable(list);
	}


	/**
	 * 平台药剂下发
	 */
	@GetMapping("/addGroupDist")
	public String addGroupDist(ModelMap mmap)
	{

		return prefixGroup + "/addGroupDist";
	}

	/**
	 * 修改保存平台药剂
	 */
	@RequiresPermissions("system:bizAgentiaGroup:dist")
	@Log(title = "集团药剂下发", businessType = BusinessType.UPDATE)
	@PostMapping("/addGroupDist")
	@ResponseBody
	public AjaxResult GroupDistSave(BizAgentiaSend bizAgentiaSend)
	{
		long agentiaId = bizAgentiaSend.getAgentiaId();
		BizAgentia agentia = bizAgentiaService.selectBizAgentiaById(agentiaId);
		float remain = agentia.getAgentiaRemain();
		float total = agentia.getAgentiaTotal();
		float distTotal =bizAgentiaSend.getSendTotal();
		total = total + distTotal;
		remain = remain - distTotal;
		agentia.setAgentiaRemain(remain);
		agentia.setAgentiaTotal(total);
		//更新药剂变更
		bizAgentiaService.updateBizAgentia(agentia);

		SimpleDateFormat format_date = new SimpleDateFormat("yyyy-MM-dd");
		bizAgentiaSend.setRecordDate(format_date.format(new Date()));
		return toAjax(bizAgentiaSendService.insertBizAgentiaSend(bizAgentiaSend));
	}

	@RequiresPermissions("system:bizAgentiaGroup:dist")
	@GetMapping("/groupDist")
	public String groupDist()
	{
		return prefixGroup + "/groupDist";
	}


	/**
	 * 查询集团药剂接发
	 */
	@RequiresPermissions("system:bizAgentiaGroup:dist")
	@PostMapping("/groupDistlist")
	@ResponseBody
	public TableDataInfo groupDistlist(BizAgentiaSend bizAgentiaSend)
	{
		startPage();
		StringBuilder sqlString = new StringBuilder();
		SysRole role = ShiroUtils.getSysUser().getRole();
		String dataScope = role.getDataScope();
		if ("1".equals(dataScope))
		{
			sqlString.append(" OR a.send_type ='1' OR a.send_type ='2'  ");
		} else  if ("2".equals(dataScope)){
			long worksId = ShiroUtils.getSysUser().getWorksId();
			sqlString.append(" OR (a.send_type ='1' and a.receive_works ="+worksId+") ");
			sqlString.append(" OR (a.send_type ='2' and a.send_works ="+worksId+") ");
		}
		if (StringUtils.isNotBlank(sqlString.toString()))
		{
			bizAgentiaSend.getParams().put("dataScope", " AND (" + sqlString.substring(4) + ")");
		}
		List<BizAgentiaSend>  list = bizAgentiaSendService.selectBizAgentiaSendList(bizAgentiaSend);
		return getDataTable(list);
	}


	/**
	 * 取消平台药剂下发
	 */
	@RequiresPermissions("system:bizAgentiaPlatform:dist")
	@Log(title = "取消平台药剂下发", businessType = BusinessType.UPDATE)
	@PostMapping( "/cancelPlatformDist")
	@ResponseBody
	public AjaxResult cancelDist(long recordId)
	{
		BizAgentiaSend bizAgentiaSend = bizAgentiaSendService.selectBizAgentiaSendById(recordId);
		long agentiaId = bizAgentiaSend.getAgentiaId();
		BizAgentia agentia = bizAgentiaService.selectBizAgentiaById(agentiaId);

		float distTotal =bizAgentiaSend.getSendTotal();
		float remain = agentia.getAgentiaRemain();
		float total = agentia.getAgentiaTotal();
		total = total - distTotal;
		remain = remain + distTotal;
		agentia.setAgentiaRemain(remain);
		agentia.setAgentiaTotal(total);
		//更新药剂变更
		bizAgentiaService.updateBizAgentia(agentia);
		bizAgentiaSend.setRecordStatus("3");

		return toAjax(bizAgentiaSendService.updateBizAgentiaSend(bizAgentiaSend));
	}

	/**
	 * 取消集团药剂下发
	 */
	@RequiresPermissions("system:bizAgentiaGroup:dist")
	@Log(title = "取消药剂下发", businessType = BusinessType.UPDATE)
	@PostMapping( "/cancelGroupDist")
	@ResponseBody
	public AjaxResult cancelGroupDist(long recordId)
	{
		BizAgentiaSend bizAgentiaSend = bizAgentiaSendService.selectBizAgentiaSendById(recordId);
		long agentiaId = bizAgentiaSend.getAgentiaId();
		BizAgentia agentia = bizAgentiaService.selectBizAgentiaById(agentiaId);

		float distTotal =bizAgentiaSend.getSendTotal();
		float remain = agentia.getAgentiaRemain();
		float total = agentia.getAgentiaTotal();
		total = total - distTotal;
		remain = remain + distTotal;
		agentia.setAgentiaRemain(remain);
		agentia.setAgentiaTotal(total);
		//更新药剂变更
		bizAgentiaService.updateBizAgentia(agentia);
		bizAgentiaSend.setRecordStatus("3");

		return toAjax(bizAgentiaSendService.updateBizAgentiaSend(bizAgentiaSend));
	}



	/**
	 * 集团接受下发
	 */
	@RequiresPermissions("system:bizAgentiaGroup:dist")
	@Log(title = "取消药剂下发", businessType = BusinessType.UPDATE)
	@PostMapping( "/sureGroupDist")
	@ResponseBody
	public AjaxResult sureGroupDist(long recordId)
	{
		BizAgentiaSend bizAgentiaSend = bizAgentiaSendService.selectBizAgentiaSendById(recordId);
		long agentiaId = bizAgentiaSend.getAgentiaId();
		long receiveId = bizAgentiaSend.getReceiveWorks();
		float sendtotal = bizAgentiaSend.getSendTotal();
		BizAgentia agentia = bizAgentiaService.selectBizAgentiaById(agentiaId);
		String agentiaName =agentia.getAgentiaName();
		String agentiaNo =agentia.getAgentiaNo();

		BizAgentia Groupagentia = new BizAgentia();
		Groupagentia.setAgentiaNo(agentiaNo);
		Groupagentia.setAgentiaName(agentiaName);
		Groupagentia.setAgentiaBelong(receiveId);
		Groupagentia.setAgentiaType("2");
		List<BizAgentia> GroupagentiaList = bizAgentiaService.selectBizAgentiaList(Groupagentia);
		if(GroupagentiaList.size()==1){
			BizAgentia agentiaOld = GroupagentiaList.get(0);
			float oldremain = agentiaOld.getAgentiaRemain();
			oldremain = oldremain + sendtotal;
			agentiaOld.setAgentiaRemain(oldremain);
			bizAgentiaService.updateBizAgentia(agentiaOld);
		}else{
			Groupagentia.setAgentiaTotal((float)0);
			Groupagentia.setAgentiaRemain(sendtotal);
			Groupagentia.setAgentiaAlert((float)0);
			bizAgentiaService.insertBizAgentia(Groupagentia);
		}

		bizAgentiaSend.setRecordStatus("1");
		return toAjax(bizAgentiaSendService.updateBizAgentiaSend(bizAgentiaSend));
	}

	/**
	 * 拒绝平台药剂下发
	 */
	@RequiresPermissions("system:bizAgentiaGroup:dist")
	@Log(title = "拒绝平台药剂下发", businessType = BusinessType.UPDATE)
	@PostMapping( "/refuseGroupDist")
	@ResponseBody
	public AjaxResult refuseGroupDist(long recordId)
	{
		BizAgentiaSend bizAgentiaSend = bizAgentiaSendService.selectBizAgentiaSendById(recordId);
		long agentiaId = bizAgentiaSend.getAgentiaId();
		BizAgentia agentia = bizAgentiaService.selectBizAgentiaById(agentiaId);

		float distTotal =bizAgentiaSend.getSendTotal();
		float remain = agentia.getAgentiaRemain();
		float total = agentia.getAgentiaTotal();
		total = total - distTotal;
		remain = remain + distTotal;
		agentia.setAgentiaRemain(remain);
		agentia.setAgentiaTotal(total);
		//更新药剂变更
		bizAgentiaService.updateBizAgentia(agentia);
		bizAgentiaSend.setRecordStatus("2");

		return toAjax(bizAgentiaSendService.updateBizAgentiaSend(bizAgentiaSend));
	}




	@RequiresPermissions("system:bizAgentiaWork:dist")
	@GetMapping("/workDist")
	public String workDist()
	{
		return prefixWork + "/workDist";
	}


	/**
	 * 查询集团药剂接发
	 */
	@RequiresPermissions("system:bizAgentiaWork:dist")
	@PostMapping("/workDistlist")
	@ResponseBody
	public TableDataInfo workDistlist(BizAgentiaSend bizAgentiaSend)
	{
		startPage();
		StringBuilder sqlString = new StringBuilder();
		SysRole role = ShiroUtils.getSysUser().getRole();
		long worksId = ShiroUtils.getSysUser().getWorksId();
		String dataScope = role.getDataScope();
		if ("1".equals(dataScope))
		{
			sqlString.append(" OR  a.send_type ='2'  ");
		} else  if ("2".equals(dataScope)){
			sqlString.append(" OR (a.send_type ='2' and a.send_works ="+worksId+") ");
		} else  if ("3".equals(dataScope)){
			sqlString.append(" OR (a.send_type ='2' and a.receive_works ="+worksId+") ");
		}
		if (StringUtils.isNotBlank(sqlString.toString()))
		{
			bizAgentiaSend.getParams().put("dataScope", " AND (" + sqlString.substring(4) + ")");
		}
		List<BizAgentiaSend>  list = bizAgentiaSendService.selectBizAgentiaSendList(bizAgentiaSend);
		return getDataTable(list);
	}


	/**
	 * 水厂接收下发
	 */
	@RequiresPermissions("system:bizAgentiaWork:dist")
	@Log(title = "接收药剂下发", businessType = BusinessType.UPDATE)
	@PostMapping( "/sureWorkDist")
	@ResponseBody
	public AjaxResult sureWorkDist(long recordId)
	{
		BizAgentiaSend bizAgentiaSend = bizAgentiaSendService.selectBizAgentiaSendById(recordId);
		long agentiaId = bizAgentiaSend.getAgentiaId();
		long receiveId = bizAgentiaSend.getReceiveWorks();
		float sendtotal = bizAgentiaSend.getSendTotal();
		BizAgentia agentia = bizAgentiaService.selectBizAgentiaById(agentiaId);
		String agentiaName =agentia.getAgentiaName();
		String agentiaNo =agentia.getAgentiaNo();

		BizAgentia Workagentia = new BizAgentia();
		Workagentia.setAgentiaNo(agentiaNo);
		Workagentia.setAgentiaName(agentiaName);
		Workagentia.setAgentiaBelong(receiveId);
		Workagentia.setAgentiaType("3");
		List<BizAgentia> GroupagentiaList = bizAgentiaService.selectBizAgentiaList(Workagentia);
		if(GroupagentiaList.size()==1){
			BizAgentia agentiaOld = GroupagentiaList.get(0);
			float oldremain = agentiaOld.getAgentiaRemain();
			oldremain = oldremain + sendtotal;
			agentiaOld.setAgentiaRemain(oldremain);
			bizAgentiaService.updateBizAgentia(agentiaOld);
		}else{
			Workagentia.setAgentiaTotal((float)0);
			Workagentia.setAgentiaRemain(sendtotal);
			Workagentia.setAgentiaAlert((float)0);
			bizAgentiaService.insertBizAgentia(Workagentia);
		}

		bizAgentiaSend.setRecordStatus("1");
		return toAjax(bizAgentiaSendService.updateBizAgentiaSend(bizAgentiaSend));
	}

	/**
	 * 拒绝集团药剂下发
	 */
	@RequiresPermissions("system:bizAgentiaWork:dist")
	@Log(title = "拒绝集团药剂下发", businessType = BusinessType.UPDATE)
	@PostMapping( "/refuseWorkDist")
	@ResponseBody
	public AjaxResult refuseWorkDist(long recordId)
	{
		BizAgentiaSend bizAgentiaSend = bizAgentiaSendService.selectBizAgentiaSendById(recordId);
		long agentiaId = bizAgentiaSend.getAgentiaId();
		BizAgentia agentia = bizAgentiaService.selectBizAgentiaById(agentiaId);

		float distTotal =bizAgentiaSend.getSendTotal();
		float remain = agentia.getAgentiaRemain();
		float total = agentia.getAgentiaTotal();
		total = total - distTotal;
		remain = remain + distTotal;
		agentia.setAgentiaRemain(remain);
		agentia.setAgentiaTotal(total);
		//更新药剂变更
		bizAgentiaService.updateBizAgentia(agentia);
		bizAgentiaSend.setRecordStatus("2");

		return toAjax(bizAgentiaSendService.updateBizAgentiaSend(bizAgentiaSend));
	}



	/**
	 * 水厂药剂下发
	 */
	@GetMapping("/addWorkMake")
	public String addWorkMake(ModelMap mmap)
	{

		return prefixWork + "/addWorkMake";
	}

	/**
	 * 修改保存水厂药剂配制
	 */
	@RequiresPermissions("system:bizAgentiaWork:dist")
	@Log(title = "水厂药剂配制", businessType = BusinessType.UPDATE)
	@PostMapping("/addWorkMake")
	@ResponseBody
	public AjaxResult WorkDistSave(BizAgentiaMake bizAgentiaMake)
	{
		long agentiaId = bizAgentiaMake.getAgentiaId();
		BizAgentia agentia = bizAgentiaService.selectBizAgentiaById(agentiaId);
		float remain = agentia.getAgentiaRemain();
		float total = agentia.getAgentiaTotal();
		float distTotal =bizAgentiaMake.getSendTotal();
		total = total + distTotal;
		remain = remain - distTotal;
		agentia.setAgentiaRemain(remain);
		agentia.setAgentiaTotal(total);
		//更新药剂变更
		bizAgentiaService.updateBizAgentia(agentia);

		SimpleDateFormat format_date = new SimpleDateFormat("yyyy-MM-dd");
		bizAgentiaMake.setRecordDate(format_date.format(new Date()));
		return toAjax(bizAgentiaMakeService.insertBizAgentiaMake(bizAgentiaMake));
	}


	@RequiresPermissions("system:bizAgentiaWork:dist")
	@GetMapping("/workMake")
	public String workMake()
	{
		return prefixWork + "/workMake";
	}


	/**
	 * 查询集团药剂接发
	 */
	@RequiresPermissions("system:bizAgentiaWork:dist")
	@PostMapping("/workMakelist")
	@ResponseBody
	public TableDataInfo workMakelist(BizAgentiaMake bizAgentiaMake)
	{
		startPage();
		StringBuilder sqlString = new StringBuilder();
		SysRole role = ShiroUtils.getSysUser().getRole();
		long worksId = ShiroUtils.getSysUser().getWorksId();
		String dataScope = role.getDataScope();
		if ("3".equals(dataScope)){
			sqlString.append(" OR  a.send_works ="+worksId+" ");
		}
		if (StringUtils.isNotBlank(sqlString.toString()))
		{
			bizAgentiaMake.getParams().put("dataScope", " AND (" + sqlString.substring(4) + ")");
		}
		List<BizAgentiaMake>  list = bizAgentiaMakeService.selectBizAgentiaMakeList(bizAgentiaMake);
		return getDataTable(list);
	}


	/**
	 * 取消药剂配制
	 */
	@RequiresPermissions("system:bizAgentiaWork:dist")
	@Log(title = "取消药剂配制", businessType = BusinessType.UPDATE)
	@PostMapping( "/cancelWorkMake")
	@ResponseBody
	public AjaxResult cancelWorkMake(long recordId)
	{
		BizAgentiaMake bizAgentiaMake = bizAgentiaMakeService.selectBizAgentiaMakeById(recordId);
		long agentiaId = bizAgentiaMake.getAgentiaId();
		BizAgentia agentia = bizAgentiaService.selectBizAgentiaById(agentiaId);

		float distTotal =bizAgentiaMake.getSendTotal();
		float remain = agentia.getAgentiaRemain();
		float total = agentia.getAgentiaTotal();
		total = total - distTotal;
		remain = remain + distTotal;
		agentia.setAgentiaRemain(remain);
		agentia.setAgentiaTotal(total);
		//更新药剂变更
		bizAgentiaService.updateBizAgentia(agentia);
		bizAgentiaMake.setRecordStatus("3");

		return toAjax(bizAgentiaMakeService.updateBizAgentiaMake(bizAgentiaMake));
	}

}
