package com.ruoyi.mqtt.mqcommon;



import org.eclipse.paho.client.mqttv3.MqttClient;
import org.eclipse.paho.client.mqttv3.MqttConnectOptions;
import org.eclipse.paho.client.mqttv3.MqttTopic;
import org.eclipse.paho.client.mqttv3.persist.MemoryPersistence;

public class Mqtt {
	private static Mqtt mqtt = null;
	private MqttClient client;
	private MqttConnectOptions options;
	private String rmName;

	public static Mqtt getInstance(String ip, String username, String pwd, String clientid, String port){
		if(mqtt==null){
			System.out.println("初始化Mqtt");
			mqtt = new Mqtt(ip, username, pwd, clientid, port);
		}
		return mqtt;

	}


	private Mqtt(String ip, String username, String pwd, String clientid, String port){
		try {
			// host为主机名，clientid即连接MQTT的客户端ID，一般以唯一标识符表示，MemoryPersistence设置clientid的保存形式，默认为以内存保存
			client = new MqttClient("tcp://"+ip+":"+port, clientid, new MemoryPersistence());
			// MQTT的连接设置
			options = new MqttConnectOptions();
			// 设置是否清空session,这里如果设置为false表示服务器会保留客户端的连接记录，这里设置为true表示每次连接到服务器都以新的身份连接
			options.setCleanSession(true);
			// 设置连接的用户名
			options.setUserName(username);
			// 设置连接的密码
			options.setPassword(pwd.toCharArray());
			// 设置超时时间 单位为秒
			options.setConnectionTimeout(30);
			// 设置会话心跳时间 单位为秒 服务器会每隔1.5*20秒的时间向客户端发送个消息判断客户端是否在线，但这个方法并没有重连的机制
			options.setKeepAliveInterval(20);
			options.setAutomaticReconnect(true);


		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public String getRmName() {
		return rmName;
	}


	public void setRmName(String rmName) {
		this.rmName = rmName;
	}


	public MqttConnectOptions getOptions() {
		return options;
	}

	public void setOptions(MqttConnectOptions options) {
		this.options = options;
	}

	public MqttClient getClient() {
		return client;
	}

	public void setClient(MqttClient client) {
		this.client = client;
	}
}
