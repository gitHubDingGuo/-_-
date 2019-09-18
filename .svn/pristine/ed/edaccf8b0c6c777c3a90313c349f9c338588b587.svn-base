package com.netdisc.util;

/**
 * 随机数
 * @author Stodger
 * @date 2019年8月6日
 * @version
 */
public class RandomNumberUtil {
	
	/**
	 * 生成随机六位数
	 * @return
	 */
	public static int code() {
		StringBuffer stringBuffer=new StringBuffer();
        for (int x=0;x<=5;x++) {
            int random = (int) (Math.random() * (10 - 1));
            stringBuffer.append(random);
        }
        String string = stringBuffer.toString();
        return Integer.valueOf(string);
	}
}
