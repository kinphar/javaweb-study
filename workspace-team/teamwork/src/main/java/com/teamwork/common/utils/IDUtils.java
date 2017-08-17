package com.teamwork.common.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * 各种id生成策略
 * <p>Title: IDUtils</p>
 * <p>Description: </p>

 * @version 1.0
 */

public class IDUtils {

	/**
	 * 图片名生成
	 */
	public static String genImageName() {
		//取当前时间的长整形�?�包含毫�?
		long millis = System.currentTimeMillis();
		//long millis = System.nanoTime();
		//加上三位随机数
		Random random = new Random();
		int end3 = random.nextInt(999);
		//如果不足三位前面补0
		String str = millis + String.format("%03d", end3);
		
		return str;
	}
	
	/**
	 * 商品id生成
	 */
	public static long genItemId() {
		//取当前时间的长整形值包含毫秒
		long millis = System.currentTimeMillis();
		//long millis = System.nanoTime();
		//加上两位随机数
		Random random = new Random();
		int end2 = random.nextInt(99);
		//如果不足两位前面补0
		System.out.println(millis);
		String str = millis + String.format("%02d", end2);
		long id = new Long(str);
		return id;
	}
	
	/**
	 * 任务检查项ID生成： 秒数 + 2个随机数
	 */
	public static long getCheckListId() {
		long sec = System.currentTimeMillis() / 1000;
		Random random = new Random();
		int ran2 = random.nextInt(99);
		return sec * 100 + ran2;
	}
	
	/**
	 * 任务ID生成 
	 */
	public static String genTaskId() {
		SimpleDateFormat df = new SimpleDateFormat("yyMMddHHmmss");
		String preTaskId = "T" + df.format(new Date()) + "";
		Random random = new Random();
		int end3 = random.nextInt(99);
		return preTaskId + String.format("%02d", end3);		
	}
	
	public static void main(String[] args) {
		for(int i = 0; i < 100; i++)
			System.out.println(genTaskId());
			//System.out.println(genItemId());
	}
}
