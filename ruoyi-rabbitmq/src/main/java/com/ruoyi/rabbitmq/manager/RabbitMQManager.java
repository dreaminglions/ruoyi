package com.ruoyi.rabbitmq.manager;

import com.ruoyi.rabbitmq.domain.Consumer;
import com.ruoyi.rabbitmq.mapper.ConsumerMapper;
import com.ruoyi.rabbitmq.thread.RabbitMQThread;
import com.ruoyi.rabbitmq.util.ApplicationContextFactory;
import org.springframework.context.ApplicationContext;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;


public class RabbitMQManager {
	
	public static void initThread(){
		//final ApplicationContext ctx = new ClassPathXmlApplicationContext("spring-context.xml"); 
		ApplicationContext ctx = ApplicationContextFactory.getInstance();
		ConsumerMapper mapper = (ConsumerMapper)ctx.getBean("consumerMapper");
		List<Consumer> clist = mapper.getAll();
		for(int i=0;i<clist.size();i++){
			final Consumer consumer = clist.get(i);
			String exchangeName = consumer.getExchangename();
			String routingKey = consumer.getRoutingkey();
			if(exchangeName!=null && !"null".equals(exchangeName) && !"".equals(exchangeName)
					&& routingKey!=null && !"null".equals(routingKey) && !"".equals(routingKey)){
				RabbitMQThread thread = new RabbitMQThread(consumer);
//				RabbitMQThread thread2= new RabbitMQThread(consumer);
				try {
					thread.init("Th1");
//					thread2.init("Th2");
					MQTempStorage.mqTable.put(consumer.getExchangename(), thread);
//					MQTempStorage.mqTable.put(consumer.getExchangename(), thread2);
					if("energy_plc".equals(exchangeName)&&"energy_plc".equals(routingKey)){
						RabbitMQThread thread2= new RabbitMQThread(consumer);
						thread2.init("Th2");
						MQTempStorage.mqTable.put(consumer.getExchangename(), thread2);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
	}

	
	public static void startConsumer(String order){
		 Map<String,RabbitMQThread> map = MQTempStorage.mqTable;
		 if("all".equals(order)){
			 Iterator iter = map.entrySet().iterator();
			 while (iter.hasNext()) {
				 Map.Entry entry = (Map.Entry) iter.next();
				 Object key = entry.getKey();
				 RabbitMQThread thread = (RabbitMQThread)entry.getValue();
				 if(!thread.isAlive());
					 thread.start();
			 }
		 }else{
			 RabbitMQThread thread = MQTempStorage.mqTable.get(order);
			 thread.start();
		 }
		 
		 
		
	}
	
	
	public static void stopConsumer(String order){
		 Map<String,RabbitMQThread> map = MQTempStorage.mqTable;
		 if("all".equals(order)){
			 Iterator iter = map.entrySet().iterator();
			 while (iter.hasNext()) {
				 Map.Entry entry = (Map.Entry) iter.next();
				 Object key = entry.getKey();
				 RabbitMQThread thread = (RabbitMQThread)entry.getValue();
				 if(thread.isAlive());
					 thread.stop();
			 }
		 }else{
			 RabbitMQThread thread = MQTempStorage.mqTable.get(order);
			 //thread.start();
			 thread.stop();
		 }
		
	}


	
	public static void main(String[] args) {
		

	}

	
}
