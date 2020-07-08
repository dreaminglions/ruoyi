package com.ruoyi.rabbitmq.taskhandler;


import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.utils.chaos.ChaosAlgorithm;
import com.ruoyi.rabbitmq.domain.Consumer;
import com.ruoyi.rabbitmq.util.ApplicationContextFactory;
import com.ruoyi.system.util.HelperUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import static com.ruoyi.rabbitmq.domain.ByteUtil.*;


/**
 * 告警恢复数据上传任务处理类
 * @author bida
 * @version 2017-03-08
 */
public class EnergyPlcTaskHandler implements ITaskHandler {
	private static Logger logger = LoggerFactory.getLogger(EnergyPlcTaskHandler.class);
	private Consumer consumer;

	public EnergyPlcTaskHandler(Consumer consumer) {
		this.consumer = consumer;
	}
	
	@Override
	public void handle(byte[] bytes) {

	}

}
