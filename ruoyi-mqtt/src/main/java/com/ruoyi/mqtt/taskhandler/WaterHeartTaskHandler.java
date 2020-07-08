package com.ruoyi.mqtt.taskhandler;


import com.alibaba.fastjson.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * 告警恢复数据上传任务处理类
 * @author bida
 * @version 2017-03-08
 */
public class WaterHeartTaskHandler implements IMqttTaskHandler {
	private static Logger logger = LoggerFactory.getLogger(WaterHeartTaskHandler.class);

	public WaterHeartTaskHandler( ) {
	}
	
	@Override
	public void handle(String message) {
		System.out.println("这是一条化验心跳数据");
		try{
			if("close".equals(message)){
			}else{
				JSONObject jsonObject = JSONObject.parseObject(message);
				String message_content = jsonObject.getJSONObject("d").getString("mtopic/test2");

				System.out.println("内容："+message_content);


			}
		} catch (Exception e) {
		e.printStackTrace();
	}

	}

}
