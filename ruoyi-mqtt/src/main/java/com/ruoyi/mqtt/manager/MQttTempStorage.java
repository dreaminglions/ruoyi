package com.ruoyi.mqtt.manager;

import com.ruoyi.mqtt.thread.MqttThread;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class MQttTempStorage {
	
	
	/*
	 * 维护正在等待的消费者
	 * */
	public static Map<String,MqttThread>  mqTable = new HashMap<String, MqttThread>();

	private static Map<String,ArrayList> producerTable = new HashMap<String,ArrayList>();

	public static void  putIntoList(ArrayList list,String mcno){ 
		 
		if(producerTable.containsKey(mcno)){
			ArrayList l = producerTable.get(mcno);
		}
		
	}
	
}
