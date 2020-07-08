package com.ruoyi.rabbitmq.manager;

import com.rabbitmq.client.Channel;
import com.ruoyi.rabbitmq.domain.Producer;
import com.ruoyi.rabbitmq.mqcommon.RabbitMQ;
import com.ruoyi.system.util.HelperUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.UnsupportedEncodingException;


/**
 * 队列消息发送者
 * <p>Title</p>
 * @fileName MessageSender.java
 * @author ct-tc
 * @date 2016-3-19 下午2:29:41
 *
 */
public class MessageSender {
	private static Logger logger = LoggerFactory.getLogger(MessageSender.class);
	private Producer producer = null;
	private Channel channel = null;
	private RabbitMQ rabbitMQ;
    
    public MessageSender(Producer p){
    	producer = p;
    	init();
    }
    
    private void init(){
    	rabbitMQ = RabbitMQ.getInstance(producer.getIp(), producer.getUsername(), producer.getPwd(),
    		producer.getVirtualhosts(), producer.getPort());
//    	factory = new ConnectionFactory();
//    	factory.setHost(producer.getIp());  
//    	factory.setUsername(producer.getUsername());
//    	factory.setPassword(producer.getPwd());
    	try {
//			connection = factory.newConnection();
			channel = rabbitMQ.getConnection().createChannel();  
	        // 声明转发器的类型  
			//logger.info("消息生产者初始化,producer:"+producer.getName());
			logger.info("消息生产者初始化,RoutingKey:"+producer.getRoutingKey());
			logger.info("消息生产者初始化,ExchangeName:"+producer.getExchangeName());
			//处理RabbitMQ队列发送异常，加入第三个参数true:队列持久化,默认为false
			//注意：由于是发送程序，所以只需要获取队列并发送消息即可，并不需要声明创建交换机
	        channel.exchangeDeclare(producer.getExchangeName(), "direct", true);
	        logger.info("消息生产者初始化完成"); 
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
    }
    public void send(String message){
    	try {
    		logger.info("消息发送,producer:"+producer);
    		logger.info("消息发送,channel:"+channel);
			channel.basicPublish(producer.getExchangeName(), producer.getRoutingKey(), null, message.getBytes());
			logger.info("消息发送成功。。。。。。"); 
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			logger.info(""+producer.getRoutingKey()+"消息已发送");
		}
    }
    
    public void sendByte(byte[] message){
    	try {
    		logger.info("消息发送,producer:"+producer);
    		logger.info("消息发送,channel:"+channel);
			channel.basicPublish(producer.getExchangeName(), producer.getRoutingKey(), null, message);
			logger.info("消息发送成功。。。。。。"); 
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			logger.info(""+producer.getRoutingKey()+"消息已发送");
		}
    }
    
    public void close(){
    	try {
			channel.close();
			//connection.close();
		} catch (Exception e) {
			logger.info("队列异常："+e.getMessage());
		}finally{
			logger.info(""+producer.getRoutingKey()+"发送者关闭");
		}
    }

	public Producer getProducer() {
		return producer;
	}

	public void setProducer(Producer producer) {
		this.producer = producer;
	}
	
	public static void main(String[] args) {
		Producer pp = new Producer();
		/*pp.setUsername(HelperUtil.getConfigValue("ugo.username"));
		pp.setPwd(HelperUtil.getConfigValue("ugo.pwd"));
		pp.setIp(HelperUtil.getConfigValue("ugo.ip"));
		pp.setVirtualhosts(HelperUtil.getConfigValue("ugo.virtualhosts"));
		pp.setPort(HelperUtil.getConfigValue("ugo.port"));*/
		pp.setUsername(HelperUtil.getConfigValue("energy.username"));
		pp.setPwd(HelperUtil.getConfigValue("energy.pwd"));
		pp.setIp(HelperUtil.getConfigValue("energy.ip"));
		pp.setVirtualhosts(HelperUtil.getConfigValue("energy.virtualhosts"));
		pp.setPort(HelperUtil.getConfigValue("energy.port"));
		pp.setExchangeName("energy_control"); //改为energy_control
		pp.setRoutingKey("energy_control");
		//String json = "{\"identify\": \"CT2019000120170213161676323\",\"sn\": \"UGO022017030601\",\"type\": \"1\",\"time\": \"2017-01-01 01:01:01\"}";
//		MessageSender ms = new MessageSender(pp);
//		ms.send(json);
//		ms.close();
//		//混沌算法加解密钥
//		double u = Double.valueOf(HelperUtil.getConfigValue("ugo.u"));
//		double x0 = Double.valueOf(HelperUtil.getConfigValue("ugo.x0"));
//		byte[] encode = ChaosAlgorithm.Encode(json, u, x0);
		while (true) {
			int val = (int)(Math.random()*10000+1);
			String json = "abc"+val+"#UGO022017030601#hij#1234";
			System.out.println("json>>>>>>>>>>>>>>>>>>>>>>>:"+json);
			byte[] msg = new byte[1];
			try {
				msg = json.getBytes("utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			MessageSender sender = new MessageSender(pp);
			sender.sendByte(msg);
			sender.close();
			try {
				Thread.sleep(3000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
