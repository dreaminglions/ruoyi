package com.ruoyi.rabbitmq.domain;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class ByteUtil {


    public static  String ByteArrToHex(byte[] inBytArr)//字节数组转转hex字符串
    {
        StringBuilder strBuilder=new StringBuilder();
        int j=inBytArr.length;
        for (int i = 0; i < j; i++)
        {
            strBuilder.append(Byte2Hex(inBytArr[i]));
            strBuilder.append(" ");
        }
        return strBuilder.toString();
    }


    /**
     * 将int类型的数据转换为byte数组 原理：将int数据中的四个byte取出，分别存储
     *
     * @param n  int数据
     * @return 生成的byte数组
     */
    public static byte[] intToBytes2(int n) {
        byte[] b = new byte[4];
        for (int i = 0; i < 4; i++) {
            b[i] = (byte) (n >> (24 - i * 8));
        }
        return b;
    }

    public static  String ByteArrToHexReal(byte[] inBytArr)//字节数组转转hex字符串
    {
        StringBuilder strBuilder=new StringBuilder();
        int j=inBytArr.length;
        for (int i = 0; i < j; i++)
        {
            strBuilder.append(Byte2Hex(inBytArr[i]));
        }
        return strBuilder.toString();
    }

    public static byte[] subByte(byte[] b,int off,int length){
        byte[] b1 = new byte[length];
        System.arraycopy(b, off, b1, 0, length);
        return b1;
    }

    public static byte[] byteMerger(byte[] byte_1, byte[] byte_2){
        byte[] byte_3 = new byte[byte_1.length+byte_2.length];
        System.arraycopy(byte_1, 0, byte_3, 0, byte_1.length);
        System.arraycopy(byte_2, 0, byte_3, byte_1.length, byte_2.length);
        return byte_3;
    }

    public static  byte[] HexToByteArr(String inHex)//hex字符串转字节数组
    {
        int hexlen = inHex.length();
        byte[] result;
        if (isOdd(hexlen)==1)
        {//奇数
            hexlen++;
            result = new byte[(hexlen/2)];
            inHex="0"+inHex;
        }else {//偶数
            result = new byte[(hexlen/2)];
        }
        int j=0;
        for (int i = 0; i < hexlen; i+=2)
        {
            result[j]=HexToByte(inHex.substring(i,i+2));
            j++;
        }
        return result;
    }

    // 判断奇数或偶数，位运算，最后一位是1则为奇数，为0是偶数
    static public int isOdd(int num)
    {
        return num & 0x1;
    }
    //-------------------------------------------------------
    static public int HexToInt(String inHex)//Hex字符串转int
    {
        return Integer.parseInt(inHex, 16);
    }
    //-------------------------------------------------------
    static public byte HexToByte(String inHex)//Hex字符串转byte
    {
        return (byte)Integer.parseInt(inHex,16);
    }
    //-------------------------------------------------------
    public static  String Byte2Hex(Byte inByte)//1字节转2个Hex字符
    {
        return String.format("%02x", inByte).toUpperCase();
    }

    public static Calendar bytes2Calendar(byte[] bytes) {
        int time = (bytes[0] << 24) & 0xFF000000 | (bytes[1] << 16) & 0xFF0000 | (bytes[2] << 8) & 0xFF00 | (bytes[3]) & 0xFF;
        Calendar calendar = new GregorianCalendar();
        calendar.setTimeInMillis(time * 1000L);
        return calendar;
    }

    public static Calendar bytes2Calendar_plc(byte[] bytes) {
        int time = (bytes[3] << 24) & 0xFF000000 | (bytes[2] << 16) & 0xFF0000 | (bytes[1] << 8) & 0xFF00 | (bytes[0]) & 0xFF;
        Calendar calendar = new GregorianCalendar();
        calendar.setTimeInMillis(time * 1000L);
        return calendar;
    }

    public static byte[] calendar2Bytes(Calendar calendar) {
        int time = (int)(calendar.getTimeInMillis()/1000);
        byte[] bytes = new byte[4];
        for(int i = bytes.length - 1; i >= 0; i--) {
            bytes[i] = (byte)(time & 0xFF);
            time >>= 8;
        }
        return bytes;
    }


    /**
     * 将长度为2的byte数组转换为16位int
     *
     * @param res
     *            byte[]
     * @return int
     * */
    public static int byte2int(byte[] res) {
        // res = InversionByte(res);
        // 一个byte数据左移24位变成0x??000000，再右移8位变成0x00??0000
        int targets = (res[0] & 0xff) | ((res[1] << 8) & 0xff00); // | 表示安位或
        return targets;
    }

    public static byte[] shortToByteArray(short s) {
        byte[] targets = new byte[2];
        for (int i = 0; i < 2; i++) {
            int offset = (targets.length - 1 - i) * 8;
            targets[i] = (byte) ((s >>> offset) & 0xff);
        }
        return targets;
    }

    /**
     * 将byte[]转换为short
     * @param buf byte数组
     * @param asc true
     * @return
     */
    public static short getShort(byte[] buf, boolean asc) {
        if (buf == null) {
            throw new IllegalArgumentException("byte array is null!");
        }
        if (buf.length > 2) {
            throw new IllegalArgumentException("byte array size > 2 !");
        }
        short r = 0;
        if (asc)
            for (int i = buf.length - 1; i >= 0; i--) {
                r <<= 8;
                r |= (buf[i] & 0x00ff);
            }
        else
            for (int i = 0; i < buf.length; i++) {
                r <<= 8;
                r |= (buf[i] & 0x00ff);
            }
        return r;
    }

    //float转换成byte[]
    public static byte[] float2byte(float f) {

        // 把float转换为byte[]
        int fbit = Float.floatToIntBits(f);

        byte[] b = new byte[4];
        for (int i = 0; i < 4; i++) {
            b[i] = (byte) (fbit >> (24 - i * 8));
        }

        // 翻转数组
        int len = b.length;
        // 建立一个与源数组元素类型相同的数组
        byte[] dest = new byte[len];
        // 为了防止修改源数组，将源数组拷贝一份副本
        System.arraycopy(b, 0, dest, 0, len);
        byte temp;
        // 将顺位第i个与倒数第i个交换
        for (int i = 0; i < len / 2; ++i) {
            temp = dest[i];
            dest[i] = dest[len - i - 1];
            dest[len - i - 1] = temp;
        }
        return dest;
    }

    /**
     * 将byte[]转换为float
     * @param b byte数组
     * @return
     */
    public static float byte2float(byte[] b) {
        int l;
        l = b[0];
        l &= 0xff;
        l |= ((long) b[1] << 8);
        l &= 0xffff;
        l |= ((long) b[2] << 16);
        l &= 0xffffff;
        l |= ((long) b[3] << 24);
        return Float.intBitsToFloat(l);
    }

    /**
     * 判断String能否转int
     * @param str String
     * @return
     */
    public static boolean canParseInt(String str){
        if(str == null){ //验证是否为空
            return false;
        }
        return str.matches("\\d+"); //使用正则表达式判断该字符串是否为数字，第一个\是转义符，\d+表示匹配1个或 //多个连续数字，"+"和"*"类似，"*"表示0个或多个
    }

    /**
     * 将byte转换为一个长度为8的boolean数组（每bit代表一个boolean值）
     *
     * @param b byte
     * @return boolean数组
     */
    public static boolean[] getBooleanArray(byte b) {
        boolean[] array = new boolean[8];
        for (int i = 7; i >= 0; i--) { //对于byte的每bit进行判定
            array[i] = (b & 1) == 1;   //判定byte的最后一位是否为1，若为1，则是true；否则是false
            b = (byte) (b >> 1);       //将byte右移一位
        }
        return array;
    }

    /**
     * 将一个长度为8的boolean数组（每bit代表一个boolean值）转换为byte
     * 2014-7-4 下午5:28:28
     * @param array
     * @return
     *
     */
    public static byte getByte(boolean[] array) {
        if(array != null && array.length > 0) {
            byte b = 0;
            for(int i=0;i<=7;i++) {
                if(array[i]){
                    int nn=(1<<(7-i));
                    b += nn;
                }
            }
            return b;
        }
        return 0;
    }

    /**
     * 将int数值转换为占四个字节的byte数组，本方法适用于(低位在前，高位在后)的顺序。 和bytesToInt（）配套使用
     * @param value
     *            要转换的int值
     * @return byte数组
     */
    public static byte[] intToBytes( int value )
    {
        byte[] src = new byte[4];
        src[3] =  (byte) ((value>>24) & 0xFF);
        src[2] =  (byte) ((value>>16) & 0xFF);
        src[1] =  (byte) ((value>>8) & 0xFF);
        src[0] =  (byte) (value & 0xFF);
        return src;
    }

    /**
     * 将short数值转换为占两个字节的byte数组，本方法适用于(低位在前，高位在后)的顺序。
     * @param value
     *            要转换的int值
     * @return byte数组
     */
    public static byte[] shortToBytes( short value )
    {
        byte[] src = new byte[2];
        src[1] =  (byte) ((value>>8) & 0xFF);
        src[0] =  (byte) (value & 0xFF);
        return src;
    }


    /**
     * 将int数值转换为占四个字节的byte数组，本方法适用于(高位在前，低位在前)的顺序。 和bytesToInt（）配套使用
     * @param value
     *            要转换的int值
     * @return byte数组
     */
    public static byte[] intToBytesHightLow( int value )
    {
        byte[] src = new byte[4];
        src[0] =  (byte) ((value>>24) & 0xFF);
        src[1] =  (byte) ((value>>16) & 0xFF);
        src[2] =  (byte) ((value>>8) & 0xFF);
        src[3] =  (byte) (value & 0xFF);
        return src;
    }


    /**
     * byte数组转换为二进制字符串,每个字节以","隔开
     **/
    public static String conver2HexStr(byte[] b) {
        StringBuffer result = new StringBuffer();
        for (int i = 0; i < b.length; i++) {
            result.append(Long.toString(b[i] & 0xff, 2) + ",");
        }
        return result.toString().substring(0, result.length() - 1);
    }

}
