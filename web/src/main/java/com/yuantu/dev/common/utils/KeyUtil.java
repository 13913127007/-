package com.yuantu.dev.common.utils;

import java.util.Random;

/**
 * Created by SqMax on 2018/3/18.
 */
public class KeyUtil {

    /**
     * 生成唯一的主键
     * 格式：时间+随机数
     *
     * @return
     */
    public static synchronized Integer genUniqueKey() {
        Random random = new Random();
        Integer number = random.nextInt(900000) + 100000;

        return number;
        //return System.currentTimeMillis()+String.valueOf(number);
    }
}
