package com.ruoyi.rabbitmq.manager;

import com.ruoyi.rabbitmq.thread.RabbitMQThread;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class MQTempStorage {
	
	
	/*
	 * 维护正在等待的消费者
	 * */
	public static Map<String,RabbitMQThread>  mqTable = new HashMap<String, RabbitMQThread>();

	private static Map<String,ArrayList> producerTable = new HashMap<String,ArrayList>();

	public static void  putIntoList(ArrayList list,String mcno){ 
		 
		if(producerTable.containsKey(mcno)){
			ArrayList l = producerTable.get(mcno);
		}
		
	}
	
}
