package com.ruoyi.rabbitmq.thread;

import com.rabbitmq.client.*;
import com.ruoyi.rabbitmq.mqcommon.RabbitMQ;
import com.ruoyi.rabbitmq.taskhandler.ITaskHandler;
import com.ruoyi.rabbitmq.taskhandler.TaskDistributionFactory;
import com.ruoyi.rabbitmq.util.URLAvailability;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

/**
 * 系统启动队列线程
 * <p>Title</p>
 * @fileName RabbitMQThread.java
 * @author ct-tc
 * @date 2016-3-19 下午2:24:35
 *
 */
public class RabbitMQThread extends Thread {
	private static Logger logger = LoggerFactory.getLogger(RabbitMQThread.class);
	private RabbitMQ rmq;
	private DefaultConsumer consumer = null;
	private Channel channel = null;
	private boolean initSuccess;
	private boolean ack = false ;
	private com.ruoyi.rabbitmq.domain.Consumer c;
	private String exchangeName ; 
	private String routingKey;  
	private Connection connection;
	public RabbitMQThread(com.ruoyi.rabbitmq.domain.Consumer c) {
		this.c = c;
	}
	private String Threadname;

	public void init(String name)throws IOException{
		Threadname =name;
		rmq = RabbitMQ.getInstance(c.getIp(), c.getUsername(), c.getPwd(), c.getVirtualhosts(), c.getPort());
		connection = rmq.getConnection();
		channel = connection.createChannel();
		exchangeName = c.getExchangename();
		routingKey = c.getRoutingkey();
		logger.info("创建Channel,交换机："+c.getExchangename()+";路由键："+c.getRoutingkey());
		//channel.queueDeclare(RabbitMQCongifure.getQueueIn(), false, false, false, null); 
		if(exchangeName == null){
			initSuccess = false;
			return;
		}
		declareExchangeAndQueue();
		initSuccess = true;
		logger.info(exchangeName+"通道线程初始化成功");
	}
	
	private void declareExchangeAndQueue(){
		if(!connection.isOpen()){
			try {
				connection = rmq.getFactory().newConnection();
				channel = connection.createChannel();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (TimeoutException e) {
				System.out.println("RabbitMQ TimeoutException");
				e.printStackTrace();
			}
		}
			
		try {
			 
			channel.exchangeDeclare(exchangeName, "direct",true);
			//String queueName = channel.queueDeclare().getQueue();// 创建一个临时的、带有随机名称的Queue，用来与 exchange 绑定
			//指定一个队列
			String queueName = exchangeName;
			/*
			 * channel.queueDeclare：第一个参数：队列名字，
			 * 第二个参数：队列是否可持久化即重启后该队列是否依然存在，
			 * 第三个参数：该队列是否时独占的即连接上来时它占用整个网络连接，
			 * 第四个参数：是否自动销毁即当这个队列不再被使用的时候即没有消费者对接上来时自动删除，
			 * 第五个参数：其他参数如TTL（队列存活时间）等。
			 */
	        channel.queueDeclare(queueName, true, false, false, null);
			channel.queueBind(queueName, exchangeName, routingKey);   // 绑定
			consumer = new DefaultConsumer(channel);
			//添加信息处理消息应答机制
			channel.basicConsume(queueName, ack, new DefaultConsumer(channel) {
						@Override
						public void handleDelivery(String consumerTag,
												   Envelope envelope,
												   AMQP.BasicProperties properties,
												   byte[] body)
								throws IOException
						{
							try {
								String routingKey = envelope.getRoutingKey();
								String contentType = properties.getContentType();
								long deliveryTag = envelope.getDeliveryTag();
								// (process the message components here ...)
								//在此处添加消息处理
								messageHandler(body);

								System.out.println(">>>>消费者：--"+Threadname);

								channel.basicAck(deliveryTag, false);
							} catch (ShutdownSignalException e) {
								//断网线程异常，目前不做任何处理，不采取关闭策略，保证联网自动运行。
								System.out.println(c.getExchangename()+">>>>RabbitMQThread ShutdownSignalException");
								logger.info(c.getExchangename()+"队列中断异常。");
								URLAvailability.isConnect();
								declareExchangeAndQueue();
							}
						}
					});

//			Receiver receiver = new Receiver(channel,exchangeName,routingKey,c,"1");
//			receiver.work();
//			Receiver receiver2 = new Receiver(channel,exchangeName,routingKey,c,"2");
//			receiver2.work();
//			Receiver receiver3 = new Receiver(channel,exchangeName,routingKey,c,"3");
//			receiver3.work();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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

	public void messageHandler(byte[] bytes){
		//根据不同业务类型，对信息分类进行处理
		ITaskHandler handler = TaskDistributionFactory.createHandler(c);
		handler.handle(bytes);
	}

	@Override
	public void interrupt() {
		// TODO Auto-generated method stub
		try {
			channel.close();
			connection.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (TimeoutException e) {
			System.out.println("RabbitMQ TimeoutException");
			e.printStackTrace();
		}
		
		super.interrupt();
	}
	
	
	
	
}
