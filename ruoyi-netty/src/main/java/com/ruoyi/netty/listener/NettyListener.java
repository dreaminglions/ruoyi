package com.ruoyi.netty.listener;

import com.ruoyi.netty.client.NettyClient;
import com.ruoyi.netty.server.NettyServer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.net.InetSocketAddress;

/** 
 * @ClassName: MemoryListener 
 * @Description: 初始化rabbitmq队列监听
 * @author yutao 
 * @date 2016-5-16 上午9:38:25
 *  
 */
public class NettyListener implements ServletContextListener  {
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {

	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("netty监听 初始化开始");

		//启动服务端
		NettyServer nettyServer = new NettyServer();
		nettyServer.start(new InetSocketAddress("127.0.0.1", 8090));
		//启动netty客户端
		NettyClient nettyClient = new NettyClient();
		nettyClient.start();

		System.out.println("netty监听 初始化完毕!");
	}
}
