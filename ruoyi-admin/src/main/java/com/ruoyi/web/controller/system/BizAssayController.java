package com.ruoyi.web.controller.system;

import com.deepoove.poi.XWPFTemplate;
import com.deepoove.poi.config.Configure;
import com.deepoove.poi.data.MiniTableRenderData;
import com.deepoove.poi.data.RowRenderData;
import com.deepoove.poi.data.TextRenderData;
import com.deepoove.poi.policy.DynamicTableRenderPolicy;
import com.google.gson.Gson;
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
import com.ruoyi.system.model.AssayData;
import com.ruoyi.system.model.AssayTablePolicy;
import com.ruoyi.system.model.AssayTotalData;
import com.ruoyi.system.service.*;
import net.sf.json.JSONObject;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
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
	@Autowired
	private IAssayCurveService assayCurveService;


	
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

		AssayCurve curve_cod = assayCurveService.selectAssayCurveByCurveNo("1");
		mmap.put("CODparameter", curve_cod);
		AssayCurve curve_tp = assayCurveService.selectAssayCurveByCurveNo("2");
		mmap.put("TPparameter", curve_tp);
		AssayCurve curve_tn = assayCurveService.selectAssayCurveByCurveNo("3");
		mmap.put("TNparameter", curve_tn);
		AssayCurve curve_nh = assayCurveService.selectAssayCurveByCurveNo("4");
		mmap.put("NHparameter", curve_nh);

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

			AssayCurve curve =new AssayCurve();

			if("cod".equals(obj)){
				map.put("assaymethod", "HJ399-2007化学需氧量的测定 快速消解分光光度法");
				 curve = assayCurveService.selectAssayCurveByCurveNo("1");
			}else if(("tp".equals(obj))){
				map.put("assaymethod", "GB11893-1989水质总磷的测定钼酸铵分光光度法");
				 curve = assayCurveService.selectAssayCurveByCurveNo("2");
			}else if(("tn".equals(obj))){
				map.put("assaymethod", "HJ636-2012水质总氮的测定碱性过硫酸钾消解紫外分光光度法");
				 curve = assayCurveService.selectAssayCurveByCurveNo("3");
			}else if(("nh".equals(obj))){
				map.put("assaymethod", "HJ535-2009水质氨氮的测定纳氏试剂分光光度法");
				 curve = assayCurveService.selectAssayCurveByCurveNo("4");
			}
			map.put("ug1", curve.getCurveCon1());map.put("OD1", curve.getCurveAbs1());
			map.put("ug2", curve.getCurveCon2());map.put("OD2", curve.getCurveAbs2());
			map.put("ug3", curve.getCurveCon3());map.put("OD3", curve.getCurveAbs3());
			map.put("ug4", curve.getCurveCon4());map.put("OD4", curve.getCurveAbs4());
			map.put("ug5", curve.getCurveCon5());map.put("OD5", curve.getCurveAbs5());
			map.put("ug6", curve.getCurveCon6());map.put("OD6", curve.getCurveAbs6());
			map.put("ug7", curve.getCurveCon7());map.put("OD7", curve.getCurveAbs7());
