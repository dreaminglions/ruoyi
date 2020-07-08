package com.ruoyi.rabbitmq.util;

import com.ruoyi.rabbitmq.mapper.ConsumerMapper;
import org.springframework.context.ApplicationContext;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.UnknownHostException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class URLAvailability {

	// private static Logger logger = Logger.getLogger(URLAvailability.class);

	private static boolean isRun = false;

	private static boolean urlAvailable = false;

	private static URL urlStr;

	private static HttpURLConnection connection;

	private static int state = -1;

	private static String succ;

	private static String url = "http://www.baidu.com";

	private static String closeTime = null;

	private static int status = 0;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public static String getSucc() {
		return succ;
	}

	public static void setSucc(String succ) {
		URLAvailability.succ = succ;
	}

	/**
	 * 功能描述 : 检查URL是否可用
	 *
	 * 
	 * @return String
	 */
	public synchronized static String isConnect() {
		state = -1;
		succ = null;
		if (isRun) {
			while (true) {
				try {
					if (urlAvailable) {
						System.out.println("非测试主程序检测到联网成功");
						succ = url;
						break;
					}
					Thread.sleep(8000);
					System.out.println("联网不成功------");
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		} else {
			connectState();
		}

		if (url == null || url.length() <= 0) {
			System.out.println("------>NULL");
			return succ;
		}
		// new URLAvailability().connectState(url);
		return succ;
	}

	/**
	 * 功能描述 : 检测当前网络是否断开 或 URL是否可连接, 如果网络没断开,最多连接网络 5 次, 如果 5
	 * 次都不成功说明该地址不存在或视为无效地址.
	 * 
	 * @return void
	 */
	private synchronized static void connectState() {
		urlAvailable = false;
		isRun = true;
		while (!urlAvailable) {
			try {
				urlStr = new URL(url);
				connection = (HttpURLConnection) urlStr.openConnection();
				state = connection.getResponseCode();
				if (state == 200) {
					succ = connection.getURL().toString();
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					System.out.println("网络成功连接"+format.format(new Date()));
				}
				break;
			} catch (UnknownHostException ex) {
				if (closeTime == null) {
					DateFormat df = DateFormat.getDateTimeInstance();
					closeTime = df.format(new Date());
					System.out.println("网络连接状态已断开,请检查网络连接设备");
					System.out.println("断开时间 : " + closeTime);
					System.out.println("程序开始执行每10s检测一次网络");

				}
				try {
					status++;
					System.out.println("开始第" + status + " 次检测网络状态是否可连接");
					Thread.sleep(10000);
				} catch (InterruptedException e) {
				}
			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		if (state == 200) {
			
			DateFormat df = DateFormat.getDateTimeInstance();
			closeTime = df.format(new Date());
			urlAvailable = true;
			isRun = false;
			state = -1;
			testDBByOpenSession();
		}
	}
	
	public static boolean testDBByOpenSession(){
		System.out.println("测试数据库连接");
		boolean isDb = false;
		try {
			//ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
			ApplicationContext ctx = ApplicationContextFactory.getInstance();
			ConsumerMapper mapper = (ConsumerMapper)ctx.getBean("consumerMapper");
			mapper.getAll();
			System.out.println("数据连接成功");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(".........异常不会执行，却执行了.............");
		}
		return isDb;
	}
	
	
	public static void main(String[] args) {
		testDBByOpenSession();
	}

}
