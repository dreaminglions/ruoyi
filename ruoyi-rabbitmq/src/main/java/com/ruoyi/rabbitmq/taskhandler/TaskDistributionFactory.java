package com.ruoyi.rabbitmq.taskhandler;

import com.ruoyi.rabbitmq.domain.Consumer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 该类处理有MQ消费者接收到的消息
 */
public class TaskDistributionFactory {
	private static Logger logger = LoggerFactory.getLogger(TaskDistributionFactory.class);
	
	public static ITaskHandler createHandler(Consumer consumer){
		logger.info("处理MQ消费者接收到的消息,处理交换机名称："+consumer.getExchangename());
		logger.info("处理MQ消费者接收到的消息,选择路由key："+consumer.getRoutingkey());
		ITaskHandler taskHandler = null;
		switch (fetchType(consumer)) {
//		case UGO_PARAMETER:
//			taskHandler = new ParameterDataTaskHandler(consumer);
//			break;
//		case UGO_MOVE:
//			taskHandler = new MotionDataTaskHandler(consumer);
//			break;
//		case UGO_OWN:
//			taskHandler = new OwnStateDataTaskHandler(consumer);
//			break;
//		case UGO_HEARTRATE:
//			taskHandler = new HeartRateDataTaskHandler(consumer);
//			break;
//		case UGO_ALERT:
//			taskHandler = new AlertTaskHandler(consumer);
//			break;
//		case UGO_IMAGE:
//			taskHandler = new ImageTaskHandler(consumer);
//			break;
//		case UGO_HEART:
//			taskHandler = new HeartTaskHandler(consumer);
//			break;
		case ENERGY_ASK:
			taskHandler = new EnergyAskTaskHandler(consumer);
			break;
		case ENERGY_PLC:
			taskHandler = new EnergyPlcTaskHandler(consumer);
			break;
//		case UGO_TRAINING_END:
//			taskHandler = new TrainEndTaskHandler(consumer);
//			break;
//		case UGO_RESPONSE:
//			taskHandler = new ResponseTaskHandler(consumer);
//			break;
//		case UGO_REALTIME:
//			taskHandler = new RealTimeDataTaskHandler(consumer);
//			break;
//		case UGO_SOLE:
//			taskHandler = new SoleTaskHandler(consumer);
//			break;
//		case UGO_UPGD:
//			taskHandler = new UpgradeTaskHandler(consumer);
//			break;
		default:
			break;
		}
		return taskHandler;
	}
	
	private static TaskType fetchType(Consumer consumer){
		if(consumer.getExchangename().equals("energy_ask")){
			return TaskType.ENERGY_ASK;
		}else if(consumer.getExchangename().equals("energy_plc")){
			return TaskType.ENERGY_PLC;
		}else{
			return null;
		}
	} 
}
