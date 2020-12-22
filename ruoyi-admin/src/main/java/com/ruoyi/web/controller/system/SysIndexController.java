package com.ruoyi.web.controller.system;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.mapper.BizWaterWorkMapper;
import com.ruoyi.system.service.*;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.config.Global;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.framework.util.ShiroUtils;
import com.ruoyi.system.domain.SysMenu;
import com.ruoyi.system.domain.SysUser;
import com.ruoyi.system.domain.*;

/**
 * 首页 业务处理
 * 
 * @author ruoyi
 */
@Controller
public class SysIndexController extends BaseController
{
    @Autowired
    private ISysMenuService menuService;
    @Autowired
    IBizAssayService assayService;
    @Autowired
    IAssayResultService assayResultService;
    @Autowired
    IAssayFaultService assayFaultService;
    @Autowired
    private IAssayCurveService assayCurveService;

    @Autowired
    IBizDeviceService deviceService;
    @Autowired
    IBizDeviceMaintainService deviceMaintainService;
    @Autowired
    private IBizAgentiaRecordService bizAgentiaRecordService;
    @Autowired
    private IBizWasteService bizWasteService;
    @Autowired
    private IBizWaterWorkService bizWaterWorkService;
    @Autowired
    private IBizWeatherService bizWeatherService;
    @Autowired
    private IBizDeviceUnitService bizDeviceUnitService;
    @Autowired
    private IRegionService regionService;

    // 系统首页
    @GetMapping("/index")
    public String index(ModelMap mmap)
    {
        // 取身份信息
        SysUser user = ShiroUtils.getSysUser();
        // 根据用户id取出菜单
        List<SysMenu> menus = menuService.selectMenusByUser(user);
        mmap.put("menus", menus);
        mmap.put("user", user);
        mmap.put("copyrightYear", Global.getCopyrightYear());
        mmap.put("version", Global.getVersion());
        return "index";
    }

    // 系统介绍
    @GetMapping("/home")
    public String home(ModelMap mmap)
    {
        // 取身份信息
        SysUser user = ShiroUtils.getSysUser();
        // 根据用户id取出菜单
        List<SysMenu> menus = menuService.selectMenusByUser(user);
        mmap.put("menus", menus);
        mmap.put("user", user);
        mmap.put("copyrightYear", Global.getCopyrightYear());
        mmap.put("version", Global.getVersion());
        return "index_tmp";
    }

    // 项目
    @GetMapping("/chinamap")
    public String chinamap(ModelMap mmap)
    {
        return "water/map_china";
    }

    // 现场
    @GetMapping("/information")
    public String information( ModelMap mmap)
    {

        return "water/index_002";
    }

    // 现场
    @GetMapping("/scene")
    public String scene( ModelMap mmap)
    {
        return "water/index_001";
    }

    // 系统介绍
    @GetMapping("/system/main")
    public String main(ModelMap mmap)
    {
        mmap.put("version", Global.getVersion());
        return "main";
    }

    @PostMapping("/index/assayTotal")
    @ResponseBody
    public AjaxResult assayTotal(ModelMap mmap) {
        String jsonData = "{";
        List<DataEnity> assay =assayService.getAssayTotal();
        String key1 = "total";
        String key2 = "assayValue";
        if(assay!=null){
            String assaycount = "\""+key1+"\":[";
            String assayValue = "\""+key2+"\":[";
            int total=0;
            for(DataEnity Assaydata:assay){
                total +=Integer.valueOf(Assaydata.getValue());
                assayValue += "{name:\""+Assaydata.getKey()+"\",value:"+Assaydata.getValue()+"},";
            }
            assaycount += "\""+total+"\",";
            if(assayValue.length()>0){
                assayValue = assayValue.substring(0,assayValue.length()-1);
            }
            assaycount += "],";
            assayValue += "],";
            jsonData += assaycount+assayValue;
            if(jsonData.length()>0){
                jsonData = jsonData.substring(0,jsonData.length()-1);
            }
        }else{
            jsonData += "\""+key1+"\":[\"0\"],\""+key2+"\":[]";
        }
        jsonData += "}";
        AjaxResult ajax = AjaxResult.success();
        ajax.put("assayTotal", jsonData);
        return ajax;
    }


