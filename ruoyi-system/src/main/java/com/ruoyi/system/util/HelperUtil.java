package com.ruoyi.system.util;

import org.apache.shiro.SecurityUtils;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.regex.PatternSyntaxException;


public class HelperUtil {
	private static final String FILENAME = "/energy.properties";// 这里是指放在classes下，如果有包的话，前面加包名即可。例：/com/web/db.properties
	
	/**
	 * 获取配置文件的配置值
	 * @param key
	 * @return
	 */
	public static String getConfigValue(String key) {
		Properties p = new Properties();
		String value = "";
		try {
			InputStream in = HelperUtil.class.getResourceAsStream(FILENAME);
			p.load(in);
			in.close();
			value = p.getProperty(key);
		} catch (IOException ex) {
			ex.printStackTrace();
		}
		return value;
	}
	
	/**
	 * 源字符串如果是空返回0
	 * @param src
	 * @return
	 */
	public static String IsNullToZero(String src){
		String dest = src;
		if(src==null || "".equals(src)|| "null".equals(src)){
			dest = "0";
		}
		return dest;
	}
	
	/**
	 * 源字符串如果是空返回0
	 * @param src
	 * @return
	 */
	public static Integer IsNullToInteger(String src){
		Integer dest = 0;
		if(src==null || "".equals(src)|| "null".equals(src)){
			dest = 0;
		}else{
			dest = Integer.valueOf(src);
		}
		return dest;
	}
	
	/**
	 * 源字符串如果是空返回0
	 * @param src
	 * @return
	 */
	public static double IsNullToDouble(String src){
		double dest = 0.0;
		if(src==null || "".equals(src)|| "null".equals(src)){
			dest = 0.0;
		}else{
			dest = Double.valueOf(src);
		}
		return dest;
	}
	
	/**
	 * 源字符串如果为NULL返回“”
	 * @param src
	 * @return
	 */
	public static String isNullToString(String src){
		String dest = src;
		if(src==null || "null".equals(src)){
			dest = "";
		}
		return dest;
	}
	
	/**
	 * 源字符串如果为NULL返回“”
	 * @param obj
	 * @return
	 */
	public static String isNullToString(Object obj){
		if(obj==null){
			return "";
		}else{
			String dest = String.valueOf(obj);
			if("null".equals(dest)){
				dest = "";
			}
			return dest;
		}
	}
	
	/**
	 * 格式化时间
	 * “2016-01-01 11:11:11.0”转化为“2016-01-01 11:11:11”
	 * @param src
	 * @return
	 */
	public static String substrTime(String src){
		String dest = src;
		if(null!=src&&!"".equals(src)&&!"null".equals(src)){
			dest = src.substring(0,src.length()-2);
		}
		return dest;
	}
	
	/**
	 * 格式化日期时间为数字
	 * @param date
	 * @return
	 */
	public static String formatNumberDateTime(Date date){
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		return format.format(date);
	}
	
	/**
	 * 格式化日期时间
	 * @param date
	 * @return
	 */
	public static String formatDateTime(Date date){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(date);
	}
	
	/**
	 * 格式化日期时间到分钟
	 * @param date
	 * @return
	 */
	public static String formatDateMinute(Date date){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return format.format(date);
	}
	
	/**
	 * 格式化日期
	 * @param date
	 * @return
	 */
	public static String formatDate(Date date){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(date);
	}
	
	/**
	 * 格式化日期为月日： 12月11日
	 * @param source
	 * @return
	 */
	public static String formatMonthDay(String source){
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = dateformat.parse(source);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		SimpleDateFormat format = new SimpleDateFormat("M月d日");
		return format.format(date);
	}
	
	
	/**
	 * 获取系统日期
	 * @return
	 */
	public static String getSystemDate(){
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(date);
	}
	
	/**
	 * 获取系统时间
	 * @return
	 */
	public static String getSystemTime(){
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(date);
	}
	
	/**
	 * 获取系统(时:分)
	 * @return
	 */
	public static String getHourMinute(){
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("HH:mm");
		return format.format(date);
	}
	
