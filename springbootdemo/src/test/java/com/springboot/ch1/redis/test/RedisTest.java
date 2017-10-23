package com.springboot.ch1.redis.test;

import redis.clients.jedis.Jedis;

/**
 * Created by vp on 2017/7/7.
 */
public class RedisTest {
    public static void main(String[] args) {
        Jedis jedis = new Jedis("192.168.2.128");
//        System.out.println(jedis.ping());

        // String
        jedis.set("test", "localhost connection success");
        jedis.set("key-1", "String1");
        jedis.del("test");
//        jedis.

        System.out.println(jedis.get("test"));
    }
}
