package com.taotao.common.utils;

import java.util.Random;

/**
 * 各种id生成策略
 * <p>Title: IDUtils</p>
 * <p>Description: </p>
 * <p>Company: www.itcast.com</p> 
 * @author	入云�?
 * @date	2015�?7�?22日下�?2:32:10
 * @version 1.0
 */
public class IDUtils {

	/**
	 * 图片名生�?
	 */
	public static String genImageName() {
		//取当前时间的长整形�?�包含毫�?
		long millis = System.currentTimeMillis();
		//long millis = System.nanoTime();
		//加上三位随机�?
		Random random = new Random();
		int end3 = random.nextInt(999);
		//如果不足三位前面�?0
		String str = millis + String.format("%03d", end3);
		
		return str;
	}
	
	/**
	 * 商品id生成
	 */
	public static long genItemId() {
		//取当前时间的长整形�?�包含毫�?
		long millis = System.currentTimeMillis();
		//long millis = System.nanoTime();
		//加上两位随机�?
		Random random = new Random();
		int end2 = random.nextInt(99);
		//如果不足两位前面�?0
		String str = millis + String.format("%02d", end2);
		long id = new Long(str);
		return id;
	}
	
	public static void main(String[] args) {
		for(int i=0;i< 100;i++)
		System.out.println(genItemId());
	}
}