    @PostMapping("/index/deviceTotal")
    @ResponseBody
    public AjaxResult deviceTotal(ModelMap mmap) {
        String jsonData = "{";
        List<DataEnity> device =deviceService.getDeviceTotal();
        String key1 = "total";
        String key2 = "deviceValue";
        if(device!=null){
            String devicecount = "\""+key1+"\":[";
            String deviceValue = "\""+key2+"\":[";
            int total=0;
            for(DataEnity Devicedata:device){
                total +=Integer.valueOf(Devicedata.getValue());
                deviceValue += "{name:\""+Devicedata.getKey()+"\",value:"+Devicedata.getValue()+"},";
            }
            devicecount += "\""+total+"\",";
            if(deviceValue.length()>0){
                deviceValue = deviceValue.substring(0,deviceValue.length()-1);
            }
            devicecount += "],";
            deviceValue += "],";
            jsonData += devicecount+deviceValue;
            if(jsonData.length()>0){
                jsonData = jsonData.substring(0,jsonData.length()-1);
            }
        }else{
            jsonData += "\""+key1+"\":[\"0\"],\""+key2+"\":[]";
        }
        jsonData += "}";
        AjaxResult ajax = AjaxResult.success();
        ajax.put("deviceTotal", jsonData);
        return ajax;
    }


    @PostMapping("/index/getAssayByWorkTime")
    @ResponseBody
    public AjaxResult getAssayByWorkTime(@RequestBody JSONObject params) {
        long waterValue = params.getLong("waterValue");
        String  timeValue = params.getString("timeValue");
        String jsonData = "{";
        String key = "assayData";
        List<BizAssay> assayList = assayService.getAssayByWorkTime(waterValue,timeValue);
        if(assayList!=null&&assayList.size()>0){
            String assayData = "\""+key+"\":[";
            for(BizAssay obj:assayList){
                assayData += "\""+obj.getAssayNo()+"\",";
            }
            assayData += "],";
            jsonData += assayData;
            if(jsonData.length()>0){
                jsonData = jsonData.substring(0,jsonData.length()-1);
            }
        }else{
            jsonData += "\""+key+"\":[]";
        }
        jsonData += "}";
        AjaxResult ajax = AjaxResult.success();
        ajax.put("assayData", jsonData);
        return ajax;
    }


