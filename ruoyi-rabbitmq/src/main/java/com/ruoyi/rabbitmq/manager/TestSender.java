package com.ruoyi.rabbitmq.manager;

import com.rabbitmq.client.Channel;
import com.ruoyi.common.utils.chaos.ChaosAlgorithm;
import com.ruoyi.rabbitmq.domain.Producer;
import com.ruoyi.rabbitmq.mqcommon.RabbitMQ;
import com.ruoyi.system.util.HelperUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Random;

import static com.ruoyi.rabbitmq.domain.ByteUtil.*;


/**
 * 队列消息发送者
 * <p>Title</p>
 * @fileName MessageSender.java
 * @author ct-tc
 * @date 2016-3-19 下午2:29:41
 *
 */
public class TestSender {
	private static Logger logger = LoggerFactory.getLogger(TestSender.class);
	private Producer producer = null;
	private Channel channel = null;
	private RabbitMQ rabbitMQ;
    
    public TestSender(Producer p){
    	producer = p;
    	init();
    }
    
    private void init(){
    	rabbitMQ = RabbitMQ.getInstance(producer.getIp(), producer.getUsername(), producer.getPwd(),
    		producer.getVirtualhosts(), producer.getPort());
//    	factory = new ConnectionFactory();
//    	factory.setHost(producer.getIp());  
//    	factory.setUsername(producer.getUsername());
//    	factory.setPassword(producer.getPwd());
    	try {
//			connection = factory.newConnection();
			channel = rabbitMQ.getConnection().createChannel();  
	        // 声明转发器的类型  
			//logger.info("消息生产者初始化,producer:"+producer.getName());
			logger.info("消息生产者初始化,RoutingKey:"+producer.getRoutingKey());
			logger.info("消息生产者初始化,ExchangeName:"+producer.getExchangeName());
			//处理RabbitMQ队列发送异常，加入第三个参数true:队列持久化,默认为false
			//注意：由于是发送程序，所以只需要获取队列并发送消息即可，并不需要声明创建交换机
	        channel.exchangeDeclare(producer.getExchangeName(), "direct", true);
	        logger.info("消息生产者初始化完成"); 
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
    }
    public void send(String message){
    	try {
    		logger.info("消息发送,producer:"+producer);
    		logger.info("消息发送,channel:"+channel);
			channel.basicPublish(producer.getExchangeName(), producer.getRoutingKey(), null, message.getBytes());
			logger.info("消息发送成功。。。。。。"); 
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			logger.info(""+producer.getRoutingKey()+"消息已发送");
		}
    }
    
    public void sendByte(byte[] message){
    	try {
    		logger.info("消息发送,producer:"+producer);
    		logger.info("消息发送,channel:"+channel);
			channel.basicPublish(producer.getExchangeName(), producer.getRoutingKey(), null, message);
			logger.info("消息发送成功。。。。。。"); 
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			logger.info(""+producer.getRoutingKey()+"消息已发送");
		}
    }
    
    public void close(){
    	try {
			channel.close();
			//connection.close();
		} catch (Exception e) {
			logger.info("队列异常："+e.getMessage());
		}finally{
			logger.info(""+producer.getRoutingKey()+"发送者关闭");
		}
    }

	public Producer getProducer() {
		return producer;
	}

	public void setProducer(Producer producer) {
		this.producer = producer;
	}
	
	/**
	 * 测试发送GPS数据
	 */
	public static void sendGps(){
		Producer pp = new Producer();
		pp.setUsername(HelperUtil.getConfigValue("energy.username"));
		pp.setPwd(HelperUtil.getConfigValue("energy.pwd"));
		pp.setIp(HelperUtil.getConfigValue("energy.ip"));
		pp.setVirtualhosts(HelperUtil.getConfigValue("energy.virtualhosts"));
		pp.setPort(HelperUtil.getConfigValue("energy.port"));
		pp.setExchangeName("ugo_own");
		pp.setRoutingKey("ugo_own");
		//String json = "{\"identify\": \"CT2019000120170213161676323\",\"sn\": \"UGO022017030601\",\"type\": \"1\",\"time\": \"2017-01-01 01:01:01\"}";
//		MessageSender ms = new MessageSender(pp);
//		ms.send(json);
//		ms.close();
//		//混沌算法加解密钥
		double u = Double.valueOf(HelperUtil.getConfigValue("energy.u"));
		double x0 = Double.valueOf(HelperUtil.getConfigValue("energy.x0"));
		int i = 100;
		
		/*double longitude = 12641.00232;
		double latitude = 4544.41528;*/
		//126.57802,45.758362
		
		//浙江省杭州市西湖区文二西路493号
//		double longitude = 12005.65;
//		double latitude = 3017.00572;
		
		//哈尔滨道里区友谊路，音乐公园
		double longitude = 12633.1673;
		double latitude = 4544.8711;
		while (true) {
			/*if(i++%2==1){
				longitude += 0.0004;
				latitude += 0.0004;
			}else{
				longitude -= 0.0004;
				latitude -= 0.0004;
			}*/
			if(i<0){
				i = 0;
			}
			String numtime = HelperUtil.formatNumberDateTime(new Date());
			String sn = "UGO022017030601";
			String identify = sn+numtime;
			String time = HelperUtil.formatDateTime(new Date());
			String json = "{\"identify\": \""+identify+"\",\"sn\": \""+sn+"\",\"electricity\": \""+i+"%\"," +
					"\"GPS\": [{\"longitude\":\""+longitude+"\",\"EW\":\"E\",\"latitude\":\""+latitude+"\",\"NS\":\"N\"}]," +
					"\"total_voltage\":20,\"total_current\":20," +
					"\"left_hip_current\": 10,\"right_hip_current\": 10," +
					"\"left_knee_current\": 10,\"right_knee_current\": 10," +
					"\"time\": \""+time+"\"}";
			byte[] encode = ChaosAlgorithm.Encode(json, u, x0);
//			byte[] msg = new byte[1];
//			try {
//				msg = json.getBytes("utf-8");
//			} catch (UnsupportedEncodingException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			TestSender sender = new TestSender(pp);
			sender.sendByte(encode);
			sender.close();
			if(i>100 || i<=0){
				i=100;
			}else{
				i = i-10;
			}
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 测试发送设备的唯一地址
	 */
	public static void sendSole(){
		Producer pp = new Producer();
		pp.setUsername(HelperUtil.getConfigValue("energy.username"));
		pp.setPwd(HelperUtil.getConfigValue("energy.pwd"));
		pp.setIp(HelperUtil.getConfigValue("energy.ip"));
		pp.setVirtualhosts(HelperUtil.getConfigValue("energy.virtualhosts"));
		pp.setPort(HelperUtil.getConfigValue("energy.port"));
		pp.setExchangeName("ugo_parameter");
		pp.setRoutingKey("ugo_parameter");
		String json = "{\"identify\": \"CT2019000120170618161612345\",\"sn\": \"UGO022017030603\",\"left_thigh\": \"20.11\",\"left_calf\": \"18.09\",\"right_thigh\": \"20.11\",\"right_calf\": \"18.09\",\"height\": \"171.23\",\"weight\": \"69.9\",\"crotch_width\": \"26.11\",\"time\": \"2017-01-01 01:01:01\",\"stride\": 200,\"cycle\": 2}";
		//混沌算法加解密钥
		double u = Double.valueOf(HelperUtil.getConfigValue("energy.u"));
		double x0 = Double.valueOf(HelperUtil.getConfigValue("energy.x0"));
		byte[] encode = ChaosAlgorithm.Encode(json, u, x0);
		TestSender sender = new TestSender(pp);
		sender.sendByte(encode);
		sender.close();
	}
	
	/**
	 * 测试发送告警数据
	 */
	public static void sendAlert(){
		Producer pp = new Producer();
		pp.setUsername(HelperUtil.getConfigValue("energy.username"));
		pp.setPwd(HelperUtil.getConfigValue("energy.pwd"));
		pp.setIp(HelperUtil.getConfigValue("energy.ip"));
		pp.setVirtualhosts(HelperUtil.getConfigValue("energy.virtualhosts"));
		pp.setPort(HelperUtil.getConfigValue("energy.port"));
		pp.setExchangeName("ugo_alert");
		pp.setRoutingKey("ugo_alert");
		//混沌算法加解密钥
		double u = Double.valueOf(HelperUtil.getConfigValue("energy.u"));
		double x0 = Double.valueOf(HelperUtil.getConfigValue("energy.x0"));
		while (true) {
			String numtime = HelperUtil.formatNumberDateTime(new Date());
			String sn = "UGO022017030603";
			String identify = sn+numtime;
			String time = HelperUtil.formatDateTime(new Date());
			String json = "{\"identify\": \""+identify+"\",\"sn\": \""+sn+"\",\"type\": \"2\",\"latest\": \"0\",\"time\": \""+time+"\"}";

			byte[] encode = ChaosAlgorithm.Encode(json, u, x0);
			TestSender sender = new TestSender(pp);
			sender.sendByte(encode);
			sender.close();
			try {
				Thread.sleep(10000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 测试发送告警恢复数据
	 */
	public static void sendAlertRecover(){
		Producer pp = new Producer();
//		pp.setUsername("ugo_exo");
//		pp.setPwd("cttc123456");
//		pp.setIp("211.159.169.60");
//		pp.setVirtualhosts("/cttc_ugo");
//		pp.setPort("5678");

		pp.setUsername(HelperUtil.getConfigValue("energy.username"));
		pp.setPwd(HelperUtil.getConfigValue("energy.pwd"));
		pp.setIp(HelperUtil.getConfigValue("energy.ip"));
		pp.setVirtualhosts(HelperUtil.getConfigValue("energy.virtualhosts"));
		pp.setPort(HelperUtil.getConfigValue("energy.port"));

		pp.setExchangeName("cttc_recv");
		pp.setRoutingKey("00E04CB09881");
		//混沌算法加解密钥
		double u = Double.valueOf(HelperUtil.getConfigValue("energy.u"));
		double x0 = Double.valueOf(HelperUtil.getConfigValue("energy.x0"));
		while (true) {
			String mac = "00E04CB09881";
			byte[] Byte = HexToByteArr(mac);
			Calendar calendar = new GregorianCalendar();
			byte[] timeByte = calendar2Bytes(calendar);
			byte[] ByteAll = byteMerger(Byte,timeByte);

			byte[] encode = ChaosAlgorithm.EncodeByte(ByteAll, u, x0);
			TestSender sender = new TestSender(pp);
			sender.sendByte(encode);
			sender.close();
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 测试训练数据
	 */
	public static void sendTrainTime(){
		Producer pp = new Producer();
		pp.setUsername(HelperUtil.getConfigValue("energy.username"));
		pp.setPwd(HelperUtil.getConfigValue("energy.pwd"));
		pp.setIp(HelperUtil.getConfigValue("energy.ip"));
		pp.setVirtualhosts(HelperUtil.getConfigValue("energy.virtualhosts"));
		pp.setPort(HelperUtil.getConfigValue("energy.port"));
		pp.setExchangeName("ugo_training_begin");
		pp.setRoutingKey("ugo_training_begin");
		//混沌算法加解密钥
		double u = Double.valueOf(HelperUtil.getConfigValue("energy.u"));
		double x0 = Double.valueOf(HelperUtil.getConfigValue("energy.x0"));
		while (true) {
			String numtime = HelperUtil.formatNumberDateTime(new Date());
			String sn = "UGO022017030603";
			String identify = sn+numtime;
			String time = HelperUtil.formatDateTime(new Date());
			String json = "{\"identify\": \""+identify+"\",\"sn\": \""+sn+"\",\"time\": \""+time+"\"}";
			byte[] encode = ChaosAlgorithm.Encode(json, u, x0);
			TestSender sender = new TestSender(pp);
			sender.sendByte(encode);
			sender.close();
			try {
				Thread.sleep(10000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 测试发送告警数据
	 */
	public static void sendRealAlert(){
		Producer pp = new Producer();
		pp.setUsername("ugo_exo");
		pp.setPwd("cttc123456");
		pp.setIp("211.159.169.60");
		pp.setVirtualhosts("/cttc_ugo");
		pp.setPort("5678");
		pp.setExchangeName("ugo_alert");
		pp.setRoutingKey("ugo_alert");
		//混沌算法加解密钥
		double u = Double.valueOf(HelperUtil.getConfigValue("energy.u"));
		double x0 = Double.valueOf(HelperUtil.getConfigValue("energy.x0"));
//		while (true) {
			String numtime = HelperUtil.formatNumberDateTime(new Date());
			String sn = "UGO3001000003";
			String identify = sn+numtime;
			String time = HelperUtil.formatDateTime(new Date());
			String json = "{\"identify\": \""+identify+"\",\"sn\": \""+sn+"\",\"type\": \"1\",\"latest\": \"0\",\"time\": \""+time+"\"}";
			byte[] encode = ChaosAlgorithm.Encode(json, u, x0);
			TestSender sender = new TestSender(pp);
			sender.sendByte(encode);
			sender.close();
			try {
				Thread.sleep(10000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//		}
	}

	public static void sendUpgrade(){
		Producer pp = new Producer();

		pp.setUsername(HelperUtil.getConfigValue("energy.username"));
		pp.setPwd(HelperUtil.getConfigValue("energy.pwd"));
		pp.setIp(HelperUtil.getConfigValue("energy.ip"));
		pp.setVirtualhosts(HelperUtil.getConfigValue("energy.virtualhosts"));
		pp.setPort(HelperUtil.getConfigValue("energy.port"));

		pp.setExchangeName("cttc_recv");
		pp.setRoutingKey("00E04CB09881");
		//混沌算法加解密钥
		double u = Double.valueOf(HelperUtil.getConfigValue("energy.u"));
		double x0 = Double.valueOf(HelperUtil.getConfigValue("energy.x0"));


		// 读取升级文件
		FileChannel channel = null;
		FileInputStream fs = null;
		File serverFile = null;

		try {
			String fileName="SuperTerminal.exe";
			String filePath = HelperUtil.getConfigValue("energy.filepath") + fileName;
			System.out.println(filePath);
			serverFile = new File(filePath);
			fs = new FileInputStream(serverFile);
			channel = fs.getChannel();
			ByteBuffer byteBuffer = ByteBuffer.allocate((int) channel
					.size());
			while ((channel.read(byteBuffer)) > 0) {
				// do nothing
			}
			// 升级包转换为byte
			byte[] buffer = byteBuffer.array();

			String sign = "A2";
			byte[] signByte = HexToByteArr(sign);
			byte[] ByteAll = byteMerger(signByte,buffer);
			System.out.println(ByteArrToHex(ByteAll));

			byte[] encode = ChaosAlgorithm.EncodeByte(ByteAll, u, x0);
			TestSender sender = new TestSender(pp);
			sender.sendByte(encode);
			sender.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
			// 返回指令执行结果
			logger.debug("plc升级文件不存在异常："+e.getMessage());
		}catch (Exception e) {
			e.printStackTrace();
			// 返回指令执行结果
			logger.debug("plc远程升级设备异常："+e.getMessage());
		}

	}

	public static void testprintln(){
		//		Calendar calendar = new GregorianCalendar();
//		System.out.printf("%1$tF %<tT%n", calendar);
//
// 		byte[] bytes = calendar2Bytes(calendar);
//
// 		System.out.println(ByteArrToHex(bytes));
//
//		calendar = bytes2Calendar(bytes);
//
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String dateStr = sdf.format(calendar.getTime());
//
//		System.out.println("time:"+dateStr);

//		int ld = 36;
//		byte[] aa = shortToByteArray((short)36);
//		int s = getShort(aa,false);
//		System.out.println("ld1:"+s);
////		String mac = "00e04cb09881".replace("-","").toUpperCase();
//		System.out.println(mac);
//		byte[] data = {0x01,0x02};
//		System.out.println(data.length);
//		byte[] dataByte = subByte(data,0,260);

//		float f = (float) 2872.2163;
//		byte[] b=float2byte(f);
//		System.out.println(ByteArrToHex(b));
//		for(int i=0;i<3;i++)
//			System.out.println(b[i]);   //输出byte数组，显示的是奇怪的数字，因为float的四个字节被拆分成了四份
//		byte[] bb = {0x76, (byte) 0x83, 0x33, 0x45};
//		float f2=byte2float(bb);
//		System.out.println(f2);
//		byte a = 0x01;
//		boolean[] BooleanArray = getBooleanArray(a);
//		for(boolean b:BooleanArray){
//			int myInt = b ? 1 : 0;
//			System.out.println(myInt);
//		}

//		String aa= "00E04CB09881A006BAA75DF80000000000000000000000000000000000000000000000000000000000000000000000000000000014000000000000000000000000000000000000000000000000000000000000000000000000000000280000000000000000000000000000000000000000000000000000000000000000000000000000003C0000000000000000000000000000000000000000000000000000000000000000000000000000005000000000000000000000000000000000000000000000000000000000000000000000000000000064000000000000000000000000000000000000000000000000000000000000000000000000000000780000000000000000";
//		byte[] s = HexToByteArr(aa);
//		System.out.println(ByteArrToHex(s));
//		byte[] macByte = subByte(s,0,6);//mac数据
//		String macStr = ByteArrToHex(macByte).replace(" ","");
//		System.out.println("macStr:"+macStr);
//		if("00 E0 4C B0 98 81 ".equals(macStr)){
//			System.out.println("macStr:"+macStr);
//		}else if("00E04CB09881".equals(macStr)){
//			System.out.println("macStr:"+"00E04CB09881");
//		}
//		byte[] signByte = subByte(s,6,1);//数据标识
//		String signStr =ByteArrToHex(signByte);
//		System.out.println("signStr:"+signStr);
//		byte[] timeByte = subByte(s,7,4);//时间字节
//		Calendar calendar = bytes2Calendar_plc(timeByte);
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String dateStr = sdf.format(calendar.getTime());
//		System.out.println("dateStr:"+dateStr);
////
//		byte[] lengthByte = subByte(s,11,2);//长度字节
//		int lengthInt = getShort(lengthByte,true);
//		System.out.println("lengthInt:"+lengthInt);
//		System.out.println("real--lengthInt:"+s.length);
		String ss="00E04CB09881A0A755A95DF800000100020003000400050006000700080009000A000B000C000D000E000F0010001100120013001400150016001700180019001A001B001C001D001E001F0020002100220023002400250026002700280029002A002B002C002D002E002F0030003100320033003400350036003700380039003A003B003C003DFFFFD55501450A2C05550043004400000046000000480000004A0000004C0000004E00000050000000520000005400000056000000580000005A0000005C0000005E000000600000006200630064000000000000000000000000000000000000000000000000000000000000000000000000000000780000000000000000";
		byte[] aa = HexToByteArr(ss);
		System.out.println("length:"+aa.length);
		byte[] dataByte = subByte(aa,13,aa.length-13);
//		System.out.println("dataByte:"+ByteArrToHex(dataByte));
//		System.out.println("dataByte--length:"+dataByte.length);
//		byte[]  var2Byte = subByte(dataByte,78,2);
//		String var2Byte_b = ByteArrToHex(var2Byte);
//		System.out.println("varInt:"+var2Byte_b);
//
//		int varInt = getShort(var2Byte,false);
//		System.out.println("varInt:"+varInt);
//		byte[] var4Byte =subByte(dataByte,156,4);
//		float varIntfl = byte2float(var4Byte);
//		System.out.println("varIntfl:"+varIntfl);
//		DecimalFormat decimalFormat = new DecimalFormat("0.00");//构造方法的字符格式这里如果小数不足2位,会以0补足.
//		String strPrice = decimalFormat.format(1.369);
//		System.out.println("var:"+strPrice);

//		byte[] aaa = {(byte)0x00,(byte)0x1A};
//		int aavarInt = getShort(aaa,false);
//		System.out.println(aavarInt);
//
//
//		byte[] bb = subByte(dataByte,192,4);//{(byte)0x00,(byte)0x00,(byte)0x00,(byte)0x98};
//		System.out.println(ByteArrToHex(bb));
//		float varIntfl = byte2float(bb);
//		System.out.println(varIntfl);
//		DecimalFormat decimalFormat = new DecimalFormat("0.00");//构造方法的字符格式这里如果小数不足2位,会以0补足.
//		String strPrice = decimalFormat.format(varIntfl);
//		System.out.println(strPrice);

//		float cc = (float)1.9;
//		byte[] bbc = float2byte(cc);
//		System.out.println(ByteArrToHex(bbc));
//
//
//		long dec_num = Long.parseLong(ByteArrToHex(subByte(bbc,0,2)).replace(" ",""), 16);
//		System.out.println(dec_num);
//		long dec_num2 = Long.parseLong(ByteArrToHex(subByte(bbc,2,2)).replace(" ",""), 16);
//		System.out.println(dec_num2);

		int min = 10;
		int max = 100;
		int intBounded = min + ((int) (new Random().nextFloat() * (max - min)));
		float floatUnbounded = new Random().nextFloat();
		floatUnbounded = floatUnbounded +intBounded;
		DecimalFormat decimalFormat = new DecimalFormat("0.00");//构造方法的字符格式这里如果小数不足2位,会以0补足.
		String varInt_f = decimalFormat.format(floatUnbounded);
		System.out.println(varInt_f);
	}

	/**
	 * 测试发送PLC相关指令
	 */
	public static void sendPLC(){
		Producer pp = new Producer();
		pp.setUsername(HelperUtil.getConfigValue("energy.username"));
		pp.setPwd(HelperUtil.getConfigValue("energy.pwd"));
		pp.setIp(HelperUtil.getConfigValue("energy.ip"));
		pp.setVirtualhosts(HelperUtil.getConfigValue("energy.virtualhosts"));
		pp.setPort(HelperUtil.getConfigValue("energy.port"));

		String macStr="00E04CB9B145";
		pp.setExchangeName("cttc_recv"); //改为energy_control
		pp.setRoutingKey(macStr);

		//混沌算法加解密钥
		double u = Double.valueOf(HelperUtil.getConfigValue("energy.u"));
		double x0 = Double.valueOf(HelperUtil.getConfigValue("energy.x0"));

		Integer Logid = 500;

		while (true) {
			TestSender sender = new TestSender(pp);
			if(1==1){
				//设备启停
				int code = 1;//设备使能码 0：停止 1：启动
				String sign = "A3";
				byte[] signByte = HexToByteArr(sign); //报文标识
				short uniqueId = Logid.shortValue();
				byte[] uniqueIdByte = shortToBytes(uniqueId);//唯一标识
				int pos = 126;//248 250 252
				byte[] dataLenByte = shortToBytes((short) 1); //数据长度
				byte[] posByte = intToBytes(pos); //起始位置
				byte[] systemEnabled = new byte[2];//设置数据
				boolean[] array1 = getBooleanArray((byte) 0x00);
				boolean byteValue;
				if (code == 1) {
					byteValue = true;
				} else {
					byteValue = false;
				}
				array1[0] = byteValue;
				byte value = getByte(array1);
				boolean[] array2 = getBooleanArray((byte) 0x00);
				byte value2 = getByte(array2);
				systemEnabled[0] = value;
				systemEnabled[1] = value2;
				byte[] byte1 = byteMerger(signByte, uniqueIdByte);
				byte[] byte2 = byteMerger(byte1, posByte);
				byte[] byte3 = byteMerger(byte2, dataLenByte);
				byte[] b = byteMerger(byte3, systemEnabled);

				byte[] encode = ChaosAlgorithm.EncodeByte(b, u, x0);

				sender.sendByte(encode);
			}

			if(2==2){
				int temperature = 0;
				//温度控制
				String sign = "A3";
				//产生随机数0~2
				Random random = new Random();
				int randomkey = random.nextInt(2);

				byte[] signByte = HexToByteArr(sign); //报文标识
				short pos = 0;//248 250 252
				byte[] posByte; //起始位置
				byte[] tempByte = intToBytesHightLow(temperature);
				byte[] dataLenByte = shortToBytes((short) 1); //数据长度
				if ( randomkey==0){
					temperature = random.nextInt(50)+1;
					pos = 123;
				}else if (randomkey==1){
					temperature = random.nextInt(50)+1;
					pos = 124;
				} else {
					temperature = random.nextInt(50)+1;
					pos = 125;
				}
				tempByte = shortToByteArray((short)temperature);
				posByte = intToBytes(pos);
				short uniqueId = Logid.shortValue();
				byte[] uniqueIdByte = shortToBytes(uniqueId);//唯一标识
				byte[] byte1 = byteMerger(signByte,uniqueIdByte);
				byte[] byte2 = byteMerger(byte1,posByte);
				byte[] byte3 = byteMerger(byte2,dataLenByte);
				byte[] b = byteMerger(byte3,tempByte);
				byte[] encode = ChaosAlgorithm.EncodeByte(b, u, x0);

				sender.sendByte(encode);
			}

			sender.close();
			Logid++;


			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {

//		byte[]  varByte11 =  float2byte((float) 132.10);
//		String aa = ByteArrToHex(varByte11);
//		System.out.println(aa);
//
//		String varByte_f = ByteArrToHexReal(varByte11);
//		System.out.println(varByte_f);
//		System.out.println(byte2float(varByte11));
//		float varf = Float.intBitsToFloat(Integer.valueOf(varByte_f, 16));
//		System.out.println(varf);

		float varf11 = (float) 132.32;
		int  varf22 = Float.floatToIntBits(varf11);

		byte []  a1 = intToBytes2(varf22);

		System.out.println(ByteArrToHex(a1));

		String sa1 = ByteArrToHexReal(a1);
		float varf = Float.intBitsToFloat(Integer.valueOf(sa1, 16));
		System.out.println(varf);

	}
	}
