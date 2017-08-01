package com.teamwork.common.utils;

public class TimeUtils {
	
	/*
	 * 当调用TimeStampToDate("1252639886", "yyyy-MM-dd HH:mm:ss");
		返回值：2009-11-09 11:31:26
	 */
	public static String timeStamp2Date(String timestampString, String formats){    
		Long timestamp = Long.parseLong(timestampString) * 1000;    
		String date = new java.text.SimpleDateFormat(formats).format(new java.util.Date(timestamp));    
		return date;    
	}  
}
