package com.ruoyi.mqtt.taskhandler;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.mqtt.mqcommon.Mqtt;
import com.ruoyi.mqtt.util.ApplicationFactory;
import com.ruoyi.system.domain.BizAssayResult;
import com.ruoyi.system.mapper.BizAssayResultMapper;
import org.eclipse.paho.client.mqttv3.*;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;
import org.springframework.context.ApplicationContext;

/**
 * 发布消息的回调类
 *
 * 必须实现MqttCallback的接口并实现对应的相关接口方法CallBack 类将实现 MqttCallBack。
 * 每个客户机标识都需要一个回调实例。在此示例中，构造函数传递客户机标识以另存为实例数据。 在回调中，将它用来标识已经启动了该回调的哪个实例。
 * 必须在回调类中实现三个方法：
 *
 * public void messageArrived(MqttTopic topic, MqttMessage message)接收已经预订的发布。
 *
 * public void connectionLost(Throwable cause)在断开连接时调用。
 *
 * public void deliveryComplete(MqttDeliveryToken token)) 接收到已经发布的 QoS 1 或 QoS 2
 * 消息的传递令牌时调用。 由 MqttClient.connect 激活此回调。
 *
 */
public class PushCallback implements MqttCallbackExtended {

    private MqttClient client;
    private MqttConnectOptions options;
    private String topic;

    private int i=0;

    public PushCallback(MqttClient client,MqttConnectOptions options,String topic){
        this.client = client;
        this.options = options;
        this.topic = topic;
    }

    @Override
    public void connectComplete(boolean b, String s) {
        System.out.println("丢失重连成功");
        if(i>0){
            // 订阅消息
            int[] Qos = { 1 };
//        String[] topic1 = { topic };
            String[] topic1 = { "mtopic/test1" };
            String[] topic2 = { "mtopic/test2" };
            String[] topic3 = { "mtopic/test3" };
            String[] topic4= { "mtopic/test4" };
            try {
                client.subscribe(topic1,Qos);//具体订阅代码
                client.subscribe(topic2,Qos);//具体订阅代码
                client.subscribe(topic3,Qos);//具体订阅代码
                client.subscribe(topic4,Qos);//具体订阅代码
            } catch (Exception e) {
                e.printStackTrace();
            }
        }


    }

    public void connectionLost(Throwable cause) {
        // 连接丢失后，一般在这里面进行重连
        System.out.println("连接断开，可以做重连");
        i=1;
//        System.out.println("重连topic"+topic);
        while (true) {
            if (i > 3) {
                //这里是我自己为了失败3次后告警使用
                System.out.println("mqtt丢失!");
                break;
            }
            if (!client.isConnected()) {
                try {
                    //这个是10秒后重连
                Thread.sleep(10000);
                    client.reconnect();
                } catch (Exception e) {
                    e.printStackTrace();
                }

                i++;
            }
            if (client.isConnected()) {
                System.out.println("***** connect success *****");
                break;
            }
        }


    }

    public void deliveryComplete(IMqttDeliveryToken token) {
        System.out.println("deliveryComplete---------" + token.isComplete());
    }

    public void messageArrived(String topic, MqttMessage message) throws Exception {
        // subscribe后得到的消息会执行到这里面
        System.out.println("~接收消息主题 : " + topic);
        System.out.println("~接收消息Qos : " + message.getQos());
        System.out.println("~接收消息内容 : " + new String(message.getPayload()));

        String a = new String(message.getPayload());
        if("mtopic/test1".equals(topic)){
            if("close".equals(a)){

            }else{
                JSONObject jsonObject = JSONObject.parseObject(a);
                String code = jsonObject.getJSONObject("d").getString("mtopic/test2");
            }
        }

        try {
    //        String a = new String(message.getPayload());
                String Message = new String(message.getPayload());
                messageHandler(topic,Message);

//                if("mtopic/test1".equals(topic)){
//                    if("close".equals(Message)){
//                    }else{
//                        System.out.println("这是一条化验结果消息");
//                    }
//                }else if ("mtopic/test2".equals(topic)){
//                    if("close".equals(Message)){
//                    }else{
//                        System.out.println("这是一条化验曲线消息");
//                    }
//                }

    //
    //        if("aaa".equals(a)){
    //            System.out.println("发送~~~");
    //            MqttMessage mes= new MqttMessage();
    //            mes.setQos(0);
    //            mes.setRetained(true);
    //            mes.setPayload("hello,topic14~~~yoyouyou!!!".getBytes());
    //            MqttClient client = new MqttClient("tcp://49.232.161.195:1883", "server12", new MemoryPersistence());
    //            MqttConnectOptions options = new MqttConnectOptions();
    //            options.setCleanSession(false);
    //            options.setUserName("cttc");
    //            options.setPassword("cttc123456".toCharArray());
    //            // 设置超时时间
    //            options.setConnectionTimeout(10);
    //            // 设置会话心跳时间
    //            options.setKeepAliveInterval(20);
    //            try {
    ////                client.setCallback(new PushCallback());
    //                client.connect(options);
    //            } catch (Exception e) {
    //                e.printStackTrace();
    //            }
    //            MqttTopic top  = client.getTopic("mtopic/test2");
    //            MqttDeliveryToken token = top.publish(mes);
    //            token.waitForCompletion();
    //            System.out.println("message is published completely! " + token.isComplete());
    //        }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void messageHandler(String topic,String message){
        //根据不同业务类型，对信息分类进行处理
        IMqttTaskHandler handler = MqttTaskDistributionFactory.createHandler(topic);
        handler.handle(message);
    }
}