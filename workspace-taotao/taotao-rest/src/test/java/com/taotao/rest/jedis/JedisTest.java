package com.taotao.rest.jedis;

import java.util.HashSet;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import redis.clients.jedis.HostAndPort;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisCluster;
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
	
	@Test
	public void testJedisCluster() {
		HashSet<HostAndPort> nodes = new HashSet<>();
		nodes.add(new HostAndPort("192.168.249.132", 7001));
		nodes.add(new HostAndPort("192.168.249.132", 7002));
		nodes.add(new HostAndPort("192.168.249.132", 7003));
		nodes.add(new HostAndPort("192.168.249.132", 7004));
		nodes.add(new HostAndPort("192.168.249.132", 7005));
		nodes.add(new HostAndPort("192.168.249.132", 7006));
		JedisCluster cluster = new JedisCluster(nodes);
		cluster.set("key1", "1001");
		String string = cluster.get("key1");
		System.out.println(string);
		
		cluster.close();
	}
	
	@Test
	public void testSpringJedisSingle() {
		ApplicationContext applicationContext = 
				new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
		JedisPool pool = (JedisPool) applicationContext.getBean("redisClient");
		Jedis jedis = pool.getResource();
		String string = jedis.get("key1");
		System.out.print(string);
		jedis.close();
		pool.close();		
	}
	
	@Test
	public void testSpringJedisCluster() {
		ApplicationContext applicationContext = 
				new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
		JedisCluster jedisCluster = (JedisCluster) applicationContext.getBean("redisClient");
		String string = jedisCluster.get("key1");
		System.out.println(string);
		jedisCluster.close();
	}
}
