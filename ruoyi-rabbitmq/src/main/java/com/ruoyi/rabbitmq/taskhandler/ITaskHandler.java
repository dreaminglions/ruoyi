package com.ruoyi.rabbitmq.taskhandler;

public interface ITaskHandler {
	
	public void handle(byte[] bytes);

}
