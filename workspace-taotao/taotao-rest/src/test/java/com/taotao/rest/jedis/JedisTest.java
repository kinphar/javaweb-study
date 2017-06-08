package com.taotao.rest.jedis;

import org.junit.Test;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

public class JedisTest {
	
	@Test
	public void testJedisSingle() {		
		Jedis jedis = new Jedis("192.168.249.132", 6379);
		jedis.set("key1", "jedis test");
		String string = jedis.get("key1");
		System.out.print(string);
		jedis.close();
	}
	
	@Test
	public void testJedisPool() {
		JedisPool pool = new JedisPool("192.168.249.132", 6379);
		Jedis jedis = pool.getResource();
		String string = jedis.get("key1");
		System.out.print(string);
		jedis.close();
		pool.close();
	}

}
