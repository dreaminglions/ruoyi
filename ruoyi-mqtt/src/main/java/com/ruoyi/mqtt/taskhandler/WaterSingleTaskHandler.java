package com.ruoyi.mqtt.taskhandler;


import com.alibaba.fastjson.JSONObject;
import com.ruoyi.mqtt.util.ApplicationFactory;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.mapper.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;


/**
 * 告警恢复数据上传任务处理类
 * @author bida
 * @version 2017-03-08
 */
public class WaterSingleTaskHandler implements IMqttTaskHandler {
	private static Logger logger = LoggerFactory.getLogger(WaterSingleTaskHandler.class);

	public WaterSingleTaskHandler( ) {
	}
	
	@Override
	public void handle(String message) {
//		System.out.println("这是一条化验单个信息数据");
//		try{
//			if("close".equals(message)){
//			}else{
//				JSONObject jsonObject = JSONObject.parseObject(message);
//				String message_content = jsonObject.getJSONObject("d").getString("mtopic/test2");
//
//				System.out.println("内容："+message_content);
//
//
//
//				JSONObject jsonObject_content  = JSONObject.parseObject(message_content);
//				String json_deviceNo = jsonObject_content.getJSONObject("标识").getString("设备编号");
//				String json_waterNo = jsonObject_content.getJSONObject("标识").getString("水厂编号");
//				String json_assayNo = jsonObject_content.getJSONObject("标识").getString("化验编号");
//
//				String json_year = jsonObject_content.getJSONObject("时间信息").getString("年");
//				String json_month = jsonObject_content.getJSONObject("时间信息").getString("月");
//				String json_day = jsonObject_content.getJSONObject("时间信息").getString("日");
//				String json_hour = jsonObject_content.getJSONObject("时间信息").getString("时");
//				String json_minutes = jsonObject_content.getJSONObject("时间信息").getString("分");
//				String json_second = jsonObject_content.getJSONObject("时间信息").getString("秒");
//
//
//				String tn_wave1 = jsonObject_content.getJSONObject("总氮").getString("波长1");
//				String tn_wave2 = jsonObject_content.getJSONObject("总氮").getString("波长2");
//				String tn_curve_k = jsonObject_content.getJSONObject("总氮").getString("曲线K");
//				String tn_curve_b = jsonObject_content.getJSONObject("总氮").getString("曲线B");
//
//				String nh_wave1 = jsonObject_content.getJSONObject("氨氮").getString("波长1");
//				String nh_wave2 = jsonObject_content.getJSONObject("氨氮").getString("波长2");
//				String nh_curve_k = jsonObject_content.getJSONObject("氨氮").getString("曲线K");
//				String nh_curve_b = jsonObject_content.getJSONObject("氨氮").getString("曲线B");
//
//				String incod_wave1 = jsonObject_content.getJSONObject("高COD").getString("波长1");
//				String incod_wave2 = jsonObject_content.getJSONObject("高COD").getString("波长2");
//				String incod_curve_k = jsonObject_content.getJSONObject("高COD").getString("曲线K");
//				String incod_curve_b = jsonObject_content.getJSONObject("高COD").getString("曲线B");
//
//				String outcod_wave1 = jsonObject_content.getJSONObject("低COD").getString("波长1");
//				String outcod_wave2 = jsonObject_content.getJSONObject("低COD").getString("波长2");
//				String outcod_curve_k = jsonObject_content.getJSONObject("低COD").getString("曲线K");
//				String outcod_curve_b = jsonObject_content.getJSONObject("低COD").getString("曲线B");
//
//				String tp_wave1 = jsonObject_content.getJSONObject("总磷").getString("波长1");
//				String tp_wave2 = jsonObject_content.getJSONObject("总磷").getString("波长2");
//				String tp_curve_k = jsonObject_content.getJSONObject("总磷").getString("曲线K");
//				String tp_curve_b = jsonObject_content.getJSONObject("总磷").getString("曲线B");
//				if(json_month.length()==1){
//					json_month = "0"+json_month;
//				}
//				if(json_day.length()==1){
//					json_day = "0"+json_day;
//				}
//				if(json_hour.length()==1){
//					json_hour = "0"+json_hour;
//				}
//				if(json_minutes.length()==1){
//					json_minutes = "0"+json_minutes;
//				}
//
//				if(json_second.length()==1){
//					json_second = "0"+json_second;
//				}
//
//				System.out.println("设备编号："+json_deviceNo);
//				System.out.println("水厂编号："+json_waterNo);
//				System.out.println("时间："+"20"+json_year+"-"+json_month+"-"+json_day+"  "+json_hour+":"+json_minutes+":"+json_second);
//
//				String date1 = "20"+json_year+"-"+json_month+"-"+json_day;
//				String time1 = "20"+json_year+"-"+json_month+"-"+json_day+"  "+json_hour+":"+json_minutes+":"+json_second;
//
//				String assay_time =json_year+json_month+json_day;
//				String orderno = "H"+json_deviceNo+json_waterNo+assay_time+json_assayNo;
//				System.out.println("化验编号："+orderno);
//
//				ApplicationContext ctx = ApplicationFactory.getInstance();
//				BizAssayCurveMapper bizAssayCurveMapper = (BizAssayCurveMapper)ctx.getBean("bizAssayCurveMapper");
//				BizWaterWorkMapper bizWaterWorkMapper = (BizWaterWorkMapper)ctx.getBean("bizWaterWorkMapper");
//				BizDeviceMapper bizDeviceMapper = (BizDeviceMapper)ctx.getBean("bizDeviceMapper");
//
//				if(json_year.length()==1){
//					System.out.println("时间格式错误");
//				}else{
//
//					BizDevice device = bizDeviceMapper.selectBizDeviceByNo(json_deviceNo);
//
//					if(device==null){
//						System.out.println("设备不存在");
//					}else{
//
//						BizWaterWork waterwork = bizWaterWorkMapper.selectBizWaterWorkByNo(json_waterNo);
//
//						if(waterwork==null){
//							System.out.println("水厂不存在");
//						}else{
//							//水厂及设备存在
//							long workId = waterwork.getWorksId();
//							long deviceId = device.getDeviceId();
//
//
//							BizAssayCurve bizCurve = bizAssayCurveMapper.selectBizAssayCurveByNo(orderno);
//
//							if(bizCurve==null){
//								//添加curve信息
//								BizAssayCurve curve =new  BizAssayCurve();
//
//								curve.setReportId(orderno);
//								curve.setCurveTime(time1);
//
//								curve.setTnWave1(Float.valueOf(tn_wave1));
//								curve.setTnWave2(Float.valueOf(tn_wave2));
//								curve.setTnCurveK(Float.valueOf(tn_curve_k));
//								curve.setTnCurveB(Float.valueOf(tn_curve_b));
//
//								curve.setTpWave1(Float.valueOf(tp_wave1));
//								curve.setTpWave2(Float.valueOf(tp_wave2));
//								curve.setTpCurveK(Float.valueOf(tp_curve_k));
//								curve.setTpCurveB(Float.valueOf(tp_curve_b));
//
//								curve.setNhWave1(Float.valueOf(nh_wave1));
//								curve.setNhWave2(Float.valueOf(nh_wave2));
//								curve.setNhCurveK(Float.valueOf(nh_curve_k));
//								curve.setNhCurveB(Float.valueOf(nh_curve_b));
//
//								curve.setIncodWave1(Float.valueOf(incod_wave1));
//								curve.setIncodWave2(Float.valueOf(incod_wave2));
//								curve.setIncodCurveK(Float.valueOf(incod_curve_k));
//								curve.setIncodCurveB(Float.valueOf(incod_curve_b));
//
//								curve.setOutcodWave1(Float.valueOf(outcod_wave1));
//								curve.setOutcodWave2(Float.valueOf(outcod_wave2));
//								curve.setOutcodCurveK(Float.valueOf(outcod_curve_k));
//								curve.setOutcodCurveB(Float.valueOf(outcod_curve_b));
//
//								bizAssayCurveMapper.insertBizAssayCurve(curve);
//							}else{
//								//已存在数据
//							}
//
//						}
//					}
//				}
//
//			}
//		} catch (Exception e) {
//		e.printStackTrace();
//	}

	}

}
