package com.ruoyi.web.controller.system;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import com.deepoove.poi.data.MiniTableRenderData;
import com.deepoove.poi.data.RowRenderData;
import com.deepoove.poi.data.TextRenderData;
import com.ruoyi.common.core.domain.BaseEntity;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.poi.DocUtil;
import com.ruoyi.framework.util.ShiroUtils;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 化验结果 信息操作处理
 * 
 * @author ruoyi
 * @date 2019-11-29
 */
@Controller
@RequestMapping("/system/bizAssayResult")
public class BizAssayResultController extends BaseController
{
    private String prefix = "system/bizAssayResult";
	
	@Autowired
	private IBizAssayResultService bizAssayResultService;
	@Autowired
	private IBizResultAlterService bizResultAlterService;
//	@Autowired
//	private IBizAssayCurveService bizAssayCurveService;
	@Autowired
	private IBizAssayMethodService bizAssayMethodService;
	@Autowired
	private IBizAssayParameterService bizAssayParameterService;


	
	@RequiresPermissions("system:bizAssayResult:view")
	@GetMapping()
	public String bizAssayResult()
	{
	    return prefix + "/bizAssayResult";
	}
	
	/**
	 * 查询化验结果列表
	 */
	@RequiresPermissions("system:bizAssayResult:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(BizAssayResult bizAssayResult)
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
					" OR {}.result_works IN ( SELECT works_id FROM sys_role_work WHERE role_id = {} ) ", "r",
					role.getRoleId()));
		}
		if (StringUtils.isNotBlank(sqlString.toString()))
		{
			bizAssayResult.getParams().put("dataScope", " AND (" + sqlString.substring(4) + ")");
		}
        List<BizAssayResult> list = bizAssayResultService.selectBizAssayResultList(bizAssayResult);
		return getDataTable(list);
	}
	
	
	/**
	 * 导出化验结果列表
	 */
	@RequiresPermissions("system:bizAssayResult:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(BizAssayResult bizAssayResult)
    {
    	List<BizAssayResult> list = bizAssayResultService.selectBizAssayResultList(bizAssayResult);
        ExcelUtil<BizAssayResult> util = new ExcelUtil<BizAssayResult>(BizAssayResult.class);
        return util.exportExcel(list, "bizAssayResult");
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
	@RequiresPermissions("system:bizAssayResult:add")
	@Log(title = "新增化验结果", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(BizAssayResult bizAssayResult)
	{		
		return toAjax(bizAssayResultService.insertBizAssayResult(bizAssayResult));
	}

	/**
	 * 查看化验结果
	 */
	@GetMapping("/check/{resultId}")
	public String check(@PathVariable("resultId") Long resultId, ModelMap mmap)
	{
		BizAssayResult bizAssayResult = bizAssayResultService.selectBizAssayResultById(resultId);
		mmap.put("bizAssayResult", bizAssayResult);
		return prefix + "/check";
	}

	/**
	 * 修改化验结果
	 */
	@GetMapping("/edit/{resultId}")
	public String edit(@PathVariable("resultId") Long resultId, ModelMap mmap)
	{
		BizAssayResult bizAssayResult = bizAssayResultService.selectBizAssayResultById(resultId);
		mmap.put("bizAssayResult", bizAssayResult);
	    return prefix + "/edit";
	}
	
	/**
	 * 修改保存化验结果
	 */
	@RequiresPermissions("system:bizAssayResult:edit")
	@Log(title = "修改化验结果", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(BizAssayResult bizAssayResult)
	{
		BizAssayResult bizAssayResult_real = bizAssayResultService.selectBizAssayResultById(bizAssayResult.getResultId());
		BizResultAlter alter = new BizResultAlter();
		if(bizAssayResult_real!=null){
			System.out.println(bizAssayResult_real.getResultNo());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date datetime = new Date();
			String date = sdf.format(datetime);

			alter.setAlterNo(bizAssayResult_real.getResultNo());
			alter.setReportId(bizAssayResult_real.getReportId());
			alter.setAlterWorks(bizAssayResult_real.getResultWorks());
			alter.setAlterDevice(bizAssayResult_real.getResultDevice());
			alter.setInCod(bizAssayResult_real.getInCod());
			alter.setInTn(bizAssayResult_real.getInTn());
			alter.setInTp(bizAssayResult_real.getInTp());
			alter.setInNh3(bizAssayResult_real.getInNh3());
			alter.setOutCod(bizAssayResult_real.getOutCod());
			alter.setOutTn(bizAssayResult_real.getOutTn());
			alter.setOutTp(bizAssayResult_real.getOutTp());
			alter.setOutNh3(bizAssayResult_real.getOutNh3());
			alter.setAlterDate(date);
			alter.setAlterTime(sdf2.format(datetime));
			alter.setCreateBy(ShiroUtils.getLoginName());
			bizResultAlterService.insertBizResultAlter(alter);
		}
		return toAjax(bizAssayResultService.updateBizAssayResult(bizAssayResult));
	}
	
	/**
	 * 删除化验结果
	 */
	@RequiresPermissions("system:bizAssayResult:remove")
	@Log(title = "删除化验结果", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{		
		return toAjax(bizAssayResultService.deleteBizAssayResultByIds(ids));
	}


	@RequiresPermissions("system:bizAssayResult:list")
	@GetMapping("/assayReport")
	public String assayReport()
	{
		return prefix + "/assayReport";
	}

	/**
	 * 化验结果统计
	 * @param params
	 * @return
	 */
	@PostMapping("/getAssay")
	@ResponseBody
	public AjaxResult getAssay(@RequestBody JSONObject params) {
		long deviceId = params.getLong("deviceId");
		long worksId = params.getLong("worksId");
		String  beginDate = params.getString("beginDate");
		String  endDate = params.getString("endDate");

		BizAssayResult resultData = new BizAssayResult();
		resultData.setResultDevice(deviceId);
		resultData.setResultWorks(worksId);
		if(beginDate!=null&&endDate!=null){
			Map<String, Object> data_params = new HashMap<>();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String nowTime= format.format(new Date());
			data_params.put("beginTime",beginDate);
			data_params.put("endTime",endDate);
			resultData.setParams(data_params);
		}
		List<BizAssayResult> resultList = bizAssayResultService.selectBizAssayResultList(resultData);
		String resultdata="[";

		String in_cod_data="[";
		String out_cod_data="[";
		String in_tp_data="[";
		String out_tp_data="[";
		String in_tn_data="[";
		String out_tn_data="[";
		String in_nh_data="[";
		String out_nh_data="[";
		if(resultList!=null){
			for(BizAssayResult object:resultList){
				resultdata +="'"+object.getResultDate()+"',";

				in_cod_data +=object.getInCod()+",";
				out_cod_data +=object.getOutCod()+",";
				in_tp_data +=object.getInTp()+",";
				out_tp_data +=object.getOutTp()+",";
				in_tn_data +=object.getInTn()+",";
				out_tn_data +=object.getOutTn()+",";
				in_nh_data +=object.getInNh3()+",";
				out_nh_data +=object.getOutNh3()+",";
			}
			if(resultdata.length()>1){
				resultdata = resultdata.substring(0,resultdata.length()-1);
			}
			if(in_cod_data.length()>1){
				in_cod_data = in_cod_data.substring(0,in_cod_data.length()-1);
				out_cod_data = out_cod_data.substring(0,out_cod_data.length()-1);
				in_tp_data = in_tp_data.substring(0,in_tp_data.length()-1);
				out_tp_data = out_tp_data.substring(0,out_tp_data.length()-1);
				in_tn_data = in_tn_data.substring(0,in_tn_data.length()-1);
				out_tn_data = out_tn_data.substring(0,out_tn_data.length()-1);
				in_nh_data = in_nh_data.substring(0,in_nh_data.length()-1);
				out_nh_data = out_nh_data.substring(0,out_nh_data.length()-1);
			}

		}
		resultdata +="]";

		in_cod_data +="]";
		out_cod_data +="]";
		in_tp_data +="]";
		out_tp_data +="]";
		in_tn_data +="]";
		out_tn_data +="]";
		in_nh_data +="]";
		out_nh_data +="]";


		String jsonData = "{resultdate:"+resultdata+",in_cod_data:"+in_cod_data+",out_cod_data:"+out_cod_data+
				",in_tp_data:"+in_tp_data+",out_tp_data:"+out_tp_data+
				",in_tn_data:"+in_tn_data+",out_tn_data:"+out_tn_data+
				",in_nh_data:"+in_nh_data+",out_nh_data:"+out_nh_data+"}";

		AjaxResult ajax = AjaxResult.success();
		ajax.put("resultdata", jsonData);
		return ajax;

	}


	@RequiresPermissions("system:bizAssayResult:list")
	@GetMapping("/assayCurve/{reportId}")
	public String assayCurve(@PathVariable("reportId") String reportId, ModelMap mmap)
	{
		mmap.put("reportId", reportId);
		return prefix + "/assayCurve";
	}


	/**
	 * 化验结果统计
	 * @param params
	 * @return
	 */
	@PostMapping("/getAssayCurve")
	@ResponseBody
	public AjaxResult getAssayCurve(@RequestBody JSONObject params) {
		String  reportId = params.getString("reportId");
		String resultdata="[";

		String in_cod_wave1="[";
		String in_cod_wave2="[";
		String in_cod_k="[";
		String in_cod_b="[";
		String out_cod_wave1="[";
		String out_cod_wave2="[";
		String out_cod_k="[";
		String out_cod_b="[";
		String tp_wave1="[";
		String tp_wave2="[";
		String tp_k="[";
		String tp_b="[";
		String tn_wave1="[";
		String tn_wave2="[";
		String tn_k="[";
		String tn_b="[";
		String nh_wave1="[";
		String nh_wave2="[";
		String nh_k="[";
		String nh_b="[";

//		BizAssayCurve assayCurve = new BizAssayCurve();
//		assayCurve.setReportId(reportId);
//		List<BizAssayCurve> curveList = bizAssayCurveService.selectBizAssayCurveList(assayCurve);
//
//		//获取化验曲线
//		if(curveList!=null){
//
//			int i=1;
//			for(BizAssayCurve object:curveList){
//				resultdata +="'"+i+"',";
//
//
//				in_cod_wave1+=object.getIncodWave1()+",";
//				in_cod_wave2+=object.getIncodWave2()+",";
//				in_cod_k+=object.getIncodCurveK()+",";
//				in_cod_b+=object.getIncodCurveB()+",";
//				out_cod_wave1+=object.getOutcodWave1()+",";
//				out_cod_wave2+=object.getOutcodWave2()+",";
//				out_cod_k+=object.getOutcodCurveK()+",";
//				out_cod_b+=object.getOutcodCurveB()+",";
//				tp_wave1+=object.getTpWave1()+",";
//				tp_wave2+=object.getTpWave2()+",";
//				tp_k+=object.getTpCurveK()+",";
//				tp_b+=object.getTpCurveB()+",";
//				tn_wave1+=object.getTnWave1()+",";
//				tn_wave2+=object.getTnWave1()+",";
//				tn_k+=object.getTnCurveK()+",";
//				tn_b+=object.getTnCurveB()+",";
//				nh_wave1+=object.getNhWave1()+",";
//				nh_wave2+=object.getNhWave1()+",";
//				nh_k+=object.getNhCurveK()+",";
//				nh_b+=object.getNhCurveB()+",";
//
//				i++;
//			}
//
//			if(resultdata.length()>1){
//				resultdata = resultdata.substring(0,resultdata.length()-1);
//			}
//			if(in_cod_wave1.length()>1){
//				in_cod_wave1 = in_cod_wave1.substring(0,in_cod_wave1.length()-1);
//				in_cod_wave2 = in_cod_wave2.substring(0,in_cod_wave2.length()-1);
//				in_cod_k = in_cod_k.substring(0,in_cod_k.length()-1);
//				in_cod_b = in_cod_b.substring(0,in_cod_b.length()-1);
//				out_cod_wave1 = out_cod_wave1.substring(0,out_cod_wave1.length()-1);
//				out_cod_wave2 = out_cod_wave2.substring(0,out_cod_wave2.length()-1);
//				out_cod_k = out_cod_k.substring(0,out_cod_k.length()-1);
//				out_cod_b = out_cod_b.substring(0,out_cod_b.length()-1);
//				tp_wave1 = tp_wave1.substring(0,tp_wave1.length()-1);
//				tp_wave2 = tp_wave2.substring(0,tp_wave2.length()-1);
//				tp_k = tp_k.substring(0,tp_k.length()-1);
//				tp_b = tp_b.substring(0,tp_b.length()-1);
//				tn_wave1 = tn_wave1.substring(0,tn_wave1.length()-1);
//				tn_wave2 = tn_wave2.substring(0,tn_wave2.length()-1);
//				tn_k = tn_k.substring(0,tn_k.length()-1);
//				tn_b = tn_b.substring(0,tn_b.length()-1);
//				nh_wave1 = nh_wave1.substring(0,nh_wave1.length()-1);
//				nh_wave2 = nh_wave2.substring(0,nh_wave2.length()-1);
//				nh_k = nh_k.substring(0,nh_k.length()-1);
//				nh_b = nh_b.substring(0,nh_b.length()-1);
//			}
//		}

		resultdata +="]";

		in_cod_wave1+="]";
		in_cod_wave2+="]";
		in_cod_k+="]";
		in_cod_b+="]";
		out_cod_wave1+="]";
		out_cod_wave2+="]";
		out_cod_k+="]";
		out_cod_b+="]";
		tp_wave1+="]";
		tp_wave2+="]";
		tp_k+="]";
		tp_b+="]";
		tn_wave1+="]";
		tn_wave2+="]";
		tn_k+="]";
		tn_b+="]";
		nh_wave1+="]";
		nh_wave2+="]";
		nh_k+="]";
		nh_b+="]";

		String jsonData = "{resultdate:"+resultdata+",in_cod_wave1:"+in_cod_wave1+",in_cod_wave2:"+in_cod_wave2+
				",in_cod_k:"+in_cod_k+",in_cod_b:"+in_cod_b+
				",out_cod_wave1:"+out_cod_wave1+",out_cod_wave2:"+out_cod_wave2+
				",out_cod_k:"+out_cod_k+",out_cod_b:"+out_cod_b+
				",tp_wave1:"+tp_wave1+",tp_wave2:"+tp_wave2+
				",tp_k:"+tp_k+",tp_b:"+tp_b+
				",tn_wave1:"+tn_wave1+",tn_wave2:"+tn_wave2+
				",tn_k:"+tn_k+",tn_b:"+tn_b+
				",nh_wave1:"+nh_wave1+",nh_wave2:"+nh_wave2+
				",nh_k:"+nh_k+",nh_b:"+nh_b+"}";
		AjaxResult ajax = AjaxResult.success();
		ajax.put("resultdata", jsonData);
		return ajax;

	}


	@RequiresPermissions("system:bizAssayResult:list")
	@GetMapping("/assayDetails/{reportId}")
	public String assayDetails(@PathVariable("reportId") String reportId, ModelMap mmap)
	{

		BizAssayParameter para = new BizAssayParameter();
		para.setReportId(reportId);
		BizAssayResult bizAssayResult = bizAssayResultService.selectBizAssayResultByReportId(reportId);
		List<BizAssayParameter> bizAssayParameter = bizAssayParameterService.selectBizAssayParameterList(para);
		BizAssayMethod bizAssayMethod = bizAssayMethodService.selectBizAssayMethodByReportId(reportId);
		mmap.put("bizAssayResult", bizAssayResult);
		mmap.put("bizAssayMethod", bizAssayMethod);

		DecimalFormat decimalFormat=new DecimalFormat("0.000");

		float outcod = bizAssayResult.getOutCod();
		float outcod_2 = outcod - (float) (outcod*0.03);
		outcod =outcod +(float) (outcod*0.03);
		float sum_cod = ((outcod + outcod_2)/2);
		String sum_s=decimalFormat.format(sum_cod);
		mmap.put("outcod_re2", sum_s);

		float outtp = bizAssayResult.getOutTp();
		float outtp_2 = outtp - (float) (outtp*0.03);
		outtp =outtp +(float) (outtp*0.03);
		float sum_tp = ((outtp + outtp_2)/2);
		String sum_tps=decimalFormat.format(sum_tp);
		mmap.put("outtp_re2", sum_tps);

		float outtn = bizAssayResult.getOutTn();
		float outtn_2 = outtn - (float) (outtn*0.03);
		outtn =outtn +(float) (outtn*0.03);
		float sum_tn = ((outtn + outtn_2)/2);
		String sum_tns=decimalFormat.format(sum_tn);
		mmap.put("outtn_re2", sum_tns);

		float outnh = bizAssayResult.getOutNh3();
		float outnh_2 = outnh - (float) (outnh*0.03);
		outnh =outnh +(float) (outnh*0.03);
		float sum_nh = ((outnh + outnh_2)/2);
		String sum_nhs=decimalFormat.format(sum_nh);
		mmap.put("outnh_re2", sum_nhs);

		for(BizAssayParameter biz:bizAssayParameter){
			if("1".equals(biz.getParameterType())){
				mmap.put("CODparameter", biz);
				float standard_As = biz.getCurveB() * 48 +  biz.getCurveA();
				String standard_Asp=decimalFormat.format(standard_As);
				mmap.put("cod_standard_As", standard_Asp);
				float incod_As = biz.getCurveB() * bizAssayResult.getInCod() +  biz.getCurveA();
				String incod_Asp=decimalFormat.format(incod_As);
				mmap.put("incod_As", incod_Asp);
				float outcod_As1 = biz.getCurveB() * outcod +  biz.getCurveA();
				String outcod_As1p=decimalFormat.format(outcod_As1);
				mmap.put("outcod_As1", outcod_As1p);
				float outcod_As2 = biz.getCurveB() * outcod_2 +  biz.getCurveA();
				String outcod_As2p=decimalFormat.format(outcod_As2);
				mmap.put("outcod_As2", outcod_As2p);
				mmap.put("outcod", outcod);
				mmap.put("outcod_2", outcod_2);

			}else if("2".equals(biz.getParameterType())){
				mmap.put("TPparameter", biz);
				float standard_As = (float) (biz.getCurveB() * 1.33 +  biz.getCurveA());
				String standard_Asp=decimalFormat.format(standard_As);
				mmap.put("tp_standard_As", standard_Asp);
				float intp_As = biz.getCurveB() * bizAssayResult.getInTp() +  biz.getCurveA();
				String intp_Asp=decimalFormat.format(intp_As);
				mmap.put("intp_As", intp_Asp);
				float outtp_As1 = biz.getCurveB() * outtp +  biz.getCurveA();
				String outtp_As1p=decimalFormat.format(outtp_As1);
				mmap.put("outtp_As1", outtp_As1p);
				float outtp_As2 = biz.getCurveB() * outtp_2 +  biz.getCurveA();
				String outtp_As2p=decimalFormat.format(outtp_As2);
				mmap.put("outtp_As2", outtp_As2p);
				mmap.put("outtp", outtp);
				mmap.put("outtp_2", outtp_2);

			}else if("3".equals(biz.getParameterType())){
				mmap.put("TNparameter", biz);
				float standard_As = (float) (biz.getCurveB() * 2.58 +  biz.getCurveA());
				String standard_Asp=decimalFormat.format(standard_As);
				mmap.put("tn_standard_As", standard_Asp);
				float intn_As = biz.getCurveB() * bizAssayResult.getInTn() +  biz.getCurveA();
				String intn_Asp=decimalFormat.format(intn_As);
				mmap.put("intn_As", intn_Asp);
				float outtn_As1 = biz.getCurveB() * outtn +  biz.getCurveA();
				String outtn_As1p=decimalFormat.format(outtn_As1);
				mmap.put("outtn_As1", outtn_As1p);
				float outtn_As2 = biz.getCurveB() * outtn_2 +  biz.getCurveA();
				String outtn_As2p=decimalFormat.format(outtn_As2);
				mmap.put("outtn_As2", outtn_As2p);
				mmap.put("outtn", outtn);
				mmap.put("outtn_2", outtn_2);

			}else if("4".equals(biz.getParameterType())){
				mmap.put("NHparameter", biz);

				float standard_As = (float) (biz.getCurveB() * 0.58 +  biz.getCurveA());
				String standard_Asp=decimalFormat.format(standard_As);
				mmap.put("nh_standard_As", standard_Asp);
				float innh_As = biz.getCurveB() * bizAssayResult.getInNh3() +  biz.getCurveA();
				String incod_Asp=decimalFormat.format(innh_As);
				mmap.put("innh_As", incod_Asp);
				float outnh_As1 = biz.getCurveB() * outnh +  biz.getCurveA();
				String outnh_As1p=decimalFormat.format(outnh_As1);
				mmap.put("outnh_As1", outnh_As1p);
				float outnh_As2 = biz.getCurveB() * outnh_2 +  biz.getCurveA();
				String outnh_As2p=decimalFormat.format(outnh_As2);
				mmap.put("outnh_As2", outnh_As2p);
				mmap.put("outnh", outnh);
				mmap.put("outnh_2", outnh_2);

			}
		}
		String workname = bizAssayResult.getWorks().getWorksName();
		String Sname = workname.substring(0,2);
		mmap.put("Sname", Sname);
		mmap.put("reportId", reportId);
		return prefix + "/assayDetails";
	}

	@GetMapping("/getcodDoc/{reportId}")
	@ResponseBody
	public String  getcodDoc(@PathVariable("reportId") String reportId,HttpServletRequest request, HttpServletResponse response) throws IOException {

		BizAssayParameter para = new BizAssayParameter();
		para.setReportId(reportId);
		BizAssayResult bizAssayResult = bizAssayResultService.selectBizAssayResultByReportId(reportId);
		List<BizAssayParameter> bizAssayParameter = bizAssayParameterService.selectBizAssayParameterList(para);
		BizAssayMethod bizAssayMethod = bizAssayMethodService.selectBizAssayMethodByReportId(reportId);

		String assaydate="";
		String workname="";
		float outcod=0;
		float incod=0;

		if(bizAssayResult!=null){

			workname = bizAssayResult.getWorks().getWorksName();
			outcod = bizAssayResult.getOutCod();
			assaydate = bizAssayResult.getAssayDate();
			incod = bizAssayResult.getInCod();
		}

		String assaymethod="";
		int h_wave= 0;
		int l_wave= 0;
		int optical= 0;
		if(bizAssayMethod!=null){
			assaymethod = bizAssayMethod.getCodName();
			h_wave= bizAssayMethod.getCodWave1();
			l_wave= bizAssayMethod.getCodWave2();
			optical= bizAssayMethod.getCodOptical();
		}

		String Sname = workname.substring(0,2);
		DecimalFormat decimalFormat=new DecimalFormat("0.000");

		Map<String,Object> map =  new HashMap<>();
		map.put("orderno", reportId);
		map.put("assaydate", assaydate);
		map.put("workname", workname);
		map.put("assaymethod", assaymethod);
		map.put("h_wave", h_wave);
		map.put("l_wave", l_wave);
		map.put("optical", optical);

		map.put("empty_v", "1");map.put("empty_As", "0.000");
		map.put("standard_v", "1");map.put("standard_re1", "48");map.put("standard_re2", "48");
		map.put("Sname", Sname);map.put("incod_v", "1");map.put("outcod_v1", "2");map.put("outcod_v2", "2");
		map.put("incod_re1", incod);map.put("incod_re2", incod);
		float outcod_2 = outcod;
		Random random = new Random();
		int i = random .nextInt(2);
//		if(i==0){
//			outcod_2 = outcod + (float) (outcod*0.03);
//		}else{
//			outcod_2 = outcod - (float) (outcod*0.03);
//		}
		outcod_2 = outcod - (float) (outcod*0.03);
		outcod =outcod +(float) (outcod*0.03);
		map.put("outcod_re1_1", outcod);
		String outcod_2s=decimalFormat.format(outcod_2);
		map.put("outcod_re1_2", outcod_2s);
		float sum_cod = ((outcod + outcod_2)/2);
		String sum_s=decimalFormat.format(sum_cod);
		map.put("outcod_re2", sum_s);

		for(BizAssayParameter biz:bizAssayParameter){
			if("1".equals(biz.getParameterType())){
				map.put("ug1", biz.getUg1());map.put("OD1", biz.getOd1());
				map.put("ug2", biz.getUg2());map.put("OD2", biz.getOd2());
				map.put("ug3", biz.getUg3());map.put("OD3", biz.getOd3());
				map.put("ug4", biz.getUg4());map.put("OD4", biz.getOd4());
				map.put("ug5", biz.getUg5());map.put("OD5", biz.getOd5());
				map.put("ug6", biz.getUg6());map.put("OD6", biz.getOd6());
				map.put("ug7", biz.getUg7());map.put("OD7", biz.getOd7());
				map.put("b", biz.getCurveB());
				map.put("a", biz.getCurveA());
				map.put("r", biz.getCurveR());


				float standard_As = biz.getCurveB() * 48 +  biz.getCurveA();
				String standard_Asp=decimalFormat.format(standard_As);
				map.put("standard_As", standard_Asp);
				float incod_As = biz.getCurveB() * incod +  biz.getCurveA();
				String incod_Asp=decimalFormat.format(incod_As);
				map.put("incod_As", incod_Asp);
				float outcod_As1 = biz.getCurveB() * outcod +  biz.getCurveA();
				String outcod_As1p=decimalFormat.format(outcod_As1);
				map.put("outcod_As1", outcod_As1p);
				float outcod_As2 = biz.getCurveB() * outcod_2 +  biz.getCurveA();
				String outcod_As2p=decimalFormat.format(outcod_As2);
				map.put("outcod_As2", outcod_As2p);
			}
		}
		String newWordName = "COD分析项目原始记录.doc";
		DocUtil.download(request,response,"COD分析项目原始记录.docx",newWordName, map);

		return prefix + "/getdoc";
	}

	@GetMapping("/gettpDoc/{reportId}")
	@ResponseBody
	public String  gettpDoc(@PathVariable("reportId") String reportId,HttpServletRequest request, HttpServletResponse response) throws IOException {

		BizAssayParameter para = new BizAssayParameter();
		para.setReportId(reportId);
		BizAssayResult bizAssayResult = bizAssayResultService.selectBizAssayResultByReportId(reportId);
		List<BizAssayParameter> bizAssayParameter = bizAssayParameterService.selectBizAssayParameterList(para);
		BizAssayMethod bizAssayMethod = bizAssayMethodService.selectBizAssayMethodByReportId(reportId);

		String workname = "";
		float outtp = 0;
		String assaydate="";
		float intp = 0;

		if(bizAssayResult!=null){
			workname = bizAssayResult.getWorks().getWorksName();
			outtp = bizAssayResult.getOutTp();
			assaydate = bizAssayResult.getAssayDate();
			intp = bizAssayResult.getInTp();
		}

		String assaymethod="";
		int wave=0;
		int optical=0;

		if(bizAssayMethod!=null){
			assaymethod = bizAssayMethod.getTpName();
			wave = bizAssayMethod.getTpWave1();
			optical = bizAssayMethod.getTpOptical();
		}

		String Sname = workname.substring(0,2);
		DecimalFormat decimalFormat=new DecimalFormat("0.000");

		Map<String,Object> map =  new HashMap<>();
		map.put("orderno", reportId);
		map.put("assaydate", assaydate);
		map.put("workname", workname);
		map.put("assaymethod", assaymethod);
		map.put("wave", wave);
		map.put("optical", optical);

		map.put("empty_v", "1");map.put("empty_As", "0.000");
		map.put("standard_v", "1");map.put("standard_re1", "1.33");map.put("standard_re2", "1.33");
		map.put("Sname", Sname);map.put("intp_v", "1");map.put("outtp_v1", "2");map.put("outtp_v2", "2");
		map.put("intp_re1", intp);map.put("intp_re2", intp);
		float outtp_2 = outtp;
		Random random = new Random();
		int i = random .nextInt(2);
//		if(i==0){
//			outtp_2 = outtp + (float) (outtp*0.03);
//		}else{
//			outtp_2 = outtp - (float) (outtp*0.03);
//		}
		outtp_2 = outtp - (float) (outtp*0.03);
		outtp =outtp +(float) (outtp*0.03);
		map.put("outtp_re1_1", outtp);
		String outtp_2s=decimalFormat.format(outtp_2);
		map.put("outtp_re1_2", outtp_2s);
		float sum_tp = ((outtp + outtp_2)/2);
		String sum_s=decimalFormat.format(sum_tp);
		map.put("outtp_re2", sum_s);

		for(BizAssayParameter biz:bizAssayParameter){
			if("2".equals(biz.getParameterType())){
				map.put("ug1", biz.getUg1());map.put("OD1", biz.getOd1());
				map.put("ug2", biz.getUg2());map.put("OD2", biz.getOd2());
				map.put("ug3", biz.getUg3());map.put("OD3", biz.getOd3());
				map.put("ug4", biz.getUg4());map.put("OD4", biz.getOd4());
				map.put("ug5", biz.getUg5());map.put("OD5", biz.getOd5());
				map.put("ug6", biz.getUg6());map.put("OD6", biz.getOd6());
				map.put("ug7", biz.getUg7());map.put("OD7", biz.getOd7());
				map.put("b", biz.getCurveB());
				map.put("a", biz.getCurveA());
				map.put("r", biz.getCurveR());


				float standard_As = (float) (biz.getCurveB() * 1.33 +  biz.getCurveA());
				String standard_Asp=decimalFormat.format(standard_As);
				map.put("standard_As", standard_Asp);
				float intp_As = biz.getCurveB() * intp +  biz.getCurveA();
				String intp_Asp=decimalFormat.format(intp_As);
				map.put("intp_As", intp_Asp);
				float outtp_As1 = biz.getCurveB() * outtp +  biz.getCurveA();
				String outtp_As1p=decimalFormat.format(outtp_As1);
				map.put("outtp_As1", outtp_As1p);
				float outtp_As2 = biz.getCurveB() * outtp_2 +  biz.getCurveA();
				String outtp_As2p=decimalFormat.format(outtp_As2);
				map.put("outtp_As2", outtp_As2p);
			}
		}
		String newWordName = "总磷分析项目原始记录.doc";
		DocUtil.download(request,response,"总磷分析项目原始记录.docx",newWordName, map);

		return prefix + "/getdoc";
	}

	@GetMapping("/gettnDoc/{reportId}")
	@ResponseBody
	public String  gettnDoc(@PathVariable("reportId") String reportId,HttpServletRequest request, HttpServletResponse response) throws IOException {

		BizAssayParameter para = new BizAssayParameter();
		para.setReportId(reportId);
		BizAssayResult bizAssayResult = bizAssayResultService.selectBizAssayResultByReportId(reportId);
		List<BizAssayParameter> bizAssayParameter = bizAssayParameterService.selectBizAssayParameterList(para);
		BizAssayMethod bizAssayMethod = bizAssayMethodService.selectBizAssayMethodByReportId(reportId);

		String workname = "";
		float outtn = 0;
		String assaydate="";
		float intp = 0;

		if(bizAssayResult!=null){
			workname = bizAssayResult.getWorks().getWorksName();
			outtn = bizAssayResult.getOutTn();
			assaydate = bizAssayResult.getAssayDate();
			intp =bizAssayResult.getInTn();
		}

		String assaymethod="";
		int wave=0;
		int optical=0;
		if(bizAssayMethod!=null){
			assaymethod = bizAssayMethod.getTnName();
			wave = bizAssayMethod.getTnWave1();
			optical = bizAssayMethod.getTnOptical();
		}

		String Sname = workname.substring(0,2);
		DecimalFormat decimalFormat=new DecimalFormat("0.000");

		Map<String,Object> map =  new HashMap<>();
		map.put("orderno", reportId);
		map.put("assaydate", assaydate);
		map.put("workname", workname);
		map.put("assaymethod", assaymethod);
		map.put("wave", wave);
		map.put("optical", optical);

		map.put("empty_v", "1");map.put("empty_As", "0.000");
		map.put("standard_v", "1");map.put("standard_re1", "2.58");map.put("standard_re2", "2.58");
		map.put("Sname", Sname);map.put("intn_v", "1");map.put("outtn_v1", "2");map.put("outtn_v2", "2");
		map.put("intn_re1", intp);map.put("intn_re2", intp);
		float outtn_2 = outtn;
		Random random = new Random();
		int i = random .nextInt(2);
//		if(i==0){
//			outtn_2 = outtn + (float) (outtn*0.03);
//		}else{
//			outtn_2 = outtn - (float) (outtn*0.03);
//		}
		outtn_2 = outtn - (float) (outtn*0.03);
		outtn =outtn +(float) (outtn*0.03);
		map.put("outtn_re1_1", outtn);
		String outtn_2s=decimalFormat.format(outtn_2);
		map.put("outtn_re1_2", outtn_2s);
		float sum_tn = ((outtn + outtn_2)/2);
		String sum_s=decimalFormat.format(sum_tn);
		map.put("outtn_re2", sum_s);

		for(BizAssayParameter biz:bizAssayParameter){
			if("3".equals(biz.getParameterType())){
				map.put("ug1", biz.getUg1());map.put("OD1", biz.getOd1());
				map.put("ug2", biz.getUg2());map.put("OD2", biz.getOd2());
				map.put("ug3", biz.getUg3());map.put("OD3", biz.getOd3());
				map.put("ug4", biz.getUg4());map.put("OD4", biz.getOd4());
				map.put("ug5", biz.getUg5());map.put("OD5", biz.getOd5());
				map.put("ug6", biz.getUg6());map.put("OD6", biz.getOd6());
				map.put("ug7", biz.getUg7());map.put("OD7", biz.getOd7());
				map.put("b", biz.getCurveB());
				map.put("a", biz.getCurveA());
				map.put("r", biz.getCurveR());


				float standard_As = (float) (biz.getCurveB() * 2.58 +  biz.getCurveA());
				String standard_Asp=decimalFormat.format(standard_As);
				map.put("standard_As", standard_Asp);
				float intn_As = biz.getCurveB() * intp +  biz.getCurveA();
				String intn_Asp=decimalFormat.format(intn_As);
				map.put("intn_As", intn_Asp);
				float outtn_As1 = biz.getCurveB() * outtn +  biz.getCurveA();
				String outtn_As1p=decimalFormat.format(outtn_As1);
				map.put("outtn_As1", outtn_As1p);
				float outtn_As2 = biz.getCurveB() * outtn_2 +  biz.getCurveA();
				String outtn_As2p=decimalFormat.format(outtn_As2);
				map.put("outtn_As2", outtn_As2p);
			}
		}
		String newWordName = "总氮分析项目原始记录.doc";
		DocUtil.download(request,response,"总氮分析项目原始记录.docx",newWordName, map);

		return prefix + "/getdoc";
	}

	@GetMapping("/getnhDoc/{reportId}")
	@ResponseBody
	public String  getnhDoc(@PathVariable("reportId") String reportId,HttpServletRequest request, HttpServletResponse response) throws IOException {

		BizAssayParameter para = new BizAssayParameter();
		para.setReportId(reportId);
		BizAssayResult bizAssayResult = bizAssayResultService.selectBizAssayResultByReportId(reportId);
		List<BizAssayParameter> bizAssayParameter = bizAssayParameterService.selectBizAssayParameterList(para);
		BizAssayMethod bizAssayMethod = bizAssayMethodService.selectBizAssayMethodByReportId(reportId);


		String workname = "";
		float outnh = 0;
		String assaydate="";
		float innh = 0;

		if(bizAssayResult!=null){
			workname = bizAssayResult.getWorks().getWorksName();
			outnh = bizAssayResult.getOutNh3();
			assaydate = bizAssayResult.getAssayDate();
			innh =bizAssayResult.getInNh3();
		}

		String assaymethod="";
		int wave=0;
		int optical=0;
		if(bizAssayMethod!=null){
			assaymethod = bizAssayMethod.getNhName();
			wave = bizAssayMethod.getNhWave1();
			optical = bizAssayMethod.getNhOptical();
		}

		String Sname = workname.substring(0,2);
		DecimalFormat decimalFormat=new DecimalFormat("0.000");

		Map<String,Object> map =  new HashMap<>();
		map.put("orderno", reportId);
		map.put("assaydate", assaydate);
		map.put("workname", workname);
		map.put("assaymethod", assaymethod);
		map.put("wave", wave);
		map.put("optical", optical);

		map.put("empty_v", "1");map.put("empty_As", "0.000");
		map.put("standard_v", "1");map.put("standard_re1", "0.58");map.put("standard_re2", "0.58");
		map.put("Sname", Sname);map.put("innh_v", "1");map.put("outnh_v1", "2");map.put("outnh_v2", "2");
		map.put("innh_re1", innh);map.put("innh_re2", innh);
		float outnh_2 = outnh;
		Random random = new Random();
		int i = random .nextInt(2);
//		if(i==0){
//			outnh_2 = outnh + (float) (outnh*0.03);
//		}else{
//			outnh_2 = outnh - (float) (outnh*0.03);
//		}
		outnh_2 = outnh - (float) (outnh*0.03);
		outnh =outnh +(float) (outnh*0.03);
		map.put("outnh_re1_1", outnh);
		String outnh_2s=decimalFormat.format(outnh_2);
		map.put("outnh_re1_2", outnh_2s);
		float sum_nh = ((outnh + outnh_2)/2);
		String sum_s=decimalFormat.format(sum_nh);
		map.put("outnh_re2", sum_s);

		for(BizAssayParameter biz:bizAssayParameter){
			if("4".equals(biz.getParameterType())){
				map.put("ug1", biz.getUg1());map.put("OD1", biz.getOd1());
				map.put("ug2", biz.getUg2());map.put("OD2", biz.getOd2());
				map.put("ug3", biz.getUg3());map.put("OD3", biz.getOd3());
				map.put("ug4", biz.getUg4());map.put("OD4", biz.getOd4());
				map.put("ug5", biz.getUg5());map.put("OD5", biz.getOd5());
				map.put("ug6", biz.getUg6());map.put("OD6", biz.getOd6());
				map.put("ug7", biz.getUg7());map.put("OD7", biz.getOd7());
				map.put("b", biz.getCurveB());
				map.put("a", biz.getCurveA());
				map.put("r", biz.getCurveR());


				float standard_As = (float) (biz.getCurveB() * 0.58 +  biz.getCurveA());
				String standard_Asp=decimalFormat.format(standard_As);
				map.put("standard_As", standard_Asp);
				float innh_As = biz.getCurveB() * innh +  biz.getCurveA();
				String incod_Asp=decimalFormat.format(innh_As);
				map.put("innh_As", incod_Asp);
				float outnh_As1 = biz.getCurveB() * outnh +  biz.getCurveA();
				String outnh_As1p=decimalFormat.format(outnh_As1);
				map.put("outnh_As1", outnh_As1p);
				float outnh_As2 = biz.getCurveB() * outnh_2 +  biz.getCurveA();
				String outnh_As2p=decimalFormat.format(outnh_As2);
				map.put("outnh_As2", outnh_As2p);
			}
		}
		String newWordName = "氨氮分析项目原始记录.doc";
		DocUtil.download(request,response,"氨氮分析项目原始记录.docx",newWordName, map);

		return prefix + "/getdoc";
	}


	@GetMapping("/getsampleDoc/{reportId}")
	@ResponseBody
	public String  getsampleDoc(@PathVariable("reportId") String reportId,HttpServletRequest request, HttpServletResponse response) throws IOException {

		BizAssayResult bizAssayResult = bizAssayResultService.selectBizAssayResultByReportId(reportId);
		Map<String,Object> map =  new HashMap<>();
		map.put("date1", bizAssayResult.getAssayDate());
		map.put("date2", bizAssayResult.getAssayDate());
		map.put("name1", "进水");
		map.put("name2", "出水");
		map.put("num1", "0.001");
		map.put("num2", "0.002");

		String newWordName = "样品接收单.doc";
		DocUtil.download(request,response,"样品接收单.docx",newWordName, map);

		return prefix + "/getdoc";
	}
}
