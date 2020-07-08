package com.ruoyi.system.util;
/**
 * 阿拉伯转化为大写
 * @author bida
 * @version 2017-2-24
 */
public class NumberToChinese {
	private final static String[] a_strNumber = { "〇", "一", "二", "三", "四",
			"五", "六", "七", "八", "九" };
	private final static String[] a_strModify = { "", "十", "百", "千", "万",
			"十", "百", "千", "亿", "十", "百", "千" };

	private final static String strSign = "负 ";// 实际上”+“号永远都不可能出现.

	private final static String strDot = "点 ";

	/**
	 * 功能： 提取符号位. 说明： 如果输入参数是 "-13.3 ",调用该函数的返回值是 "负 "; 如果输入参数是 "13.3 ",
	 * 调用该函数的返回值是 " "(空值).
	 * 
	 * @param pValue
	 * 
	 */
	static private String getSign(String pValue) {
		return pValue.indexOf("-") == 0 ? "负 " : "";
	}

	/**
	 * 功能：返回小数部分的汉字 说明：如果输入数据是 12.35,调用该函数返回值是 三五
	 * 
	 * @param pValue
	 * @return
	 */
	static private String getFraction(String pValue) {
		String strFraction = null;// 用来保存小数部分的数字串
		int intDotPos = pValue.indexOf(".");
		if (intDotPos == -1)// 没有小数部分.
			return "";
		strFraction = pValue.substring(intDotPos + 1).trim();
		StringBuffer sbResult = new StringBuffer(strFraction.length());
		// 开始翻译.
		for (int i = 0; i < strFraction.length(); i++)
			sbResult.append(a_strNumber[Integer.parseInt(String.valueOf(strFraction.charAt(i)))]);
		return sbResult.toString();
	}
	/**
	 * 功能： 返回整数部分的汉字. 如果输入参数是: 234.3,调用该函数的返回值是 二百三十四.
	 * @param pValue
	 * @return
	 */
	static private String getInteger(String pValue) {
		String strInteger = null;// 用来保存整数部分数字串
		int intDotPos = pValue.indexOf(".");// 记录 ". "所在位置
		int intSignPos = pValue.indexOf("-");
		if (intDotPos == -1)
			intDotPos = pValue.length();

		strInteger = pValue.substring(intSignPos + 1, intDotPos);// 取出整数部分

		// 反转整数部分数据
		strInteger = new StringBuffer(strInteger).reverse().toString().trim();
		// -----------------------------------------------------------
		// 开始翻译：
		StringBuffer sbResult = new StringBuffer();
		for (int i = 0; i < strInteger.length(); i++) {
			sbResult.append(a_strModify[i]);
//			System.out.println(String.valueOf(strInteger.charAt(i)));
//			System.out.println(a_strNumber[Integer.parseInt(String.valueOf(strInteger.charAt(i)))]);
			sbResult.append(a_strNumber[Integer.parseInt(String.valueOf(strInteger.charAt(i)))]);
//			System.out.println(a_strNumber[strInteger.charAt(i) - 48]);
//			sbResult.append(a_strNumber[strInteger.charAt(i) - 48]);
		}
		
		sbResult = sbResult.reverse();
		// 这个时候得到的结果不标准，需要调整.
		// 203返回值是 二百〇十三个 正确答案是 二百〇三
		// --------------------------------------------------------------------------
		// 串调整.
		replace(sbResult, "十〇", "十");
		replace(sbResult, "一十", "十");
		replace(sbResult, "〇十", "〇");
		replace(sbResult, "〇百", "〇");
		replace(sbResult, "〇千", "〇");
		replace(sbResult, "〇万", "万 ");
		replace(sbResult, "〇亿", "亿 ");
		
//		replace(sbResult, "〇十 ", "〇 ");
//		replace(sbResult, "〇百 ", "〇 ");
//		replace(sbResult, "〇千 ", "〇 ");
//		replace(sbResult, "〇万 ", "万 ");
//		replace(sbResult, "〇亿 ", "亿 ");
		// 多个”〇“调整处理
		replace(sbResult, "〇〇", "〇");
		replace(sbResult, "〇〇〇 ", "〇 ");
		replace(sbResult, "〇〇〇〇万 ", "");// 这两句不能颠倒顺序
		replace(sbResult, "〇〇〇〇 ", "");

		replace(sbResult, "一十亿 ", "十亿 ");// 这样读起来更习惯.
		replace(sbResult, "一十万 ", "十万 ");

		// --------------------------------------------------------------------------

		if (sbResult.charAt(sbResult.length() - 1) == '〇'
				&& sbResult.length() != 1)// 删除个位上的〇
			sbResult.deleteCharAt(sbResult.length() - 1);

		if (strInteger.length() == 2) {
			replace(sbResult, "一十 ", "十 ");
		}

		return sbResult.toString();// 将结果反转回来.
	}