    @PostMapping("/index/getAssayByNo")
    @ResponseBody
    public AjaxResult getAssayByNo(@RequestBody JSONObject params) {

        String  NoValue = params.getString("NoValue");
        Map<String, Float> map = new HashMap<>();

        Map<String, String> nodemap = new HashMap<>();

        BizAssay assay = assayService.selectBizAssayByAssayNo(NoValue);
        List<AssayResult> assayResult = assayResultService.selectAssayResultByAssayNo(NoValue);
        List<AssayFault> assayFault = assayFaultService.selectAssayFaultByAssayNo(NoValue);

        String datesign="0";

        //获取化验数据
        if(assay!=null){

            String assayDate = assay.getAssayDate();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String now_date = sdf.format(new Date());
            if(now_date.equals(assayDate)){
                datesign="1";
            }

            if(assay.getDevice()!=null){
                nodemap.put("devicename",assay.getDevice().getDeviceName());
            }else{
                nodemap.put("devicename","");
            }
            nodemap.put("bigprocess",assay.getAssayBigprocess());
            nodemap.put("smallprocess",assay.getAssaySmallprocess());
            nodemap.put("repairBy",assay.getAssayBy());

            if("999".equals(assay.getAssayBigprocess())){
                nodemap.put("node","化验完成");
            }else{
                nodemap.put("node","化验中");
            }

            nodemap.put("version",assay.getVersion());
            nodemap.put("stepName",assay.getStepName());
            nodemap.put("stepTotal",assay.getStepTotal());
            nodemap.put("stepNow",assay.getStepNow());
            nodemap.put("stepInfo1",assay.getStepInfo1());
            nodemap.put("stepInfo2",assay.getStepInfo2());
            nodemap.put("stepInfo3",assay.getStepInfo3());

        }

        if(assayFault!=null){
            String alertCon="";
            int fault_status=0;
            for(AssayFault fault:assayFault){
                if(!"0".equals(fault.getFaultStatus())){
                    fault_status ++;
                    alertCon += fault.getFaultInfo().getFaultInfo()+"--"+fault.getFaultTime()+";";
                }
            }
            if(fault_status > 0){
                nodemap.put("fault","有故障");
                nodemap.put("node","化验故障");
                nodemap.put("alertCon",alertCon);
            }else{
                nodemap.put("fault","无故障");
                nodemap.put("alertCon","");
            }
        }else{
            nodemap.put("fault","无故障");
            nodemap.put("alertCon","");
        }

        String in_cod_con="[";
        String in_cod_abs="[";
        String out_cod_con="[";
        String out_cod_abs="[";
        String tp_con="[";
        String tp_abs="[";
        String tn_con="[";
        String tn_abs="[";
        String nh_con="[";
        String nh_abs="[";

        if(assayResult!=null){
            int tn_sign=0;float Intn=0;float OutTn=0;
            int tp_sign=0;float InTp=0;float OutTp=0;
            int nh_sign=0;float InNh=0;float OutNh=0;
            float InCod=0;float OutCod=0;

            for(AssayResult result :assayResult){
                String item= result.getAssayItem();
                String resultno = result.getResultNo();
                int r_no= Integer.valueOf(resultno);
                float c_value = result.getResultConcentration();

                if("1".equals(item)){
                    if(r_no>tn_sign){
                        tn_sign = r_no;
                        Intn = OutTn;
                        OutTn = c_value;
                    }else{
                        Intn = c_value;
                    }
                } else if("2".equals(item)){
                    if(r_no>nh_sign){
                        nh_sign = r_no;
                        InNh = OutNh;
                        OutNh = c_value;
                    }else{
                        InNh = c_value;
                    }
                } else if("3".equals(item)){
                    InCod = c_value;
                } else if("4".equals(item)){
                    OutCod = c_value;
                } else if("5".equals(item)){
                    if(r_no>tp_sign){
                        tp_sign = r_no;
                        InTp = OutTp;
                        OutTp = c_value;
                    }else{
                        InTp = c_value;
                    }
                }
            }
            map.put("in_cod",InCod);
            map.put("out_cod",OutCod);
            map.put("in_tp",InTp);
            map.put("out_tp",OutTp);
            map.put("in_tn",Intn);
            map.put("out_tn",OutTn);
            map.put("in_nh",InNh);
            map.put("out_nh",OutNh);


            AssayCurve curve = assayCurveService.selectAssayCurveByCurveNo("1");
             in_cod_con += curve.getCurveCon1()+","+curve.getCurveCon2()+","+curve.getCurveCon3()+","+curve.getCurveCon4()+","+curve.getCurveCon5()+","+curve.getCurveCon6()+","+curve.getCurveCon7();
             in_cod_abs += curve.getCurveAbs1()+","+curve.getCurveAbs2()+","+curve.getCurveAbs3()+","+curve.getCurveAbs4()+","+curve.getCurveAbs5()+","+curve.getCurveAbs6()+","+curve.getCurveAbs7();

            curve = assayCurveService.selectAssayCurveByCurveNo("2");
             tp_con += curve.getCurveCon1()+","+curve.getCurveCon2()+","+curve.getCurveCon3()+","+curve.getCurveCon4()+","+curve.getCurveCon5()+","+curve.getCurveCon6()+","+curve.getCurveCon7();
             tp_abs += curve.getCurveAbs1()+","+curve.getCurveAbs2()+","+curve.getCurveAbs3()+","+curve.getCurveAbs4()+","+curve.getCurveAbs5()+","+curve.getCurveAbs6()+","+curve.getCurveAbs7();

            curve = assayCurveService.selectAssayCurveByCurveNo("3");
             tn_con += curve.getCurveCon1()+","+curve.getCurveCon2()+","+curve.getCurveCon3()+","+curve.getCurveCon4()+","+curve.getCurveCon5()+","+curve.getCurveCon6()+","+curve.getCurveCon7();
             tn_abs += curve.getCurveAbs1()+","+curve.getCurveAbs2()+","+curve.getCurveAbs3()+","+curve.getCurveAbs4()+","+curve.getCurveAbs5()+","+curve.getCurveAbs6()+","+curve.getCurveAbs7();

            curve = assayCurveService.selectAssayCurveByCurveNo("3");
             nh_con += curve.getCurveCon1()+","+curve.getCurveCon2()+","+curve.getCurveCon3()+","+curve.getCurveCon4()+","+curve.getCurveCon5()+","+curve.getCurveCon6()+","+curve.getCurveCon7();
             nh_abs += curve.getCurveAbs1()+","+curve.getCurveAbs2()+","+curve.getCurveAbs3()+","+curve.getCurveAbs4()+","+curve.getCurveAbs5()+","+curve.getCurveAbs6()+","+curve.getCurveAbs7();

            curve = assayCurveService.selectAssayCurveByCurveNo("3");
             out_cod_con += curve.getCurveCon1()+","+curve.getCurveCon2()+","+curve.getCurveCon3()+","+curve.getCurveCon4()+","+curve.getCurveCon5()+","+curve.getCurveCon6()+","+curve.getCurveCon7();
             out_cod_abs += curve.getCurveAbs1()+","+curve.getCurveAbs2()+","+curve.getCurveAbs3()+","+curve.getCurveAbs4()+","+curve.getCurveAbs5()+","+curve.getCurveAbs6()+","+curve.getCurveAbs7();


        }

        in_cod_con+="]";
        in_cod_abs+="]";
        out_cod_con+="]";
        out_cod_abs+="]";
        tp_con+="]";
        tp_abs+="]";
        tn_con+="]";
        tn_abs+="]";
        nh_con+="]";
        nh_abs+="]";

        String curveData = "{in_cod_con:"+in_cod_con+",in_cod_abs:"+in_cod_abs+
                ",out_cod_con:"+out_cod_con+",out_cod_abs:"+out_cod_abs+
                ",tp_con:"+tp_con+",tp_abs:"+tp_abs+
                ",tn_con:"+tn_con+",tn_abs:"+tn_abs+
                ",nh_con:"+nh_con+",nh_abs:"+nh_abs+"}";

        Gson gson = new Gson();
        String jsonData = gson.toJson(map);
        String node_jsonData = gson.toJson(nodemap);

        String all_jsonData = gson.toJson(assayResult);

        AjaxResult ajax = AjaxResult.success();
        ajax.put("assayData", jsonData);
        ajax.put("nodeData", node_jsonData);
        ajax.put("curveData", curveData);
        ajax.put("datesign", datesign);
        ajax.put("all_jsonData", all_jsonData);
        return ajax;
    }


