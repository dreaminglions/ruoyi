package com.ruoyi.common.utils.chaos;

import java.io.UnsupportedEncodingException;


public class ChaosAlgorithm {

    /// <summary>
    /// 字符串加密
    /// </summary>
    /// <param name="source">原始内容</param>
    /// <returns>加密字符串</returns>
    public static byte[] Encode(String src,double u,double x0)
    {
        if (src == null) src = "";
         byte[] dest = null;
        try {
			byte[] data = src.getBytes("UTF-8");
			dest = Encrypt(data, u, x0);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
        return dest;
    }
    
  /// <summary>
    /// 字符串加密
    /// </summary>
    /// <param name="source">原始内容</param>
    /// <returns>加密字符串</returns>
    public static byte[] EncodeByte(byte[] data,double u,double x0)
    {
		byte[] dest = Encrypt(data, u, x0);
        return dest;
    }
    /// <summary>
    /// 字符串解密
    /// </summary>
    /// <param name="source">加密字符串</param>
    /// <returns>原始内容</returns>
    public static byte[] Decode(byte[] data,double u,double x0)
    {
        if (data == null)
            return null;
        byte[] dest = Encrypt(data, u, x0);
        return dest;
    }


    /// <summary>
    /// 基于Logistic模型的混沌加解密
    /// </summary>
    /// <param name="data">要处理的数据</param>
    /// <param name="u">应属于[3.57,4]</param>
    /// <param name="x0">应属于(0,1)</param>
    /// <returns></returns>
    public static byte[] Encrypt(byte[] data, double u, double x0)
    {
        byte[] res = new byte[data.length];
        double x = 3.1415;
//        System.out.println("double x :"+x);

        for (int i = 0; i < data.length; i++)
        {

//			System.out.println("for data :"+Integer.toHexString(data[i] & 0xFF));
//            x = logistic(u, x, 5);
//			System.out.println("for in :"+x);
            res[i] = (byte)((int)(Math.floor(x * 1000)) % 256 ^ data[i]);//取x小数点后3位来生成密钥
//			System.out.println("for res :"+Integer.toHexString(res[i] & 0xFF));
        }

        return res;
    }
    
    private static double logistic(double u, double x, int n)
    {
        for (int i = 0; i < n; i++)
        {
            x = u * x * (1 - x);
        }
        return x;
    }
    
   /**
    * Convert byte[] to hex string.这里我们可以将byte转换成int，然后利用Integer.toHexString(int)来转换成16进制字符串。
    * @param src byte[] data
    * @return hex string
    */   
   public static String bytesToHexString(byte[] src){
       StringBuilder stringBuilder = new StringBuilder("");
       if (src == null || src.length <= 0) {
           return null;
       }
       for (int i = 0; i < src.length; i++) {
           int v = src[i] & 0xFF;
           String hv = Integer.toHexString(v);
           if (hv.length() < 2) {
               stringBuilder.append(0);
           }
           stringBuilder.append(hv.toUpperCase());
       }
       return stringBuilder.toString();
   }
    
    public static byte[] hexStringToBytes(String hexString) {
		if (hexString == null || hexString.equals("")) {
			return null;
		}
		hexString = hexString.toUpperCase();
		int length = hexString.length() / 2;
		char[] hexChars = hexString.toCharArray();
		byte[] d = new byte[length];
		for (int i = 0; i < length; i++) {
			int pos = i * 2;
			d[i] = (byte) (charToByte(hexChars[pos]) << 4 | charToByte(hexChars[pos + 1]));
		}
		return d;
	}

	private static byte charToByte(char c) {
		return (byte) "0123456789ABCDEF".indexOf(c);
	}
	
	/**
	 * 金额加密转化为16进制
	 * @param source
	 * @param u
	 * @param x0
	 * @return
	 */
	public static String encodeData(String source,double u,double x0){
		//原始字符串转化为16进制数值
		byte[] data = hexStringToBytes(source);
		byte[] encode = EncodeByte(data, u, x0);
		String val = bytesToHexString(encode);
		return val;
	}
	
	/**
	 * 金额解密转化为16进制
	 * @param source
	 * @param u
	 * @param x0
	 * @return
	 */
	public static String decodeData(String source,double u,double x0){
		byte[] data = hexStringToBytes(source);
		byte[] decode = Decode(data,u,x0);
		String val = bytesToHexString(decode);
		return val;
	}
	
	/**
	 * 金额加密字符串，转化为16进制
	 * @param source
	 * @param u
	 * @param x0
	 * @return
	 */
	public static String EncodeString(String source, double u, double x0) {
		byte[] data = Encode(source, u, x0);
		String strt = bytesToHexString(data);
		return strt;
	}

	/**
	 * 金额解密字符串，转化为16进制
	 * @param data
	 * @param u
	 * @param x0
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String DecodeString(String data, double u, double x0)
			throws UnsupportedEncodingException {
		if (data == null)
			return null;
		String value = decodeData(data, u, x0);
		byte[] bdata = hexStringToBytes(value);
		String dest = new String(bdata, "utf-8");
		return dest;
	}
	
	
	public static void test1(double u,double x0){
		String source = "ggggg";
		System.out.println("原始字符串:"+source);
		byte[] data = hexStringToBytes(source);
		for (int i = 0; i < data.length; i++) {
			System.out.println("原始hex:"+data[i]);
		}
		byte[] val = EncodeByte(data, u, x0);
		for (int i = 0; i < val.length; i++) {
			System.out.println("加密："+val[i]);
		}
		System.out.println("加密啦："+bytesToHexString(val));
		byte[] de = Decode(val,u,x0);
		for (int i = 0; i < de.length; i++) {
			System.out.println("解密："+de[i]);
		}
		System.out.println("解密啦："+bytesToHexString(de));
	}
	
	public static void test2(double u,double x0){
		String source = "ae55237cb0ba9de55d485e6764c467c7";
		System.out.println("加密字符串:"+source);
		byte[] data = hexStringToBytes(source);
		for (int i = 0; i < data.length; i++) {
			System.out.println("原始hex:"+data[i]);
		}
		byte[] de = Decode(data,u,x0);
		for (int i = 0; i < de.length; i++) {
			System.out.println("解密："+de[i]);
		}
		System.out.println("解密啦："+bytesToHexString(de));
	}
	
    
	public static void main(String[] args) throws UnsupportedEncodingException {
		String source = "AABBCCDD";
		System.out.println("加密字符串:"+source);
		byte[] byte1 = hexStringToBytes(source);
		int l = byte1.length;

		System.out.println("长度:"+l);
		byte[] data = Encrypt(byte1, 3.9407, 0.7624);

		String ss= bytesToHexString(data);
		System.out.println("加密后字符串:"+ss);
		byte[] byte2 = Decode(data, 3.9407, 0.7624);
		String ss2= bytesToHexString(byte2);
		System.out.println("解密后字符串:"+ss2);

		/*double u = 3.95756362;
		double x0 = 0.48138636;
		String source = "UGO022017030601";*/
		/*byte[] test = source.getBytes();
		for (int i = 0; i < test.length; i++) {
			System.out.println(test[i]);
		}
		System.out.println(">>>>>"+source+"<<<<");
		byte[] data = Encode(source, u, x0);
		for (int i = 0; i < data.length; i++) {
			System.out.println(data[i]);
		}
		String strt = bytesToHexString(data);
		System.out.println(strt);
		String param = "E487E4A9FF75168BE6458FFCD4FE8146";
		String value = decodeData(param, u, x0);
		byte[] aa = hexStringToBytes(value);
		byte[] bb = Decode(data,u,x0);
		String dest = new String(aa, "utf-8");
		System.out.println(dest);*/
//		byte[] en = Decode(data, u, x0);
//		try {
//			String dest = new String(en, "utf-8");
//			System.out.println(">>>>>"+dest+"<<<<");
////			String str = bytesToHexString(en);
////			System.out.println(str);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		//test1(u, x0);
		
		
/*		byte[] en = Decode(source.getBytes(), u, x0);
		try {
			String dest = new String(en, "utf-8");
			System.out.println(">>>>>"+dest+"<<<<");
//			String str = bytesToHexString(en);
//			System.out.println(str);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}

}
