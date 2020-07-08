package com.ruoyi.rabbitmq.util;

import com.google.gson.Gson;
import com.ruoyi.common.utils.chaos.ChaosAlgorithm;
import com.ruoyi.rabbitmq.domain.Producer;
import com.ruoyi.rabbitmq.manager.MessageSender;
import com.ruoyi.rabbitmq.taskhandler.HandleResponse;
import com.ruoyi.system.util.HelperUtil;
import org.slf4j.Logger;

public class UgoCheckUtil {

	/**
	 * 消息队列处理判断SN和唯一标识
	 * @param logger
	 * @param sn
	 * @param identify
	 * @param u
	 * @param x0
	 * @param head
	 * @return
	 */
	public static boolean checkSnAndIdentify(Logger logger,String sn,String identify,double u,double x0,String head){
		if("".equals(sn)){
			logger.info(head+"失败sn为空");
			return false;
		}
		if("".equals(identify)){
			//自定义producer
			Producer producer =new Producer();
			producer.setIp(HelperUtil.getConfigValue("ugo.ip"));
			producer.setUsername(HelperUtil.getConfigValue("ugo.username"));
			producer.setPwd(HelperUtil.getConfigValue("ugo.pwd"));
			producer.setVirtualhosts(HelperUtil.getConfigValue("ugo.virtualhosts"));
			producer.setPort(HelperUtil.getConfigValue("ugo.port"));
			//通过sn设置交换机和路由键
			producer.setExchangeName("exo_response");
			producer.setRoutingKey(sn);
			HandleResponse handleResponse = new HandleResponse();
			handleResponse.setIdentify(identify);
			handleResponse.setSn(sn);
			handleResponse.setState("20001");
			handleResponse.setSign("alert");
			Gson gson = new Gson();
			String senderJson = gson.toJson(handleResponse);
			logger.info(head+"反馈成功senderJson："+senderJson);
			//混沌算法加密
			byte[] encode = ChaosAlgorithm.Encode(senderJson, u, x0);
			MessageSender sender = new MessageSender(producer);
//			sender.send(senderJson);
			sender.sendByte(encode);
			sender.close();
			logger.info(head+"反馈失败identify为空");
			return false;
		}
		return true;
	}
}
