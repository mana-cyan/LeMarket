package com.lemarket.service.utils;

public class SaltFactory {
    /**
     * 使用默认的轮数，生成Salt
     *
     * @return salt
     */
    public static String genSalt() {
        return BCrypt.gensalt();
    }

    /**
     * 使用指定的轮数，生成Salt，轮数与函数的运行时间有关，一般采用默认参数即可
     *
     * @param round 轮数
     * @return salt
     */
    public static String genSalt(int round) {
        return BCrypt.gensalt(round);
    }
}
