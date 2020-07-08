package com.ruoyi.mqtt.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ApplicationFactory {
	
	private static ApplicationContext ctx = null;
	public static synchronized ApplicationContext getInstance(){
		if(ctx==null){
			ctx = new ClassPathXmlApplicationContext("MqconsumerMapper.xml");
		}
		
		return ctx;
	}
	
	public static void webInit(ApplicationContext c){
		ctx = c;
	}

}
