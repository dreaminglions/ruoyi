package com.ruoyi.mqtt.manager;

import com.ruoyi.mqtt.domain.Mqconsumer;
import com.ruoyi.mqtt.mapper.MqconsumerMapper;
import com.ruoyi.mqtt.thread.MqttThread;
import com.ruoyi.mqtt.util.ApplicationFactory;
import org.springframework.context.ApplicationContext;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


public class MqttManager {
	
	public static void initThread(){
		//final ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-context.xml"); 
		ApplicationContext ctx = ApplicationFactory.getInstance();
		MqconsumerMapper mapper = (MqconsumerMapper)ctx.getBean("mqconsumerMapper");
		List<Mqconsumer> clist = mapper.getAll();
		for(int i=0;i<clist.size();i++){
			final Mqconsumer mqconsumer = clist.get(i);
			String topic = mqconsumer.getTopic();
//			String routingKey = mqconsumer.getRoutingkey();
			if(topic!=null && !"null".equals(topic) && !"".equals(topic)){
				MqttThread thread = new MqttThread(mqconsumer);
//				RabbitMQThread thread2= new RabbitMQThread(consumer);
				try {
					thread.init("Th1",i);
//					thread2.init("Th2");
					MQttTempStorage.mqTable.put(mqconsumer.getTopic(), thread);
//					MQTempStorage.mqTable.put(consumer.getExchangename(), thread2);
//					if("energy_plc".equals(exchangeName)&&"energy_plc".equals(routingKey)){
//						RabbitMQThread thread2= new RabbitMQThread(consumer);
//						thread2.init("Th2");
//						MQTempStorage.mqTable.put(consumer.getExchangename(), thread2);
//					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
	}

	
	public static void startConsumer(String order){
		 Map<String,MqttThread> map = MQttTempStorage.mqTable;
		 if("all".equals(order)){
			 Iterator iter = map.entrySet().iterator();
			 while (iter.hasNext()) {
				 Map.Entry entry = (Map.Entry) iter.next();
				 Object key = entry.getKey();
				 MqttThread thread = (MqttThread)entry.getValue();
				 if(!thread.isAlive());
					 thread.start();
			 }
		 }else{
			 MqttThread thread = MQttTempStorage.mqTable.get(order);
			 thread.start();
		 }
		 
		 
		
	}
	
	
	public static void stopConsumer(String order){
		 Map<String,MqttThread> map = MQttTempStorage.mqTable;
		 if("all".equals(order)){
			 Iterator iter = map.entrySet().iterator();
			 while (iter.hasNext()) {
				 Map.Entry entry = (Map.Entry) iter.next();
				 Object key = entry.getKey();
				 MqttThread thread = (MqttThread)entry.getValue();
				 if(thread.isAlive());
					 thread.stop();
			 }
		 }else{
			 MqttThread thread = MQttTempStorage.mqTable.get(order);
			 //thread.start();
			 thread.stop();
		 }
		
	}


	
	public static void main(String[] args) {
		

	}

	
}
