package com.ruoyi.rabbitmq.thread;

import com.rabbitmq.client.*;
import com.ruoyi.rabbitmq.taskhandler.ITaskHandler;
import com.ruoyi.rabbitmq.taskhandler.TaskDistributionFactory;
import com.ruoyi.rabbitmq.util.URLAvailability;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

public class Receiver {
    private String exchangeName;

    private String routingKey;

    private Channel channel;

    private String name;

    private com.ruoyi.rabbitmq.domain.Consumer c;

    private DefaultConsumer consumer = null;

    private boolean ack = false ;

    public Receiver(Channel channel,String exchangeName, String routingKey,com.ruoyi.rabbitmq.domain.Consumer c,String name) {
        this.name = name;
        this.c = c;
        this.channel = channel;
        this.exchangeName = exchangeName;
        this.routingKey = routingKey;
    }

    public void work() throws Exception {
//        System.out.println(">>>>消费者：--"+name);
        //String queueName = channel.queueDeclare().getQueue();// 创建一个临时的、带有随机名称的Queue，用来与 exchange 绑定
        //指定一个队列
        String queueName = exchangeName;
			/*
			 * channel.queueDeclare：第一个参数：队列名字，
			 * 第二个参数：队列是否可持久化即重启后该队列是否依然存在，
			 * 第三个参数：该队列是否时独占的即连接上来时它占用整个网络连接，
			 * 第四个参数：是否自动销毁即当这个队列不再被使用的时候即没有消费者对接上来时自动删除，
			 * 第五个参数：其他参数如TTL（队列存活时间）等。
			 */
//        channel.queueDeclare(queueName, true, false, false, null);
//        channel.queueBind(queueName, exchangeName, routingKey);   // 绑定
        consumer = new DefaultConsumer(channel);
        //添加信息处理消息应答机制
        channel.basicConsume(queueName, ack, new DefaultConsumer(channel) {
            @Override
            public void handleDelivery(String consumerTag,
                                       Envelope envelope,
                                       AMQP.BasicProperties properties,
                                       byte[] body)
                    throws IOException
            {
                try {
                    String routingKey = envelope.getRoutingKey();
                    String contentType = properties.getContentType();
                    long deliveryTag = envelope.getDeliveryTag();
                    // (process the message components here ...)
                    //在此处添加消息处理
                    System.out.println(">>>>处理线程--"+name);

                    TimeUnit.MILLISECONDS.sleep(1000);
                    messageHandler(body);

                    channel.basicAck(deliveryTag, false);
                } catch (ShutdownSignalException e) {
                    //断网线程异常，目前不做任何处理，不采取关闭策略，保证联网自动运行。
                    System.out.println(">>>>队列中断异常");
//                    logger.info(c.getExchangename()+"队列中断异常。");
                    URLAvailability.isConnect();
//                    declareExchangeAndQueue();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        });
    }

    public void messageHandler(byte[] bytes){
        //根据不同业务类型，对信息分类进行处理
        ITaskHandler handler = TaskDistributionFactory.createHandler(c);
        handler.handle(bytes);
    }

}
