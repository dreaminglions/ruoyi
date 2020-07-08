package com.ruoyi.mqtt.taskhandler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 该类处理有MQ消费者接收到的消息
 */
public class MqttTaskDistributionFactory {
	private static Logger logger = LoggerFactory.getLogger(MqttTaskDistributionFactory.class);
	
	public static IMqttTaskHandler createHandler(String topic){
		IMqttTaskHandler taskHandler = null;
		switch (fetchType(topic)) {
		case WATER_BASIC:
			taskHandler = new WaterBasicTaskHandler();
			break;
		case WATER_SINGLE:
			taskHandler = new WaterSingleTaskHandler();
			break;
		case WATER_ASSAY:
			taskHandler = new WaterAssayTaskHandler();
			break;
		case WATER_HEART:
			taskHandler = new WaterHeartTaskHandler();
			break;
		default:
			break;
		}
		return taskHandler;
	}
	
	private static MqttTaskType fetchType(String topic){
		if(topic.equals("mtopic/test1")){
			return MqttTaskType.WATER_BASIC;
		}else if(topic.equals("mtopic/test2")){
			return MqttTaskType.WATER_SINGLE;
		}else if(topic.equals("mtopic/test3")){
			return MqttTaskType.WATER_ASSAY;
		}else if(topic.equals("mtopic/test4")){
			return MqttTaskType.WATER_HEART;
		}else{
			return null;
		}
	} 
}
