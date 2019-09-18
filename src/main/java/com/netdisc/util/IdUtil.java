package com.netdisc.util;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Random;
import java.util.UUID;



/**
 * Id生成
 * @author Stodger
 * @date 2019年8月28日
 * @version
 */
public class IdUtil {

    private static final String USERNAME_PREFIX = "user_";

    /**
     * 用户Id
     * @return
     */
    public static String getId(){
        Random random = new Random();
        String str = UUID.randomUUID().toString().replaceAll("-", "");
        int start = random.nextInt(str.length() / 2);
        return USERNAME_PREFIX + str.substring(start, start + 8);
    }
}
