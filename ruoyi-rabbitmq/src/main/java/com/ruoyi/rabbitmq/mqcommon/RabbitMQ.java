package com.ruoyi.rabbitmq.mqcommon;


import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;

import java.io.IOException;
import java.util.concurrent.TimeoutException;


public class RabbitMQ {
	private static RabbitMQ rabbitMQ = null;
	private ConnectionFactory factory;
	private Connection connection;
	private String rmName;
	
	public static RabbitMQ getInstance(String ip, String username, String pwd, String virtualhosts, String port){
		if(rabbitMQ==null){
			System.out.println("初始化RabbitMQ");
			rabbitMQ = new RabbitMQ(ip, username, pwd, virtualhosts, port);
		}
		return rabbitMQ;
		
	} 
	
	
	private RabbitMQ(String ip,String username,String pwd,String virtualhosts,String port){
		factory = new ConnectionFactory();
		System.out.println("ip:"+ip+";username:"+username+";username:"+pwd+";virtualhosts:"+virtualhosts+";port:"+port);
		factory.setHost(ip);
        factory.setUsername(username);
        factory.setPassword(pwd);
        factory.setVirtualHost(virtualhosts);
        factory.setPort(Integer.valueOf(port));
        try {
			connection = factory.newConnection();
		} catch (IOException e) {
			System.out.println("RabbitMQ IOException");
			e.printStackTrace();
		} catch (TimeoutException e) {
			System.out.println("RabbitMQ TimeoutException");
			e.printStackTrace();
		}
	}

	public ConnectionFactory getFactory() {
		return factory;
	}


	public void setFactory(ConnectionFactory factory) {
		this.factory = factory;
	}


	public Connection getConnection() {
		return connection;
	}


	public void setConnection(Connection connection) {
		this.connection = connection;
	}


	public String getRmName() {
		return rmName;
	}


	public void setRmName(String rmName) {
		this.rmName = rmName;
	}

}