	/**
	 * 功能： 返回分割符号 如果参数是 "12.3 " 调用该函数的返回值是 "点 " 如果参数是 "12 " 调用该函数的返回值是 " "(空值)
	 * 
	 * @param pValue
	 * @return
	 */
	static private String getDot(String pValue) {
		return pValue.indexOf(".") != -1 ? "点" : "";
	}

	// 数字到汉字
	static public String numToChinese(double pValue) {
		// 注意：不能用string.valueOf(pValue)处理,你自己试试就知道了.
		java.text.DecimalFormat df = new java.text.DecimalFormat("#.######### ");
		String pTemp = String.valueOf(df.format(pValue));
		StringBuffer sbResult = new StringBuffer(getSign(pTemp)
				+ getInteger(pTemp) + getDot(pTemp) + getFraction(pTemp));
		return sbResult.toString();

	}

	/**
	 * 功能：用给定字符串pDest替换字符串pValue中的pSource
	 * 
	 * @param pValue
	 * @param pSource
	 * @param pDest
	 * @return 经过替换处理的字符串 例：pValue= xy ,pSource =x ,pDest = 测试 调用改函数后pValue =测试y
	 * 
	 *         说明一下： 如果 pvalue= xxx pSource = xx 处理结果是 x
	 *         ，这个结果可能与您平时看到的替换函数有点不一样，通常应该是 pSource =xx.
	 * 
	 */
	static private void replace(StringBuffer pValue, String pSource,
			String pDest) {
		if (pValue == null || pSource == null || pDest == null)
			return;

		int intPos = 0;// 记录pSource在pValue中的位置
		do {
			// ---------------------------------------------------
			// intPos = pValue.toString().indexOf(pSource,intPos);
			// ---------------------------------------------------

			// ============================================
			intPos = pValue.toString().indexOf(pSource);
			// ============================================
			if (intPos == -1)// 没有找到pSource.
				break;
			pValue.delete(intPos, intPos + pSource.length());
			pValue.insert(intPos, pDest);

			// ---------------------------------
			// intPos += pSource.length();
			// ---------------------------------
		} while (true);
	}

	// 现在发现这样的处理没有什么实际意义。所以我就不写了.
	public String ChineseToNumber(String pValue) {
		return null;
	}

	public static void main(String[] args) {
		// 为了方便您看程序运行结果，我将所有方法都设置成静态的

		// 测试：
		
		System.err.println(0.34);
		System.err.println(numToChinese(0.34));
		
		System.err.println(10);
		System.err.println(numToChinese(10));
		
		System.err.println(100);
		System.err.println(numToChinese(100));

		System.err.println(12);
		System.err.println(numToChinese(12));
//
		System.err.println(102);
		System.err.println(numToChinese(102));
//
		System.err.println(1022);
		System.err.println(numToChinese(1022));
//
		System.err.println(10009);
		System.err.println(numToChinese(10009));

		System.err.println(100000);
		System.err.println(numToChinese(100000));

		System.err.println(1000008);
		System.err.println(numToChinese(1000008));

		System.err.println(10000080);
		System.err.println(numToChinese(10000080));

		System.err.println(1000020300);
		System.err.println(numToChinese(1000020300));



		System.err.println(10.34);
		System.err.println(numToChinese(10.34));

		System.err.println(101.34);
		System.err.println(numToChinese(101.34));

		System.err.println(-101.34);
		System.err.println(numToChinese(-101.34));

		System.err.println(-100100010.33);
		System.err.println(numToChinese(-100100010.33));

	}
}
