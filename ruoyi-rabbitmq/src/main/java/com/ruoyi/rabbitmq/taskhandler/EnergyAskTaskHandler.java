package com.ruoyi.rabbitmq.taskhandler;


import com.ruoyi.common.utils.chaos.ChaosAlgorithm;
import com.ruoyi.rabbitmq.domain.Consumer;
import com.ruoyi.rabbitmq.domain.Producer;
import com.ruoyi.rabbitmq.manager.TestSender;
import com.ruoyi.rabbitmq.util.ApplicationContextFactory;
//import com.ruoyi.system.domain.BizDevice;
//import com.ruoyi.system.domain.BizOperLog;
//import com.ruoyi.system.mapper.BizDeviceMapper;
//import com.ruoyi.system.mapper.BizOperLogMapper;
import com.ruoyi.system.util.HelperUtil;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import static com.ruoyi.rabbitmq.domain.ByteUtil.*;


/**
 * 告警恢复数据上传任务处理类
 * @author bida
 * @version 2017-03-08
 */
public class EnergyAskTaskHandler implements ITaskHandler {
	private static Logger logger = LoggerFactory.getLogger(EnergyAskTaskHandler.class);
	private Consumer consumer;
	
	public EnergyAskTaskHandler(Consumer consumer) {
		this.consumer = consumer;
	}
	
	@Override
	public void handle(byte[] bytes) {

	}

	public Consumer getConsumer() {
		return consumer;
	}

	public void setConsumer(Consumer consumer) {
		this.consumer = consumer;
	}
	

	private boolean isJson(String json){
		try{
		    JSONObject.fromObject( json ); 
		    return true;
		}catch(Exception e){
		    return false;
		}
	}

}
