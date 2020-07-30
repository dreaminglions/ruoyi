package com.ruoyi.mqtt.taskhandler;


import com.alibaba.fastjson.JSONObject;
import com.ruoyi.mqtt.util.ApplicationFactory;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.mapper.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * 告警恢复数据上传任务处理类
 * @author bida
 * @version 2017-03-08
 */
public class WaterBasicTaskHandler implements IMqttTaskHandler {
	private static Logger logger = LoggerFactory.getLogger(WaterBasicTaskHandler.class);

	public WaterBasicTaskHandler( ) {
	}
	
	@Override
	public void handle(String message) {
//		System.out.println("这是一条化验基本信息数据");
//		try{
//			if("close".equals(message)){
//			}else{
//				JSONObject jsonObject = JSONObject.parseObject(message);
//				String message_content = jsonObject.getJSONObject("d").getString("mtopic/test1");
////				System.out.println("内容："+message_content);
//
//				JSONObject jsonObject_content  = JSONObject.parseObject(message_content);
//
//				String waste = jsonObject_content.getString("废液量");
//
//				String device_begin = jsonObject_content.getJSONObject("设备").getString("设备上电标识");
//				String assay_begin = jsonObject_content.getJSONObject("设备").getString("设备运行标识");
//				String node = jsonObject_content.getJSONObject("设备").getString("化验结束标识");
//				String fault = jsonObject_content.getJSONObject("设备").getString("设备故障标识");
//				String fault_code = jsonObject_content.getJSONObject("设备").getString("报警代码");
//				String bigprocess = jsonObject_content.getJSONObject("设备").getString("设备当前大流程");
//				String smallprocess = jsonObject_content.getJSONObject("设备").getString("设备当前小流程");
//
//				String json_deviceNo = jsonObject_content.getJSONObject("标识").getString("设备编号");
//				String json_waterNo = jsonObject_content.getJSONObject("标识").getString("水厂编号");
//				String json_assayNo = jsonObject_content.getJSONObject("标识").getString("化验编号");
//
//				String agentia_consume = jsonObject_content.getJSONObject("药剂消耗量").toString();
//				String agentia_remain = jsonObject_content.getJSONObject("药剂余量").toString();
//
//
//				String json_year = jsonObject_content.getJSONObject("时间信息").getString("年");
//				String json_month = jsonObject_content.getJSONObject("时间信息").getString("月");
//				String json_day = jsonObject_content.getJSONObject("时间信息").getString("日");
//				String json_hour = jsonObject_content.getJSONObject("时间信息").getString("时");
//				String json_minutes = jsonObject_content.getJSONObject("时间信息").getString("分");
//				String json_second = jsonObject_content.getJSONObject("时间信息").getString("秒");
//				System.out.println("设备编号："+json_deviceNo);
//				System.out.println("水厂编号："+json_waterNo);
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
//				System.out.println("时间："+"20"+json_year+"-"+json_month+"-"+json_day+"  "+json_hour+":"+json_minutes+":"+json_second);
//
//				String date1 = "20"+json_year+"-"+json_month+"-"+json_day;
//				String time1 = "20"+json_year+"-"+json_month+"-"+json_day+"  "+json_hour+":"+json_minutes+":"+json_second;
//
//				String assay_time =json_year+json_month+json_day;
//				String orderno = "H"+json_deviceNo+json_waterNo+assay_time+json_assayNo;
//				System.out.println("化验编号："+orderno);
//				System.out.println("废液量："+waste);
//				float waste_f = Float.valueOf(waste);
//
//
//				ApplicationContext ctx = ApplicationFactory.getInstance();
//				BizAssayResultMapper bizAssayResultMapper = (BizAssayResultMapper)ctx.getBean("bizAssayResultMapper");
//				BizOrderMapper bizOrderMapper = (BizOrderMapper)ctx.getBean("bizOrderMapper");
//				BizWaterWorkMapper  bizWaterWorkMapper = (BizWaterWorkMapper)ctx.getBean("bizWaterWorkMapper");
//				BizDeviceMapper bizDeviceMapper = (BizDeviceMapper)ctx.getBean("bizDeviceMapper");
//				BizAgentiaMapper bizAgentiaMapper = (BizAgentiaMapper)ctx.getBean("bizAgentiaMapper");
//				BizAgentiaContrastMapper bizAgentiaContrastMapper = (BizAgentiaContrastMapper)ctx.getBean("bizAgentiaContrastMapper");
//				BizWasteMapper bizWasteMapper = (BizWasteMapper)ctx.getBean("bizWasteMapper");
//				BizAlertMapper bizAlertMapper = (BizAlertMapper)ctx.getBean("bizAlertMapper");
//				BizAssayScopeMapper  bizAssayScopeMapper = (BizAssayScopeMapper)ctx.getBean("bizAssayScopeMapper");
//				BizScopeMapper  bizScopeMapper = (BizScopeMapper)ctx.getBean("bizScopeMapper");
//
//
//
//
//				if(json_year.length()==1){
//					System.out.println("时间格式错误");
//				}else{
//					BizDevice device = bizDeviceMapper.selectBizDeviceByNo(json_deviceNo);
//
//					if(device==null){
//						System.out.println("设备不存在");
//					}else{
//						BizWaterWork waterwork = bizWaterWorkMapper.selectBizWaterWorkByNo(json_waterNo);
//						if(waterwork==null){
//							//设备开机,更新状态
//							device.setAssayStatus("0");
//							device.setAssayTime(time1);
//							bizDeviceMapper.updateBizDevice(device);
//							System.out.println("水厂不存在");
//						}else{
//							//水厂及设备存在
//							long workId = waterwork.getWorksId();
//							long deviceId = device.getDeviceId();
//
//							//判断设备故障状态
//							if("1".equals(fault)){
//
//								//判断当前告警信息是否重复
//								BizAlert biz =new BizAlert();
//								biz.setReportId(orderno);
//								biz.setAlertTime(time1);
//								List<BizAlert> alertList = bizAlertMapper.selectBizAlertList(biz);
//								if(alertList!=null && alertList.size()>0){
//									//已经录入过告警信息
//								}else{
//									//设备故障
//									device.setAssayStatus("4");
//									device.setAssayTime(time1);
//									bizDeviceMapper.updateBizDevice(device);
//
//									//判断故障类型，并插入告警信息
//									//转二进制，判断告警类型
//									int fault_int = Integer.valueOf(fault_code);
//									String fault_s = toBinary(fault_int);
//									String Bu = "00000000000";
//									int len = fault_s.length();
//									if(len<11){
//										fault_s = Bu.substring(0,11-len)+fault_s;
//									}
//									if("00000000000".equals(fault_s)){
//										//无告警故障信息
//									}else{
//										List<BizAlert> alerts = new ArrayList<BizAlert>();
//										for(int i=0;i<11;i++){
//											String fault_1 = fault_s.substring(i,i+1);
//											if("1".equals(fault_1)){
//												//比色皿倒液抓取错误
//												BizAlert alert = new BizAlert();
//												alert.setReportId(orderno);
//												alert.setAlertDevice(deviceId);
//												alert.setAlertWorks(workId);
//												if(i==0){
//													alert.setAlertContent("比色皿倒液抓取错误");
//												}else if(i==1){
//													alert.setAlertContent("抓取比色皿错误");
//												}else if(i==2){
//													alert.setAlertContent("试管归位抓取错误");
//												}else if(i==3){
//													alert.setAlertContent("混均抓取错误");
//												}else if(i==4){
//													alert.setAlertContent("抓取试管错误");
//												}else if(i==5){
//													alert.setAlertContent("试管开盖错误");
//												}else if(i==6){
//													alert.setAlertContent("倒液旋转气缸错误");
//												}else if(i==7){
//													alert.setAlertContent("比色皿倒液夹紧气缸错误");
//												}else if(i==8){
//													alert.setAlertContent("1901气缸错误");
//												}else if(i==9){
//													alert.setAlertContent("混均气缸错误");
//												}else if(i==10){
//													alert.setAlertContent("注射泵气缸错误");
//												}
//												alert.setAlertType("0");
//												alert.setAlertDate(date1);
//												alert.setAlertTime(time1);
//												alerts.add(alert);
//											}
//										}
//										if (alerts.size() > 0)
//										{
//											bizAlertMapper.batchAlert(alerts);
//										}
//									}
//
//									//更新化验状态
//									BizAssayResult result = bizAssayResultMapper.selectBizAssayResultByNo(orderno);
//									if(result!=null){
//										result.setResultNode(node);
//										result.setResultBigprocess(bigprocess);
//										result.setResultSmallprocess(smallprocess);
//										result.setResultFault(fault);
//										result.setEndTime(time1);
//										result.setResultStatus("1");
//										bizAssayResultMapper.updateBizAssayResult(result);
//
//									}
//								}
//							}else{
//								//设备状态正常
//								if("1".equals(device_begin)){
//
//									if("0".equals(assay_begin)){
//										//化验未开始，或设备运行中断
//
//										//设备开机,更新状态
//										device.setAssayStatus("0");
//										device.setAssayTime(time1);
//										bizDeviceMapper.updateBizDevice(device);
//
//									}else if("1".equals(assay_begin)){
//
//
//										BizAssayScope assayScope= bizAssayScopeMapper.selectBizAssayScopeByNo(orderno);
//										if(assayScope==null){
//											BizScope scope = bizScopeMapper.selectBizScopeByWorks(workId);
//											if(scope!=null){
//												BizAssayScope bizAssayScope = new BizAssayScope();
//												bizAssayScope.setReportId(orderno);
//												bizAssayScope.setInCodMin(scope.getInCodMin());
//												bizAssayScope.setInCodMax(scope.getInCodMax());
//												bizAssayScope.setOutCodMin(scope.getOutCodMin());
//												bizAssayScope.setOutCodMax(scope.getOutCodMax());
//
//												bizAssayScope.setInTpMin(scope.getInTpMin());
//												bizAssayScope.setInTpMax(scope.getInTpMax());
//												bizAssayScope.setOutTpMin(scope.getOutTpMin());
//												bizAssayScope.setOutTpMax(scope.getOutTpMax());
//
//												bizAssayScope.setInTnMin(scope.getInTnMin());
//												bizAssayScope.setInTnMax(scope.getInTnMax());
//												bizAssayScope.setOutTnMin(scope.getOutTnMin());
//												bizAssayScope.setOutTnMax(scope.getOutTnMax());
//
//												bizAssayScope.setInNh3Min(scope.getInNh3Min());
//												bizAssayScope.setInNh3Max(scope.getInNh3Max());
//												bizAssayScope.setOutNh3Min(scope.getOutNh3Min());
//												bizAssayScope.setOutNh3Max(scope.getOutNh3Max());
//
//												bizAssayScopeMapper.insertBizAssayScope(bizAssayScope);
//											}
//
//										}
//
//										BizOrder order = bizOrderMapper.selectOrderResultByNo(orderno);
//
//										//化验开始或者进行中,更新设备状态
//										device.setAssayStatus("2");
//										device.setAssayTime(time1);
//										bizDeviceMapper.updateBizDevice(device);
//
//										//判断当前化验信息是否存在，不存在插入，存在更新
//
//										//判断化验单据
//										if(order == null ){
//											BizOrder bizOrder = new BizOrder();
//											bizOrder.setOrderNo(orderno);
//											bizOrder.setReportId(orderno);
//											bizOrder.setOrderDevice(deviceId);
//											bizOrder.setOrderWorks(workId);
//											bizOrder.setBeginTime(time1);
//											bizOrder.setOrderDate(date1);
//											bizOrder.setOrderResult("3");
//											bizOrderMapper.insertBizOrder(bizOrder);
//										}else{
//											//判断化验结束标识
//											String order_result = order.getOrderResult();
//											if("0".equals(order_result)||"1".equals(order_result)){
//												//已经化验结束无需更新
//											}else{
//												if("999".equals(node)){
////											order.setEndTime();
//													order.setOrderResult("0");
//													bizOrderMapper.insertBizOrder(order);
//												}
//											}
//										}
//
//
//										BizAssayResult result = bizAssayResultMapper.selectBizAssayResultByNo(orderno);
//
//										//判断化验结果表
//										if(result == null){
//											//插入数据库化验信息
//											BizAssayResult biz =new BizAssayResult();
//											biz.setResultWorks(workId);
//											biz.setResultDevice(deviceId);
//											biz.setResultNo(orderno);
//											biz.setReportId(orderno);
//											biz.setResultBigprocess(bigprocess);
//											biz.setResultSmallprocess(smallprocess);
//											biz.setResultNode(node);
//											biz.setResultFault(fault);
//											biz.setResultAlert("0");
//											biz.setBeginTime(time1);
//											biz.setResultDate(date1);
//											biz.setResultStatus("0");
//											bizAssayResultMapper.insertBizAssayResult(biz);
//										}else{
//											//更新化验信息
//											//判断当前化验的数据库状态，如果状态不是999-1/999-2/999-3，那么更新最新状态
//											// 如果化验结束标识为999，那么判断数据库数据状态：
//											// 如果已经完成化验999-3/999-1，那么不更新；
//											// 如果化验结果更新999-2，那么更新999-3化验结束；
//											// 如果为其他状态那么更新为化验结束（但未更新化验结果数据）
//
//											String assay_no = result.getResultNo();
//											String result_node = result.getResultNode();
//
//											if("999".equals(node)){
//												if("999".equals(result_node)){
//													//已经更新结束状态，不操作
//												}else {
//													//已经更新结束数据，更新为999结束状态
//													result.setResultNode("999");
//													result.setResultBigprocess(bigprocess);
//													result.setResultSmallprocess(smallprocess);
//													result.setResultFault(fault);
//													result.setEndTime(time1);
//													bizAssayResultMapper.updateBizAssayResult(result);
//
//
//													//更新化验药剂量,以及药剂变化量
//													BizAgentia agentia= new BizAgentia();
//													agentia.setAgentiaType("2");
//													agentia.setAgentiaBelong(deviceId);
//													List<BizAgentia> agentiaList = bizAgentiaMapper.selectDeviceAgentiaList(agentia);
//													for(BizAgentia obj : agentiaList){
//														long agentiaId = obj.getAgentiaId();
//														BizAgentiaContrast contrast = bizAgentiaContrastMapper.selectContrastByAgentia(agentiaId);
//														if(contrast!=null){
//															String contrastName =contrast.getContrastName();
//															int result1 = agentia_consume.indexOf(contrastName);
//															int result2 = agentia_remain.indexOf(contrastName);
//															if((result1 != -1)&&(result2!=-1)){
//																String obj_consume = jsonObject_content.getJSONObject("药剂消耗量").getString(contrastName);
//																String obj_remain = jsonObject_content.getJSONObject("药剂余量").getString(contrastName);
//
//
//																float agentiaChange = Float.valueOf(obj_consume);
//																float agentiaRemain = Float.valueOf(obj_remain);
//
//																float agentiaTotal_old = obj.getAgentiaTotal();
//																float agentiaRemain_old = obj.getAgentiaRemain();
//
//																float agentiaTotal_new = agentiaTotal_old + agentiaChange;
////														float agentiaRemain_new = agentiaRemain_old - agentiaChange;
//																float agentiaRemain_new = agentiaRemain;
//
//																obj.setAgentiaTotal(agentiaTotal_new);
//																obj.setAgentiaRemain(agentiaRemain_new);
//																//更新药剂变更
//																bizAgentiaMapper.updateBizAgentia(obj);
//
//																BizAgentiaRecord bizAgentiaRecord =new BizAgentiaRecord();
//																bizAgentiaRecord.setAgentiaId(agentiaId);
//																bizAgentiaRecord.setRecordDevice(deviceId);
//																bizAgentiaRecord.setRecordWorks(workId);
//																bizAgentiaRecord.setAssayId(assay_no);
//																SimpleDateFormat format_date = new SimpleDateFormat("yyyy-MM-dd");
//																bizAgentiaRecord.setRecordDate(format_date.format(new Date()));
//																bizAgentiaRecord.setRecordType("3");
//																bizAgentiaRecord.setRecordStatus("0");
//																bizAgentiaRecord.setBeforeTotal(agentiaTotal_old);
//																bizAgentiaRecord.setBeforeRemain(agentiaRemain_old);
//																bizAgentiaRecord.setAfterTotal(agentiaTotal_new);
//																bizAgentiaRecord.setAfterRemain(agentiaRemain_new);
//																bizAgentiaRecord.setAgentiaChange(agentiaChange);
//															}
//														}
//													}
//
//													//新增废液量
//													BizWaste bizWaste = new BizWaste();
//													bizWaste.setWasteDevice(deviceId);
//													bizWaste.setWasteWorks(workId);
//													bizWaste.setAssayId(assay_no);
//													bizWaste.setWasteNo(assay_no);
//													bizWaste.setWasteName("化验-"+orderno+"-废液量");
//													bizWaste.setWasteTotal(waste_f);
//													bizWasteMapper.insertBizWaste(bizWaste);
//
//												}
//											}else{
//												if("999".equals(result_node)){
//													//化验结束，且数据已经更新完毕
//												}else{
//													result.setResultNode(node);
//													result.setResultBigprocess(bigprocess);
//													result.setResultSmallprocess(smallprocess);
//													result.setResultFault(fault);
//													result.setResultAlert("0");
//													result.setEndTime(time1);
//													result.setResultStatus("0");
//													bizAssayResultMapper.updateBizAssayResult(result);
//												}
//											}
//
//
//										}
//
//									}
//								}
//							}
//						}
//					}
//				}
//
//
//			}
//		} catch (Exception e) {
//		e.printStackTrace();
//	}

	}

	public String toBinary(int num) {
		String str = "";
		while (num != 0) {
			str = num % 2 + str;
			num = num / 2;
		}
		return str;
	}

}
