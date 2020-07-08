package com.ruoyi.rabbitmq.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ApplicationContextFactory {
	
	private static ApplicationContext ctx = null;
	public static synchronized ApplicationContext getInstance(){
		if(ctx==null){
			ctx = new ClassPathXmlApplicationContext("ConsumerMapper.xml");
		}
		
		return ctx;
	}
	
	public static void webInit(ApplicationContext c){
		ctx = c;
	}

}