	/**
	 * java.util.Date转换日期字符串
	 * @param date
	 * @return
	 */
	public static Date getTime(Date date){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = format.format(date);
		Date time = date;
		try {
			time = format.parse(now);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return time;
	}
	
	/**
	 * 获取Session中的资源信息
	 * @return
	 */
	public static String getSessionResource(){
		String sessionResource = (String) SecurityUtils.getSubject().getSession().getAttribute("sessionResource");
		return sessionResource;
	}

	/**
	 * 从session中获取值
	 * @param key
	 * @return
	 */
	public static Object getSessionObj(String key){
		return SecurityUtils.getSubject().getSession().getAttribute(key);
	}
	
	/**
	 * 处理字符串，把逗号形式的字符串转化为单引号
	 * 1,2,3  -->  '1','2','3'
	 * @return
	 */
	public static String dualCommaToQuote(String src){
		String value = "";
		if(null!=src && !"".equals(src) && !"null".equals(src)){
			String[] dests = src.split(",");
			for (int i = 0; i < dests.length; i++) {
				value += "'"+dests[i]+"',";
			}
		}
		if(value.length()>0){
			value = value.substring(0,value.length()-1);
		}else{
			value = "''";
		}
		return value;
	}
	
	/**
	 * 获取当前日期一星期前日期
	 * @return
	 */
	public static String getWeekAgo(){
		Calendar c = Calendar.getInstance(); 
		c.add(Calendar.DAY_OF_MONTH,-6);//关键是这个7天前.... 
		SimpleDateFormat sdf = new SimpleDateFormat( "yyyy-MM-dd"); 
		return sdf.format(c.getTime());
	}
	
	 /**
     * 当月最后一天
     * @return
     */
	public static String getLastDayOfMonth(String date)
    {
		int year =Integer.parseInt(date.substring(0,4));
		int month = Integer.parseInt(date.substring(5,7));
        Calendar cal = Calendar.getInstance();
        //设置年份
        cal.set(Calendar.YEAR,year);
        //设置月份
        cal.set(Calendar.MONTH, month-1);
        //获取某月最大天数
        int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
        //设置日历中月份的最大天数
        cal.set(Calendar.DAY_OF_MONTH, lastDay);
        //格式化日期
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String lastDayOfMonth = sdf.format(cal.getTime());
         
        return lastDayOfMonth;
    }
	/**
     * 当年最后一月的最后一天
     * @return
     */
	public static String getLastMonthDayOfYear(String date)
    {
		int year =Integer.parseInt(date.substring(0,4));
        Calendar cal = Calendar.getInstance();
        //设置年份
        cal.set(Calendar.YEAR,year);
        //设置月份
        cal.set(Calendar.MONTH, 11);
        //获取某月最大天数
        int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
        //设置日历中月份的最大天数
        cal.set(Calendar.DAY_OF_MONTH, lastDay);
        //格式化日期
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String lastDayOfMonth = sdf.format(cal.getTime());
         
        return lastDayOfMonth;
    }
	
    /**
     * 将数字转化为大写    
     * @param num
     * @return
     */
    public static String numToUpper(int num) {    
        // String u[] = {"零","壹","贰","叁","肆","伍","陆","柒","捌","玖"};    
        String u[] = { "〇", "一", "二", "三", "四", "五", "六", "七", "八", "九" };    
        char[] str = String.valueOf(num).toCharArray();    
        String rstr = "";    
        for (int i = 0; i < str.length; i++) {    
            rstr = rstr + u[Integer.parseInt(str[i] + "")];    
        }    
        return rstr;    
    }
    
    /**
     * 将数字数组转化为自定义字符串数组  
     * ["1","2","3"] ==> ["第一次","第二次","第三次"......,"第十次"] 
     * @param source
     * @param begin
     * @param end
     * @return
     */
    public static String[] numArrayToStringArray(String[] source,String begin,String end){
    	if(null!=source){
    		String[] dest = new String[source.length];
    		for (int i = 0; i < source.length; i++) {
    			if("".equals(source[i])){
    				dest[i] = "";
    			}else{
					String val = NumberToChinese.numToChinese(Integer.valueOf(source[i]));
					val = val.replaceAll(" ", "");
					dest[i] = begin+val+end;
    			}
			}
    		return dest;
    	}else{
    		return source;
    	}
    }
    
    /**
     * 将数字数组转化为自定义字符串数组  
     * 1 ==> "第一次"
     * @param source
     * @param begin
     * @param end
     * @return
     */
    public static String numToWordFigure(String source,String begin,String end){
    	String dest = "";
    	if(null!=source){
    		String val = NumberToChinese.numToChinese(Integer.valueOf(source));
			val = val.replaceAll(" ", "");
			dest = begin+val+end;
    		return dest;
    	}else{
    		return source;
    	}
    }
    
    /** 
     * 得到几周前的时间 
     *  
     * @param week 
     * @return 
     */  
    public static String getDateBeforeWeek(int week) {  
    	//格式化日期
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	Calendar now = Calendar.getInstance();  
    	int day = week*7;
        now.set(Calendar.DATE, now.get(Calendar.DATE) - day);  
        String date = sdf.format(now.getTime());
        return date;  
    }   
    
    /**
     * 获取前x月的第一天
     * @param before
     * @return
     */
    public static String getFirstDayBefore(int before){
    	//格式化日期
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        //获取前x个月第一天
        Calendar calendar1 = Calendar.getInstance();
        calendar1.add(Calendar.MONTH, -before);
        calendar1.set(Calendar.DAY_OF_MONTH,1);
        String firstDay = sdf.format(calendar1.getTime());
        return firstDay;
    }
    
    /**
     * 获取当月最后一天
     * @return
     */
    public static String getLastDayCurrent(){
    	//格式化日期
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      //获取当前月最后一天
        Calendar ca = Calendar.getInstance();    
        ca.set(Calendar.DAY_OF_MONTH, ca.getActualMaximum(Calendar.DAY_OF_MONTH));  
        String lastDay = sdf.format(ca.getTime());
        return lastDay;
    }
    
    /** 
     * 获取自定义时间的年月日 
     */
	public static String getFirstDayByYearAndMonth(String date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		Date dt = null;
		try {
			dt = sdf.parse(date);
			cal.setTime(dt);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		// 设置年份
		cal.set(Calendar.YEAR, year);
		// 设置月份
		cal.set(Calendar.MONTH, month - 1);
		// 获取某月最小天数
		int firstDay = cal.getActualMinimum(Calendar.DAY_OF_MONTH);
		// 设置日历中月份的最小天数
		cal.set(Calendar.DAY_OF_MONTH, firstDay);
		// 格式化日期
		String firstDayOfMonth = sdf.format(cal.getTime());
		return firstDayOfMonth;
	}
    
	/** 
     * 获取16进制随机数 
     * @param len 
     * @return
     */  
    public static String randomHexString(int len)  {  
        try {  
            StringBuffer result = new StringBuffer();  
            for(int i=0;i<len;i++) {  
                result.append(Integer.toHexString(new Random().nextInt(16)));  
            }  
            return result.toString().toUpperCase();  
              
        } catch (Exception e) {  
            // TODO: handle exception  
            e.printStackTrace();  
        }  
        return "0";  
    } 
    
    /**
     * 将A,B,C,D,E转化为1,2,3,4,5
     * @param source
     * @return
     */
    public static String letterToNumber(String source){
    	if(null!=source){
    		String dest = "0";
    		if("A".equals(source)){
    			dest = "1";
    		}else if("B".equals(source)){
    			dest = "2";
    		}else if("C".equals(source)){
    			dest = "3";
    		}else if("D".equals(source)){
    			dest = "4";
    		}else if("E".equals(source)){
    			dest = "5";
    		}
    		return dest;
    	}else{
    		return IsNullToZero(source);
    	}
    }
    
    /**
     * 产生6位随机数
     * @return
     */
    public static String getRandom(){
    	Random r = new Random();
        long num = Math.abs(r.nextLong() % 10000000000L);
        String s = String.valueOf(num);
        for(int i = 0; i < 6-s.length(); i++){
            s = "0" + s;
        }
         
        return s;
    }
    
    /** 
     * 大陆号码或香港号码均可 
     */  
    public static boolean isPhoneLegal(String str)throws PatternSyntaxException {  
        return isChinaPhoneLegal(str) || isHKPhoneLegal(str);  
    }  
  
    /** 
     * 大陆手机号码11位数，匹配格式：前三位固定格式+后8位任意数 
     * 此方法中前三位格式有： 
     * 13+任意数 
     * 15+除4的任意数 
     * 18+除1和4的任意数 
     * 17+除9的任意数 
     * 147 
     */  
    public static boolean isChinaPhoneLegal(String str) throws PatternSyntaxException {  
        String regExp = "^((13[0-9])|(15[^4])|(18[0,2,3,5-9])|(17[0-8])|(147))\\d{8}$";  
        Pattern p = Pattern.compile(regExp);  
        Matcher m = p.matcher(str);  
        return m.matches();  
    }  
  
    /** 
     * 香港手机号码8位数，5|6|8|9开头+7位任意数 
     */  
    public static boolean isHKPhoneLegal(String str)throws PatternSyntaxException {  
        String regExp = "^(5|6|8|9)\\d{7}$";  
        Pattern p = Pattern.compile(regExp);  
        Matcher m = p.matcher(str);  
        return m.matches();  
    }  
      
    
    public static boolean isNumber(String str)
    {
        Pattern pattern= Pattern.compile("[0-9]*");
        Matcher match=pattern.matcher(str);
        return match.matches();
    }
    
    /**
     * 获取两个日期之间的所有日期（yyyy-MM-dd）
     * @Description TODO
     * @param beginDate
     * @param endDate
     * @return
     * @author XuJD
     * @date 2017-4-1
     */
	public static List<Date> getBetweenDates(String beginDate, String endDate) {
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
		Date begin = new Date();
		Date end = new Date();
		try {
			begin = dateformat.parse(beginDate);
			end = dateformat.parse(endDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		List<Date> result = new ArrayList<Date>();
		Calendar tempStart = Calendar.getInstance();
		tempStart.setTime(begin);
		/*
		 * Calendar tempEnd = Calendar.getInstance();
		 * tempStart.add(Calendar.DAY_OF_YEAR, 1); tempEnd.setTime(end); while
		 * (tempStart.before(tempEnd)) { result.add(tempStart.getTime());
		 * tempStart.add(Calendar.DAY_OF_YEAR, 1); }
		 */
		while (begin.getTime() <= end.getTime()) {
			result.add(tempStart.getTime());
			tempStart.add(Calendar.DAY_OF_YEAR, 1);
			begin = tempStart.getTime();
		}
		return result;
	}
	
	public static boolean isYearTotal(){
		boolean flag1 = false;
		try {
			String today_string = HelperUtil.formatDate(new Date());
			String year =  today_string.substring(0,4);
			
			String yeartotal_begin = year+"-02-13";
			String yeartotal_end = year+"-02-18";
		
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date choose_begin = sdf.parse(yeartotal_begin);
			Date choose_end = sdf.parse(yeartotal_end);
			Date today = sdf.parse(today_string);
			
			flag1 = choose_begin.before(today)&&today.before(choose_end);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag1;
	}
	
	public static String MD5(String s) {
	    try {
	        MessageDigest md = MessageDigest.getInstance("MD5");
	        byte[] bytes = md.digest(s.getBytes("utf-8"));
	        return toHex(bytes);
	    }
	    catch (Exception e) {
	        throw new RuntimeException(e);
	    }
	}

	public static String toHex(byte[] bytes) {

	    final char[] HEX_DIGITS = "0123456789ABCDEF".toCharArray();
	    StringBuilder ret = new StringBuilder(bytes.length * 2);
	    for (int i=0; i<bytes.length; i++) {
	        ret.append(HEX_DIGITS[(bytes[i] >> 4) & 0x0f]);
	        ret.append(HEX_DIGITS[bytes[i] & 0x0f]);
	    }
	    return ret.toString();
	}
	

    public static void main(String[] args) {
    	List<Date> list = getBetweenDates("2017-12-01", "2017-12-23");
    	for (Date date : list) {
    		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
    		System.out.println(dateformat.format(date));
		}
	}
}
