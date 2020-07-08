package com.ruoyi.mqtt.listener;

import com.ruoyi.mqtt.manager.MqttManager;
import com.ruoyi.mqtt.util.ApplicationFactory;
import com.ruoyi.system.util.HelperUtil;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/** 
 * @ClassName: MemoryListener 
 * @Description: 初始化rabbitmq队列监听
 * @author yutao 
 * @date 2016-5-16 上午9:38:25
 *  
 */
public class MqttListener implements ServletContextListener  {
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("Mqtt队列监听 开始结束");
//		String key = HelperUtil.getConfigValue("ugo.rabbitmq.switch");
		String key = HelperUtil.getConfigValue("energy.mqtt.switch");
		if("true".equals(key)){
			MqttManager.stopConsumer("all");
		}
		System.out.println("Mqtt队列监听 结束完毕");

	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("Mqtt队列监听 初始化开始");
//		String key = HelperUtil.getConfigValue("ugo.rabbitmq.switch");
		String key = HelperUtil.getConfigValue("energy.mqtt.switch");
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(arg0.getServletContext());
		ApplicationFactory.webInit(ctx);
		if("true".equals(key)){
			//消息队列接收
			MqttManager.initThread();
			MqttManager.startConsumer("all");
		}
		System.out.println("Mqtt队列监听 初始化完毕!");
	}
}
