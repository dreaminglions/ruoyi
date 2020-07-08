package com.ruoyi.rabbitmq.taskhandler;


import com.ruoyi.rabbitmq.domain.Consumer;
import net.sf.json.JSONObject;
import org.apache.commons.compress.archivers.ArchiveException;
import org.apache.commons.compress.archivers.ArchiveInputStream;
import org.apache.commons.compress.archivers.ArchiveStreamFactory;
import org.apache.commons.compress.archivers.tar.TarArchiveEntry;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.zip.GZIPInputStream;

/**
 * 设备升级任务处理类
 * @author bida
 * @version 2017-03-08
 */
public class UpgradeTaskHandler implements ITaskHandler {
	private static Logger logger = LoggerFactory.getLogger(UpgradeTaskHandler.class);
	private Consumer consumer;
	
	public UpgradeTaskHandler(Consumer consumer) {
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
	
	// 拼接字节流
		public static byte[] byteMerger(byte[] byte_1, byte[] byte_2) {
			byte[] byte_3 = new byte[byte_1.length + byte_2.length];
			System.arraycopy(byte_1, 0, byte_3, 0, byte_1.length);
			System.arraycopy(byte_2, 0, byte_3, byte_1.length, byte_2.length);
			return byte_3;
		}

		// 解压缩gzip
		public String unzipOarFile(String filename) {
			String result = "";
			FileInputStream fis = null;
			ArchiveInputStream in = null;
			BufferedInputStream bufferedInputStream = null;
			try {
				fis = new FileInputStream(filename);
				GZIPInputStream is = new GZIPInputStream(new BufferedInputStream(fis));
				in = new ArchiveStreamFactory().createArchiveInputStream("tar", is);
				bufferedInputStream = new BufferedInputStream(in);
				TarArchiveEntry entry = (TarArchiveEntry) in.getNextEntry();
				while (entry != null) {
					String name = entry.getName();
					if (name != null && name.indexOf("system/version.txt") != -1) {
						int bytesRead = 0;
						byte[] buffer = new byte[1024];
						while ((bytesRead = bufferedInputStream.read(buffer)) != -1) {
							// 将读取的字节转为字符串对象
							result = new String(buffer, 0, bytesRead);
						}
					}
					entry = (TarArchiveEntry) in.getNextEntry();
				}

			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ArchiveException e) {
				e.printStackTrace();
			} finally {
				try {
					in.close();
					fis.close();
					if (bufferedInputStream != null) {
						bufferedInputStream.close();
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			return result;
		}
	
}
