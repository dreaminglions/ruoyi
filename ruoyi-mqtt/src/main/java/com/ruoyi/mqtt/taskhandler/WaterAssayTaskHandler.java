package com.ruoyi.mqtt.taskhandler;


import com.alibaba.fastjson.JSONObject;
import com.ruoyi.mqtt.domain.Mqconsumer;
import com.ruoyi.mqtt.util.ApplicationFactory;
import com.ruoyi.system.domain.BizAssayResult;
import com.ruoyi.system.domain.BizDevice;
import com.ruoyi.system.domain.BizWaterWork;
import com.ruoyi.system.mapper.BizAssayResultMapper;
import com.ruoyi.system.mapper.BizDeviceMapper;
import com.ruoyi.system.mapper.BizOrderMapper;
import com.ruoyi.system.mapper.BizWaterWorkMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;


/**
 * 告警恢复数据上传任务处理类
 * @author bida
 * @version 2017-03-08
 */
public class WaterAssayTaskHandler implements IMqttTaskHandler {
	private static Logger logger = LoggerFactory.getLogger(WaterAssayTaskHandler.class);

	public WaterAssayTaskHandler( ) {
	}
	
	@Override
	public void handle(String message) {
		System.out.println("这是一条化验结果信息数据");
		try{
			if("close".equals(message)){
			}else{
				JSONObject jsonObject = JSONObject.parseObject(message);
				String message_content = jsonObject.getJSONObject("d").getString("mtopic/test3");
//				System.out.println("内容："+message_content);

				JSONObject jsonObject_content  = JSONObject.parseObject(message_content);
				String json_deviceNo = jsonObject_content.getJSONObject("标识").getString("设备编号");
				String json_waterNo = jsonObject_content.getJSONObject("标识").getString("水厂编号");
				String json_assayNo = jsonObject_content.getJSONObject("标识").getString("化验编号");

				String s_in_cod = jsonObject_content.getJSONObject("进水水样").getString("高COD浓度值");
				String s_incod_abs = jsonObject_content.getJSONObject("进水水样").getString("高CODABS值");

				String s_in_tp = jsonObject_content.getJSONObject("进水水样").getString("总磷浓度值");
				String s_intp_abs = jsonObject_content.getJSONObject("进水水样").getString("总磷ABS值");

				String s_in_tn = jsonObject_content.getJSONObject("进水水样").getString("总氮浓度值");
				String s_intn_abs = jsonObject_content.getJSONObject("进水水样").getString("总氮ABS值");

				String s_in_nh = jsonObject_content.getJSONObject("进水水样").getString("氨氮浓度值");
				String s_innh_abs = jsonObject_content.getJSONObject("进水水样").getString("氨氮ABS值");


				String s_out_cod = jsonObject_content.getJSONObject("出水水样").getString("低COD浓度值");
				String s_outcod_abs = jsonObject_content.getJSONObject("出水水样").getString("低CODABS值");

				String s_out_tp = jsonObject_content.getJSONObject("出水水样").getString("总磷浓度值");
				String s_outtp_abs = jsonObject_content.getJSONObject("出水水样").getString("总磷ABS值");

				String s_out_tn = jsonObject_content.getJSONObject("出水水样").getString("总氮浓度值");
				String s_outtn_abs = jsonObject_content.getJSONObject("出水水样").getString("总氮ABS值");

				String s_out_nh = jsonObject_content.getJSONObject("出水水样").getString("氨氮浓度值");
				String s_outnh_abs = jsonObject_content.getJSONObject("出水水样").getString("氨氮ABS值");

				String json_year = jsonObject_content.getJSONObject("时间信息").getString("年");
				String json_month = jsonObject_content.getJSONObject("时间信息").getString("月");
				String json_day = jsonObject_content.getJSONObject("时间信息").getString("日");
				String json_hour = jsonObject_content.getJSONObject("时间信息").getString("时");
				String json_minutes = jsonObject_content.getJSONObject("时间信息").getString("分");
				String json_second = jsonObject_content.getJSONObject("时间信息").getString("秒");
				System.out.println("设备编号："+json_deviceNo);
				System.out.println("水厂编号："+json_waterNo);

				if(json_month.length()==1){
					json_month = "0"+json_month;
				}
				if(json_day.length()==1){
					json_day = "0"+json_day;
				}
				if(json_hour.length()==1){
					json_hour = "0"+json_hour;
				}
				if(json_minutes.length()==1){
					json_minutes = "0"+json_minutes;
				}

				if(json_second.length()==1){
					json_second = "0"+json_second;
				}

				System.out.println("时间："+"20"+json_year+"-"+json_month+"-"+json_day+"  "+json_hour+":"+json_minutes+":"+json_second);
				String assay_time =json_year+json_month+json_day;
				String orderno = "H"+json_deviceNo+json_waterNo+assay_time+json_assayNo;
				System.out.println("化验编号："+orderno);

				ApplicationContext ctx = ApplicationFactory.getInstance();
				BizAssayResultMapper bizAssayResultMapper = (BizAssayResultMapper)ctx.getBean("bizAssayResultMapper");
				BizOrderMapper bizOrderMapper = (BizOrderMapper)ctx.getBean("bizOrderMapper");
				BizWaterWorkMapper bizWaterWorkMapper = (BizWaterWorkMapper)ctx.getBean("bizWaterWorkMapper");
				BizDeviceMapper bizDeviceMapper = (BizDeviceMapper)ctx.getBean("bizDeviceMapper");


				if(json_year.length()==1){
					System.out.println("时间格式错误");
				}else{

					BizDevice device = bizDeviceMapper.selectBizDeviceByNo(json_deviceNo);

					if(device==null){
						System.out.println("设备不存在");
					}else{

						BizWaterWork waterwork = bizWaterWorkMapper.selectBizWaterWorkByNo(json_waterNo);

						if(waterwork==null){
							System.out.println("水厂不存在");
						}else{
							//水厂及设备存在
							long workId = waterwork.getWorksId();
							long deviceId = device.getDeviceId();


							BizAssayResult result = bizAssayResultMapper.selectBizAssayResultByNo(orderno);

							if(result == null){
								//插入数据库化验信息
								BizAssayResult biz =new BizAssayResult();
								biz.setResultWorks(workId);
								biz.setResultDevice(deviceId);
								biz.setResultNo(orderno);
								biz.setReportId(orderno);
								biz.setResultNode("0");

								//更新化验结果值
								biz.setInCod(Float.valueOf(s_in_cod));
								biz.setIncodAbs(Float.valueOf(s_incod_abs));
								biz.setInTp(Float.valueOf(s_in_tp));
								biz.setIntpAbs(Float.valueOf(s_intp_abs));
								biz.setInTn(Float.valueOf(s_in_tn));
								biz.setIntnAbs(Float.valueOf(s_intn_abs));
								biz.setInNh3(Float.valueOf(s_in_nh));
								biz.setInnhAbs(Float.valueOf(s_innh_abs));

								biz.setOutCod(Float.valueOf(s_out_cod));
								biz.setOutcodAbs(Float.valueOf(s_outcod_abs));
								biz.setOutTp(Float.valueOf(s_out_tp));
								biz.setOuttpAbs(Float.valueOf(s_outtp_abs));
								biz.setOutTn(Float.valueOf(s_out_tn));
								biz.setOuttnAbs(Float.valueOf(s_outtn_abs));
								biz.setOutNh3(Float.valueOf(s_out_nh));
								biz.setOutnhAbs(Float.valueOf(s_outnh_abs));

								bizAssayResultMapper.insertBizAssayResult(biz);

							}else{
								//更新化验信息
								//判断当前化验的数据库状态，如果状态不是999-1/999-2/999-3，那么更新最新状态
								// 如果已经完成化验999-3/999-1，那么不更新；
								// 如果化验结果更新999-2，那么更新999-3化验结束；
								// 如果为其他状态那么更新为化验结束（但未更新化验结果数据）

								String result_node = result.getResultNode();

								if("999".equals(result_node)){
									//已经更新结束状态，不操作
								}else{
									//更新为999-2结束状态
//						result.setResultNode("999-2");
									//更新化验结果值
									result.setInCod(Float.valueOf(s_in_cod));
									result.setIncodAbs(Float.valueOf(s_incod_abs));
									result.setInTp(Float.valueOf(s_in_tp));
									result.setIntpAbs(Float.valueOf(s_intp_abs));
									result.setInTn(Float.valueOf(s_in_tn));
									result.setIntnAbs(Float.valueOf(s_intn_abs));
									result.setInNh3(Float.valueOf(s_in_nh));
									result.setInnhAbs(Float.valueOf(s_innh_abs));

									result.setOutCod(Float.valueOf(s_out_cod));
									result.setOutcodAbs(Float.valueOf(s_outcod_abs));
									result.setOutTp(Float.valueOf(s_out_tp));
									result.setOuttpAbs(Float.valueOf(s_outtp_abs));
									result.setOutTn(Float.valueOf(s_out_tn));
									result.setOuttnAbs(Float.valueOf(s_outtn_abs));
									result.setOutNh3(Float.valueOf(s_out_nh));
									result.setOutnhAbs(Float.valueOf(s_outnh_abs));

									bizAssayResultMapper.updateBizAssayResult(result);

								}

							}
						}
					}
				}

			}
		} catch (Exception e) {
		e.printStackTrace();
	}

	}

}
