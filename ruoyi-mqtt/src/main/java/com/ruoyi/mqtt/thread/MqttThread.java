package com.ruoyi.mqtt.thread;

import com.ruoyi.mqtt.mqcommon.Mqtt;
import com.ruoyi.mqtt.taskhandler.PushCallback;
import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttTopic;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

/**
 * 系统启动队列线程
 * <p>Title</p>
 * @fileName MqttThread.java
 * @author ct-tc
 * @date 2016-3-19 下午2:24:35
 *
 */
public class MqttThread extends Thread {
	private static Logger logger = LoggerFactory.getLogger(MqttThread.class);
	private Mqtt mqtt;
	private boolean initSuccess;
	private com.ruoyi.mqtt.domain.Mqconsumer c;
	private String topic ;
	private MqttConnectOptions options;
	private MqttClient client;
	public MqttThread(com.ruoyi.mqtt.domain.Mqconsumer c) {
		this.c = c;
	}
	private String Threadname;
	private int Threadcount;

	public void init(String name,int count)throws IOException{
		Threadname  = name;
		Threadcount = count;
		mqtt = Mqtt.getInstance(c.getIp(), c.getUsername(), c.getPwd(), c.getClientid(), c.getPort());
		topic = c.getTopic();
		logger.info("创建Channel,host："+c.getVirtualhosts()+";topic："+c.getTopic());
		//channel.queueDeclare(RabbitMQCongifure.getQueueIn(), false, false, false, null);
		if(topic == null){
			initSuccess = false;
			return;
		}
		declareExchangeAndQueue();
		initSuccess = true;
		logger.info(topic+"通道线程初始化成功");
	}

	private void declareExchangeAndQueue(){
		try {
			client = mqtt.getClient();
			options = mqtt.getOptions();
			MqttTopic mq_topic = client.getTopic(topic);
			// 设置回调
			client.setCallback(new PushCallback(client,options,topic));
			// setWill方法，如果项目中需要知道客户端是否掉线可以调用该方法。设置最终端口的通知消息
			options.setWill(mq_topic, "close".getBytes(), 2, true);
			if(Threadcount==0){
				client.connect(options);
			}
			// 订阅消息
			int[] Qos = { 1 };
			String[] topic1 = { topic };
			client.subscribe(topic1, Qos);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	@Override
	public void run() {
		if(!initSuccess){
			return;
		}
	}

//	public void messageHandler(byte[] bytes){
//		//根据不同业务类型，对信息分类进行处理
//		ITaskHandler handler = TaskDistributionFactory.createHandler(c);
//		handler.handle(bytes);
//	}

	@Override
	public void interrupt() {
		// TODO Auto-generated method stub
		try {
			client.close();
		}catch (Exception e) {
			e.printStackTrace();
		}


		super.interrupt();
	}


	
	
}