//			map.put("b", curve.getCurveB());
//			map.put("a", curve.getCurveA());
			map.put("r", curve.getCurveR());

			if(resultList!=null){
				for(AssayResult result:resultList){
					String r_no = result.getResultNo();
					if("cod".equals(obj)){
						if("007".equals(r_no)){
							map.put("incod_v", result.getSampleVolume()+"");
							map.put("incod_As", result.getResultAbs()+"");
							map.put("incod_re1", result.getResultConcentration()+"");
							map.put("incod_re2", result.getResultConcentration()+"");
						}
						if("008".equals(r_no)){
							map.put("outcod_v1", result.getSampleVolume()+"");
							map.put("outcod_As1", result.getResultAbs()+"");
							map.put("outcod_re1_1", result.getResultConcentration()+"");
							map.put("outcod_re2", result.getResultConcentration()+"");
						}
					}else if("tp".equals(obj)){
						if("003".equals(r_no)){
							map.put("intp_v", result.getSampleVolume()+"");
							map.put("intp_As", result.getResultAbs()+"");
							map.put("intp_re1", result.getResultConcentration()+"");
							map.put("intp_re2", result.getResultConcentration()+"");
						}
						if("004".equals(r_no)){
							map.put("outtp_v1", result.getSampleVolume()+"");
							map.put("outtp_As1", result.getResultAbs()+"");
							map.put("outtp_re1_1", result.getResultConcentration()+"");
							map.put("outtp_re2", result.getResultConcentration()+"");
						}
					}else if("tn".equals(obj)){
						if("005".equals(r_no)){
							map.put("intn_v", result.getSampleVolume()+"");
							map.put("intn_As", result.getResultAbs()+"");
							map.put("intn_re1", result.getResultConcentration()+"");
							map.put("intn_re2", result.getResultConcentration()+"");
						}
						if("006".equals(r_no)){
							map.put("outtn_v1", result.getSampleVolume()+"");
							map.put("outtn_As1", result.getResultAbs()+"");
							map.put("outtn_re1_1", result.getResultConcentration()+"");
							map.put("outtn_re2", result.getResultConcentration()+"");
						}
					}else if("nh".equals(obj)){
						if("001".equals(r_no)){
							map.put("innh_v", result.getSampleVolume()+"");
							map.put("innh_As", result.getResultAbs()+"");
							map.put("innh_re1", result.getResultConcentration()+"");
							map.put("innh_re2", result.getResultConcentration()+"");
						}
						if("002".equals(r_no)){
							map.put("outnh_v1", result.getSampleVolume()+"");
							map.put("outnh_As1", result.getResultAbs()+"");
							map.put("outnh_re1_1", result.getResultConcentration()+"");
							map.put("outnh_re2", result.getResultConcentration()+"");
						}
					}

				}
			}

		}

		String docName = "";
		String docxName = "";
		if("cod".equals(obj)){
			 docName = "COD分析项目原始记录.doc";
			 docxName = "COD分析项目原始记录.docx";
		}else if(("tp".equals(obj))){
			docName = "总磷分析项目原始记录.doc";
			docxName = "总磷分析项目原始记录.docx";
		}else if(("tn".equals(obj))){
			docName = "总氮分析项目原始记录.doc";
			docxName = "总氮分析项目原始记录.docx";
		}else if(("nh".equals(obj))){
			docName = "氨氮分析项目原始记录.doc";
			docxName = "氨氮分析项目原始记录.docx";
		}
		DocUtil.download(request,response,docxName,docName, map);
		return prefix + "/getdoc";
	}


	/**
	 * 查询化验明细
	 */
	@RequiresPermissions("system:bizAssay:list")
	@GetMapping("/detail/{assayNo}")
	public String detail(@PathVariable("assayNo") String assayNo, ModelMap mmap)
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
		List<AssayItem> resultList = assayResultService.selectItemByAssayNo(assayNo);

		mmap.put("itemList", resultList);
		mmap.put("assayNo", assayNo);
		return prefix + "/BizAssayDetails";
	}

	@PostMapping("/getAssayByItem")
	@ResponseBody
	public AjaxResult getAssayByItem(@RequestBody JSONObject params) {

		String  assayNo = params.getString("assayNo");
		String  assayItem = params.getString("assayItem");

		AssayResult assay = new AssayResult();
		assay.setAssayNo(assayNo);
		assay.setAssayItem(assayItem);
		List<AssayResult> assayResult = assayResultService.selectAssayResultList(assay);
		AssayCurve curve_item = assayCurveService.selectAssayCurveByCurveNo(assayItem);

		String assaymethod= "";
		if("3".equals(assayItem)||"4".equals(assayItem)){
			assaymethod = "HJ399-2007化学需氧量的测定 快速消解分光光度法";
		}else if("5".equals(assayItem)){
			assaymethod = "GB11893-1989水质总磷的测定钼酸铵分光光度法";
		}else if("1".equals(assayItem)){
			assaymethod = "HJ636-2012水质总氮的测定碱性过硫酸钾消解紫外分光光度法";
		}else if("2".equals(assayItem)){
			assaymethod = "HJ535-2009水质氨氮的测定纳氏试剂分光光度法";
		}

		Gson gson = new Gson();
		String itemData = gson.toJson(assayResult);
		String curveData = gson.toJson(curve_item);
		String methodData = gson.toJson(assaymethod);

		AjaxResult ajax = AjaxResult.success();
		ajax.put("itemData", itemData);
		ajax.put("curveData", curveData);
		ajax.put("methodData", methodData);
		return ajax;
	}


	@GetMapping("/getAllDoc/{assayNo}/{obj}")
	@ResponseBody
	public String  getAllDoc(@PathVariable("assayNo") String assayNo,@PathVariable("obj") String obj,HttpServletRequest request, HttpServletResponse response) throws IOException {
//		List<Map<String,Object>> mapList =  new ArrayList<>();

		BizAssay assay = bizAssayService.selectBizAssayByAssayNo(assayNo);

		AssayResult assayResult  = new AssayResult();
		assayResult.setAssayNo(assayNo);
		assayResult.setAssayItem(obj);
		List<AssayResult> resultList = assayResultService.selectAssayResultList(assayResult);
		AssayCurve curve_item = assayCurveService.selectAssayCurveByCurveNo(obj);


		String docName = "";

		docName = "报表记录测试2.doc";
		String assaymethod= "";
		if("3".equals(obj)||"4".equals(obj)){
			 docName = "COD分析项目原始记录.doc";
			assaymethod = "HJ399-2007化学需氧量的测定 快速消解分光光度法";
		}else if("5".equals(obj)){
			docName = "总磷分析项目原始记录.doc";
			assaymethod = "GB11893-1989水质总磷的测定钼酸铵分光光度法";
		}else if(("1".equals(obj))){
			docName = "总氮分析项目原始记录.doc";
			assaymethod = "HJ636-2012水质总氮的测定碱性过硫酸钾消解紫外分光光度法";
		}else if(("2".equals(obj))){
			docName = "氨氮分析项目原始记录.doc";
			assaymethod = "HJ535-2009水质氨氮的测定纳氏试剂分光光度法";
		}


		AssayTotalData data = new AssayTotalData();
		AssayData assayData = new AssayData();

		List<RowRenderData> assayList = new ArrayList<RowRenderData>();
		int i=0;
		for(AssayResult result : resultList){
			RowRenderData assayRow = RowRenderData.build(i+"", "样品", result.getSampleVolume()+"", result.getResultAbs()+"", result.getResultConcentration()+"", result.getResultConcentration()+"");
			assayList.add(assayRow);
			i++;
		}
		assayData.setAssayResult(assayList);
		data.setAssayTable(assayData);
		data.setOrderno(assay.getAssayNo());

		data.setAssaymethod(assaymethod);
		data.setUg1(curve_item.getCurveCon1()+"");
		data.setUg2(curve_item.getCurveCon2()+"");
		data.setUg3(curve_item.getCurveCon3()+"");
		data.setUg4(curve_item.getCurveCon4()+"");
		data.setUg5(curve_item.getCurveCon5()+"");
		data.setUg6(curve_item.getCurveCon6()+"");
		data.setUg7(curve_item.getCurveCon7()+"");

		data.setOD1(curve_item.getCurveAbs1()+"");
		data.setOD2(curve_item.getCurveAbs2()+"");
		data.setOD3(curve_item.getCurveAbs3()+"");
		data.setOD4(curve_item.getCurveAbs4()+"");
		data.setOD5(curve_item.getCurveAbs5()+"");
		data.setOD6(curve_item.getCurveAbs6()+"");
		data.setOD7(curve_item.getCurveAbs7()+"");

		data.setB(curve_item.getCurveK0()+"");
		data.setA(curve_item.getCurveK1()+"");
		data.setR(curve_item.getCurveR()+"");

		String path = ClassUtils.getDefaultClassLoader().getResource("").getPath();
		String resource = path+"static/docx/报表记录测试2.docx";
		Configure config = Configure.newBuilder().customPolicy("detail_table", new AssayTablePolicy()).build();
		XWPFTemplate template = XWPFTemplate.compile(resource, config).render(data);

		OutputStream out = null;
		try {
			out = new FileOutputStream("out_template.docx");
			template.write(out);
			out.flush();
			out.close();
			template.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		InputStream fis = null;
		OutputStream toClient = null;
		File file = new File("out_template.docx");
		try {
			fis = new BufferedInputStream(new FileInputStream(file));
			byte[] buffer = new byte[fis.available()];
			fis.read(buffer);
			fis.close();
			// 清空response
			response.reset();
			// 设置response的Header
			String newWordName = URLEncoder.encode(docName, "utf-8"); //这里要用URLEncoder转下才能正确显示中文名称
			response.addHeader("Content-Disposition", "attachment;filename=" + newWordName+"");
			response.addHeader("Content-Length", "" + file.length());
			toClient = new BufferedOutputStream(response.getOutputStream());
			response.setContentType("application/octet-stream");
			toClient.write(buffer);
			toClient.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				if(fis!=null){
					fis.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				if(toClient!=null){
					toClient.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return prefix + "/getdoc";
	}

}
