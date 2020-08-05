package com.ruoyi.web.controller.system;

import com.deepoove.poi.data.MiniTableRenderData;
import com.deepoove.poi.data.RowRenderData;
import com.deepoove.poi.data.TextRenderData;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.DocUtil;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.service.*;
import net.sf.json.JSONObject;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 化验结果 信息操作处理
 * 
 * @author ruoyi
 * @date 2019-11-29
 */
@Controller
@RequestMapping("/system/bizAssay")
public class BizAssayController extends BaseController
{
    private String prefix = "system/bizAssay";
	
	@Autowired
	private IBizAssayService bizAssayService;
	@Autowired
	private IAssayResultService assayResultService;
	@Autowired
	private IAssaySampleService assaySampleService;
	@Autowired
	private IAssayFaultService assayFaultService;
	@Autowired
	private IBizWaterWorkService waterWorkService;


	
	@RequiresPermissions("system:bizAssay:view")
	@GetMapping()
	public String bizAssay()
	{
	    return prefix + "/bizAssay";
	}
	
	/**
	 * 查询化验结果列表
	 */
	@RequiresPermissions("system:bizAssay:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(BizAssay bizAssay)
	{
		startPage();
		//区域中心，水厂判断
		StringBuilder sqlString = new StringBuilder();
		SysRole role = ShiroUtils.getSysUser().getRole();
		long worksId = ShiroUtils.getSysUser().getWorksId();
		String dataScope = role.getDataScope();
		if ("1".equals(dataScope))
		{
			sqlString = new StringBuilder();
		}
		else if ("2".equals(dataScope))
		{
			sqlString.append(StringUtils.format(
					"{}.device_no in (select d.device_no from biz_device d where d.device_works in (select w.works_id from biz_water_work w where w.parent_id = {})) ", "r",
					worksId));
		}else if ("3".equals(dataScope))
		{
			sqlString.append(StringUtils.format(
					"{}.device_no in (select d.device_no from biz_device d where d.device_works = {}) ", "r",
					worksId));
		}else if ("4".equals(dataScope))
		{
			sqlString.append(StringUtils.format(
					"{}.device_no = (select d.device_no from biz_device d where d.device_works = {}) ", "r",
					worksId));sqlString.append(StringUtils.format(
				"or {}.device_no in (select d.device_no from biz_device d where d.device_works in(SELECT rd.water_id from biz_area_water rd where rd.area_id = {})) ", "r",
				worksId));
		}
		if (StringUtils.isNotBlank(sqlString.toString()))
		{
			bizAssay.getParams().put("dataScope", " AND (" + sqlString.substring(0) + ")");
		}
        List<BizAssay> list = bizAssayService.selectBizAssayList(bizAssay);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出化验结果列表
	 */
	@RequiresPermissions("system:bizAssay:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BizAssay bizAssay)
    {
    	List<BizAssay> list = bizAssayService.selectBizAssayList(bizAssay);
        ExcelUtil<BizAssay> util = new ExcelUtil<BizAssay>(BizAssay.class);
        return util.exportExcel(list, "bizAssay");
    }
	
	/**
	 * 新增化验结果
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}
	
	/**
	 * 新增保存化验结果
	 */
	@RequiresPermissions("system:bizAssay:add")
	@Log(title = "新增化验结果", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(BizAssay bizAssay)
	{		
		return toAjax(bizAssayService.insertBizAssay(bizAssay));
	}

	/**
	 * 查看化验结果
	 */
	@GetMapping("/check/{assayId}")
	public String check(@PathVariable("assayId") Long assayId, ModelMap mmap)
	{
		BizAssay bizAssay = bizAssayService.selectBizAssayById(assayId);
		mmap.put("bizAssay", bizAssay);
		return prefix + "/check";
	}

	/**
	 * 修改化验结果
	 */
	@GetMapping("/edit/{assayId}")
	public String edit(@PathVariable("assayId") Long assayId, ModelMap mmap)
	{
		BizAssay bizAssay = bizAssayService.selectBizAssayById(assayId);
		mmap.put("bizAssay", bizAssay);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存化验结果
	 */
	@RequiresPermissions("system:bizAssay:edit")
	@Log(title = "修改化验结果", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(BizAssay bizAssay)
	{
		return toAjax(bizAssayService.updateBizAssay(bizAssay));
	}
	
	/**
	 * 删除化验结果
	 */
	@RequiresPermissions("system:bizAssay:remove")
	@Log(title = "删除化验结果", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(bizAssayService.deleteBizAssayByIds(ids));
	}


	@RequiresPermissions("system:bizAssay:list")
	@GetMapping("/assayReport")
	public String assayReport()
	{
		return prefix + "/assayReport";
	}



	@RequiresPermissions("system:bizAssay:list")
	@GetMapping("/result/{assayNo}")
	public String result(@PathVariable("assayNo") String assayNo, ModelMap mmap)
	{
		mmap.put("assayNo", assayNo);
		return "system/bizAssay/bizAssayResult";
	}


	/**
	 * 查询化验结果列表
	 */
	@RequiresPermissions("system:bizAssay:list")
	@PostMapping("/listResult")
	@ResponseBody
	public TableDataInfo listResult(AssayResult assayResult)
	{
		startPage();
		//区域中心，水厂判断
		List<AssayResult> list = assayResultService.selectAssayResultList(assayResult);
		return getDataTable(list);
	}



	@RequiresPermissions("system:bizAssay:edit")
	@GetMapping("/setSample/{assayNo}")
	public String setSample(@PathVariable("assayNo") String assayNo, ModelMap mmap)
	{
		mmap.put("assayNo", assayNo);
		List<AssaySample> sampleList = assaySampleService.getSampleByAssayno(assayNo);
		mmap.put("sampleList", sampleList);
		return "system/bizAssay/bizAssaySample";
	}



	@RequiresPermissions("system:bizAssay:edit")
	@Log(title = "修改化验样品", businessType = BusinessType.UPDATE)
	@PostMapping("/assaySample")
	@ResponseBody
	public AjaxResult assaySample(@RequestBody  List<AssaySample> sampleList){

		for(AssaySample sample:sampleList){

			String assayNo=sample.getAssayNo();
			String sampleNo=sample.getSampleNo();
			assaySampleService.deleteByAssaySample(assayNo,sampleNo);
			assaySampleService.insertAssaySample(sample);
		}
		return success();
	}



	@RequiresPermissions("system:bizAssay:list")
	@GetMapping("/getFault/{assayNo}")
	public String getFault(@PathVariable("assayNo") String assayNo, ModelMap mmap)
	{
		mmap.put("assayNo", assayNo);
		return "system/bizAssay/bizAssayFault";
	}

	/**
	 * 查询化验结果列表
	 */
	@RequiresPermissions("system:bizAssay:list")
	@PostMapping("/listFault")
	@ResponseBody
	public TableDataInfo listFault(AssayFault assayFault)
	{
		startPage();
		//区域中心，水厂判断
		List<AssayFault> list = assayFaultService.selectAssayFaultList(assayFault);
		return getDataTable(list);
	}




	@RequiresPermissions("system:bizAssay:list")
	@GetMapping("/assayDetails/{assayNo}")
	public String assayDetails(@PathVariable("assayNo") String assayNo, ModelMap mmap)
	{
		BizAssay assay = bizAssayService.selectBizAssayByAssayNo(assayNo);
		if(assay!=null){
			mmap.put("assayDate",assay.getAssayDate());
			BizWaterWork work = waterWorkService.selectBizWaterWorkById(assay.getDevice().getDeviceWorks());
			if(work!=null){
				mmap.put("worksName",work.getWorksName());
				mmap.put("Sname", "");
			}
		}

		List<AssayResult> resultList = assayResultService.selectAssayResultByAssayNo(assayNo);
		for(AssayResult result : resultList ){
			String r_no =result.getResultNo();
			if("001".equals(r_no)){
				//in_nh
				mmap.put("inNh", result.getResultConcentration());
				mmap.put("inNh_As", result.getResultAbs());
			}else if("002".equals(r_no)){
				//out_nh
				mmap.put("outNh", result.getResultConcentration());
				mmap.put("outNh_As", result.getResultAbs());
			}else if("003".equals(r_no)){
				//in_tp
				mmap.put("inTp", result.getResultConcentration());
				mmap.put("inTp_As", result.getResultAbs());
			}else if("004".equals(r_no)){
				//out_tp
				mmap.put("outTp", result.getResultConcentration());
				mmap.put("outTp_As", result.getResultAbs());
			}else if("005".equals(r_no)){
				//in_tn
				mmap.put("inTn", result.getResultConcentration());
				mmap.put("inTn_As", result.getResultAbs());
			}else if("006".equals(r_no)){
				//out_tn
				mmap.put("outTn", result.getResultConcentration());
				mmap.put("outTn_As", result.getResultAbs());
			}else if("007".equals(r_no)){
				//in_cod
				mmap.put("inCod", result.getResultConcentration());
				mmap.put("inCod_As", result.getResultAbs());
			}else if("008".equals(r_no)){
				//out_cod
				mmap.put("outCod", result.getResultConcentration());
				mmap.put("outCod_As", result.getResultAbs());
			}

		}

		DecimalFormat decimalFormat=new DecimalFormat("0.000");

		mmap.put("assayNo", assayNo);
		return prefix + "/assayDetails";
	}


	@GetMapping("/getDoc/{assayNo}/{obj}")
	@ResponseBody
	public String  gettnDoc(@PathVariable("assayNo") String assayNo,@PathVariable("obj") String obj,HttpServletRequest request, HttpServletResponse response) throws IOException {
//		List<Map<String,Object>> mapList =  new ArrayList<>();
//		Map<String,Object> map =  new HashMap<>();
//		RowRenderData header = RowRenderData.build(new TextRenderData("序号"),new TextRenderData("名称"));
//		List<RowRenderData> listone = new ArrayList<>();
//		List<AssaySample> sampleList = assaySampleService.getSampleByAssayno(assayNo);
//		Integer count=0;
//		for(AssaySample sample:sampleList){
//			RowRenderData good = RowRenderData.build(count.toString(),sample.getSampleName());
//			listone.add(good);
//			count++;
//		}
//		map.put("table", new MiniTableRenderData(header,listone));
//		map.put("orderno", assayNo);

		Map<String,Object> map =  new HashMap<>();
		BizAssay assay = bizAssayService.selectBizAssayByAssayNo(assayNo);
		List<AssayResult> resultList =assayResultService.selectAssayResultByAssayNo(assayNo);

		if(assay!=null){
			BizWaterWork work = waterWorkService.selectBizWaterWorkById(assay.getDevice().getDeviceWorks());

			map.put("orderno", assayNo);
			map.put("assaydate", assay.getAssayDate());
			if(work!=null){
				map.put("workname", work.getWorksName());
			}
			map.put("assaymethod", "HJ399-2007化学需氧量的测定 快速消解分光光度法");
			if(resultList!=null){
				for(AssayResult result:resultList){
					String r_no = result.getResultNo();
					if("007".equals(r_no)){
						map.put("incod_v", result.getSampleVolume()+"");
						map.put("incod_As", result.getResultAbs()+"");
						map.put("incod_re1", result.getResultConcentration()+"");
						map.put("incod_re2", result.getResultConcentration()+"");
					}else if("008".equals(r_no)){
						map.put("outcod_v1", result.getSampleVolume()+"");
						map.put("outcod_As1", result.getResultAbs()+"");
						map.put("outcod_re1_1", result.getResultConcentration()+"");
						map.put("outcod_re2", result.getResultConcentration()+"");
					}
				}
			}

		}

		String newWordName = "COD分析项目原始记录.doc";
		DocUtil.download(request,response,"COD分析项目原始记录.docx",newWordName, map);
		return prefix + "/getdoc";
	}

}