    @PostMapping("/index/relieveAlert")
    @ResponseBody
    public AjaxResult relieveAlert(@RequestBody JSONObject params) {


        String NoValue = params.getString("NoValue");
        List<AssayFault> assayFaultlist = assayFaultService.selectAssayFaultByAssayNo(NoValue);
        if(assayFaultlist!=null){
            for(AssayFault fault:assayFaultlist){
                AssayFault result = new AssayFault();
                result.setFaultId(fault.getFaultId());
                result.setFaultStatus("0");
                assayFaultService.updateAssayFault(result);
            }
        }
        AjaxResult ajax = AjaxResult.success();
        return ajax;
    }


    @PostMapping("/index/getAssayListByIDBE")
    @ResponseBody
    public AjaxResult getAssayListByIDBE(@RequestBody JSONObject params) {

        long waterValue = params.getLong("waterValue");
        String  startTime = params.getString("startTime");
        String  endTime = params.getString("endTime");
        BizAssay assay = new BizAssay();

        Map<String, Object> data_params = new HashMap<>();
        data_params.put("beginTime",startTime);
        data_params.put("endTime",endTime);
        data_params.put("Works",waterValue);
        assay.setParams(data_params);

        List<BizAssay> assayList = assayService.selectBizAssayList(assay);

        String resultdata="[";

        String in_cod_data="[";
        String out_cod_data="[";
        String in_tp_data="[";
        String out_tp_data="[";
        String in_tn_data="[";
        String out_tn_data="[";
        String in_nh_data="[";
        String out_nh_data="[";

        if(assayList!=null){

            for(BizAssay object:assayList){
                String assayno = object.getAssayNo();
                List<AssayResult> assayResult = assayResultService.selectAssayResultByAssayNo(assayno);
                if(assayResult!=null&&assayResult.size()>0){
                    resultdata +="'"+object.getAssayDate()+"',";
                }
                for(AssayResult result: assayResult){
                    String r_no= result.getResultNo();
                    String item= result.getAssayItem();
                    float value= result.getResultConcentration();

                    if("001".equals(r_no)){
                        in_nh_data +=value+",";
                    }else if("002".equals(r_no)){
                        out_nh_data +=value+",";
                    }else if("003".equals(r_no)){
                        in_tp_data +=value+",";
                    }else if("004".equals(r_no)){
                        out_tp_data +=value+",";
                    }else if("005".equals(r_no)){
                        in_tn_data +=value+",";
                    }else if("006".equals(r_no)){
                        out_tn_data +=value+",";
                    }else if("007".equals(r_no)){
                        in_cod_data +=value+",";
                    }else if("008".equals(r_no)){
                        out_cod_data +=value+",";
                    }

                }
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

        String assayData = "{assaydate:"+resultdata+",in_cod_data:"+in_cod_data+",out_cod_data:"+out_cod_data+
                ",in_tp_data:"+in_tp_data+",out_tp_data:"+out_tp_data+
                ",in_tn_data:"+in_tn_data+",out_tn_data:"+out_tn_data+
                ",in_nh_data:"+in_nh_data+",out_nh_data:"+out_nh_data+"}";

        AjaxResult ajax = AjaxResult.success();
        ajax.put("assayData", assayData);
        return ajax;
    }


    @PostMapping("/index/alertTotal")
    @ResponseBody
    public AjaxResult alertTotal(ModelMap mmap) {
        String jsonData = "{";
        int normal_size =0;
        int alert_size =0;
        int fault_size =0;

        List<DataEnity> assay =assayService.getAssayTotal();
        for(DataEnity data:assay){
            if("正常化验".equals(data.getKey())){
                normal_size = Integer.valueOf(data.getValue());
            }else if("未完成化验".equals(data.getKey())){
                fault_size = Integer.valueOf(data.getValue());
            }
        }

        String key1 = "alertName";
        String key2 = "alertNum";

        String alertName = "\""+key1+"\":[";
        String alertNum = "\""+key2+"\":[";


        alertName +="\"正常\",";
        alertNum += normal_size+",";

        alertName +="\"设备告警\",";
        alertNum += alert_size+",";

        alertName +="\"运行故障\"";
        alertNum += fault_size;


        alertName += "],";
        alertNum += "]";
        jsonData += alertName+alertNum;

        jsonData += "}";
        AjaxResult ajax = AjaxResult.success();
        ajax.put("alertTotal", jsonData);
        return ajax;
    }


    @PostMapping("/index/maintainTotal")
    @ResponseBody
    public AjaxResult maintainTotal(ModelMap mmap) {
        String jsonData = "{";
        BizDevice de = new BizDevice();
        List<BizDevice> result = deviceService.selectBizDeviceList(de);
        BizDeviceMaintain main = new BizDeviceMaintain();
        main.setMaintainResult("1");
        List<BizDeviceMaintain> m_result = deviceMaintainService.selectBizDeviceMaintainList(main);
        List<DataEnity> maintains =deviceMaintainService.getMaintainTotal();
        int normal_size =0;
        if(result!=null){
            if(m_result!=null){
                normal_size = result.size() -m_result.size();
            }else{
                normal_size = result.size();
            }
        }

        String key1 = "maintainName";
        String key2 = "maintainNum";

        String maintainName = "\""+key1+"\":[";
        String maintainNum = "\""+key2+"\":[";


        maintainName +="\"正常\",";
        maintainNum += normal_size+",";

        for(DataEnity maintain : maintains){

            maintainName +="\""+maintain.getKey()+"\",";
            maintainNum += maintain.getValue()+",";
        }
        if(maintains.size()>0){
            maintainName = maintainName.substring(0,maintainName.length()-1);
            maintainNum = maintainNum.substring(0,maintainNum.length()-1);
        }


        maintainName += "],";
        maintainNum += "]";
        jsonData += maintainName+maintainNum;

        jsonData += "}";
        AjaxResult ajax = AjaxResult.success();
        ajax.put("maintainTotal", jsonData);
        return ajax;
    }



    @PostMapping("/index/getAgentiaTotal")
    @ResponseBody
    public AjaxResult getAgentiaTotal(@RequestBody JSONObject params) {
        String jsonData = "{";
        String  NoValue = params.getString("NoValue");
        Long  waterValue = params.getLong("waterValue");
        String timeValue = params.getString("timeValue");
        List<DataEnity> totalList = bizAgentiaRecordService.getAgentiaTotal(NoValue,waterValue);
//        List<DataEnity> avgList = bizAgentiaRecordService.getAgentiaMonthAvg(waterValue,timeValue);

        String key1 = "agentia";
        String key2 = "total";
//        String key3 = "avg";

        String agentia = "\""+key1+"\":[";
        String total = "\""+key2+"\":[";
//        String avg = "\""+key3+"\":[";

        if(totalList!=null){
            for(DataEnity obj:totalList){
                agentia +="\""+obj.getKey()+"\",";
                total += obj.getValue()+",";
            }
//            for(DataEnity obj:avgList){
//                avg += obj.getValue()+",";
//            }
            if(totalList.size()>0){
                agentia = agentia.substring(0,agentia.length()-1);
                total = total.substring(0,total.length()-1);

            }
//            if(avgList.size()>0){
//                avg = avg.substring(0,avg.length()-1);
//            }
        }

        agentia += "],";
        total += "]";
//        avg += "]";
        jsonData += agentia+total;
        jsonData += "}";
        AjaxResult ajax = AjaxResult.success();
        ajax.put("agentiaTotal", jsonData);
        return ajax;
    }


    @PostMapping("/index/getWasteTotal")
    @ResponseBody
    public AjaxResult getWasteTotal(@RequestBody JSONObject params) {
        String jsonData = "{";
        String  NoValue = params.getString("NoValue");
        Long  waterValue = params.getLong("waterValue");
        String timeValue = params.getString("timeValue");

        List<DataEnity> totalList = bizWasteService.getWasteBar(NoValue,waterValue,timeValue);

        String key1 = "wasteName";
        String key2 = "wasteValue";

        String wasteName = "\""+key1+"\":[";
        String wasteValue = "\""+key2+"\":[";

        if(totalList!=null){
            for(DataEnity obj:totalList){
                wasteName +="\""+obj.getKey()+"\",";
                wasteValue += obj.getValue()+",";
            }
            if(totalList.size()>0){
                wasteName = wasteName.substring(0,wasteName.length()-1);
                wasteValue = wasteValue.substring(0,wasteValue.length()-1);
            }
        }

        wasteName += "],";
        wasteValue += "]";
        jsonData += wasteName+wasteValue;
        jsonData += "}";
        AjaxResult ajax = AjaxResult.success();
        ajax.put("wasteTotal", jsonData);
        return ajax;
    }


    @PostMapping("/index/getWeather")
    @ResponseBody
    public AjaxResult getWeather(@RequestBody JSONObject params) {
        String jsonData = "{";
        Long  waterValue = params.getLong("waterValue");
        String  startTime = params.getString("startTime");
        String  endTime = params.getString("endTime");

        String key1 = "weatherTime";
        String key2 = "daytemp";
        String key3 = "nighttemp";
        String key4 = "daypower";
        String key5 = "nigpower";

        String weatherTime = "\""+key1+"\":[";
        String daytemp = "\""+key2+"\":[";
        String nighttemp = "\""+key3+"\":[";
        String daypower = "\""+key4+"\":[";
        String nigpower = "\""+key5+"\":[";

        BizWaterWork work = bizWaterWorkService.selectBizWaterWorkById(waterValue);
        if(work!=null){
            String areacode = work.getWorksArea();
            List<BizWeather> weatherList = bizWeatherService.selectWeatherLine(areacode,startTime,endTime);
            for(BizWeather weather : weatherList){
                weatherTime +="\""+weather.getWeatherDate()+"\",";
                daytemp += weather.getWeatherDaytemp()+",";
                nighttemp += weather.getWeatherNighttemp()+",";
                daypower += weather.getWeatherDaypower()+",";
                nigpower += weather.getWeatherNightpower()+",";
            }
            if(weatherList.size()>0){
                weatherTime = weatherTime.substring(0,weatherTime.length()-1);
                daytemp = daytemp.substring(0,daytemp.length()-1);
                nighttemp = nighttemp.substring(0,nighttemp.length()-1);
                daypower = daypower.substring(0,daypower.length()-1);
                nigpower = nigpower.substring(0,nigpower.length()-1);
            }

        }

        weatherTime += "],";
        daytemp += "],";
        nighttemp += "],";
        daypower += "],";
        nigpower += "]";

        jsonData += weatherTime+daytemp+nighttemp+daypower+nigpower;
        jsonData += "}";
        AjaxResult ajax = AjaxResult.success();
        ajax.put("weatherData", jsonData);
        return ajax;
    }

    @PostMapping("/index/getUnitNum")
    @ResponseBody
    public AjaxResult getUnitNum(@RequestBody JSONObject params) {
        String jsonData = "{";
        Long  waterValue = params.getLong("waterValue");

        String key1 = "unitName";
        String key2 = "unitNum";

        String unitName = "\""+key1+"\":[";
        String unitNum = "\""+key2+"\":[";

        BizDevice device = deviceService.selectBizDeviceByWork(waterValue);
        if(device!=null){
            Long deviceId = device.getDeviceId();
            List<DataEnity> unitList = bizDeviceUnitService.getUnitNum(deviceId);
            for(DataEnity unit : unitList){
                unitName +="\""+unit.getKey()+"\",";
                unitNum += unit.getValue()+",";
            }
            if(unitList.size()>0){
                unitName = unitName.substring(0,unitName.length()-1);
                unitNum = unitNum.substring(0,unitNum.length()-1);
            }
        }


        unitName += "],";
        unitNum += "]";
        jsonData += unitName+unitNum;
        jsonData += "}";
        AjaxResult ajax = AjaxResult.success();
        ajax.put("unitTotal", jsonData);
        return ajax;
    }


    @PostMapping("/index/getOutline")
    @ResponseBody
    public AjaxResult getOutline(@RequestBody JSONObject params) {
        String jsonData = "{";
        Long  waterValue = params.getLong("waterValue");
        String  startTime = params.getString("startTime");
        String  endTime = params.getString("endTime");

        String key1 = "out_r";
        String key2 = "out_w";

        String out_r = "\""+key1+"\":[";
        String out_w = "\""+key2+"\":[";

        OutDataEnity outData = assayResultService.getOuaData(waterValue,startTime,endTime);
        if(outData!=null){
            out_r +=outData.getOutcod_r()+","+outData.getOutnh_r()+","+outData.getOuttn_r()+","+outData.getOuttp_r();
            out_w +=outData.getOutcod_w()+","+outData.getOutnh_w()+","+outData.getOuttn_w()+","+outData.getOuttp_w();
        }

        out_r += "],";
        out_w += "]";
        jsonData += out_r+out_w;
        jsonData += "}";
        AjaxResult ajax = AjaxResult.success();
        ajax.put("outData", jsonData);
        return ajax;
    }

    @PostMapping("/index/getAreamap")
    @ResponseBody
    public AjaxResult getAreamap(@RequestBody JSONObject params) {
        String jsonData = "{";
        String  area = params.getString("area");
        BizWaterWork work = new BizWaterWork();
        work.setWorksProvince(area);

        List<BizWaterWork> worksList = bizWaterWorkService.selectBizWaterWorkList(work);

        String key1 = "area";

        String agentia = "\""+key1+"\":[";

        if(worksList!=null){
            for(BizWaterWork obj:worksList){
                agentia +="{\"name\":\""+obj.getWorksName()+"\",\"coord\": ["
                +obj.getWorksLongitude()+","+obj.getWorksLatitude()+"],\"runConut\": \'537\',\"num\": \'234\'},";
            }
            if(worksList.size()>0){
                agentia = agentia.substring(0,agentia.length()-1);
            }
        }

        agentia += "]";
        jsonData += agentia;
        jsonData += "}";
        AjaxResult ajax = AjaxResult.success();
        ajax.put("areamap", jsonData);
        return ajax;
    }


    @PostMapping("/index/freshIndex")
    @ResponseBody
    public AjaxResult freshIndex(@RequestBody JSONObject params) {
        System.out.println("freshIndex");
        AjaxResult ajax = AjaxResult.success();
        return ajax;
    }


    @PostMapping("/index/selectByParentCode")
    @ResponseBody
    public AjaxResult selectByParentCode(@RequestBody JSONObject params) {
        String jsonData = "{region:[";

        String  ParentCode = params.getString("ParentCode");
        List<Region> regionList = regionService.selectByParentCode(ParentCode);
        if(regionList.size()>0){
            for(Region region : regionList){
                jsonData +="[\""+region.getRegionCod()+"\",\""+region.getRegionName()+"\"],";
            }
            jsonData = jsonData.substring(0,jsonData.length()-1);
        }

        jsonData += "]}";
        AjaxResult ajax = AjaxResult.success();
        ajax.put("regionData", jsonData);
        return ajax;
    }

}
