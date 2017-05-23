package com.taotao.controller;

import java.io.File;
import java.io.FileInputStream;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.junit.Test;

import com.taotao.common.utils.FtpUtil;

public class FTPTest {

	@Test
	public void testFtpClient() throws Exception {
		FTPClient ftpClient = new FTPClient();
		ftpClient.connect("192.168.249.132", 21);
		ftpClient.login("ftpuser", "115513875");
		
		FileInputStream inputStream = new FileInputStream(
				new File("D:\\dianlu.jpg"));
		ftpClient.changeWorkingDirectory("/home/ftpuser/www/images");
		ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
		ftpClient.storeFile("dianlu123.jpg", inputStream);
		ftpClient.logout();
	}
	
	@Test
	public void testFtpUtils() throws Exception {
		FileInputStream inputStream = new FileInputStream(
				new File("D:\\dianlu.jpg"));
		FtpUtil.uploadFile("192.168.249.132", 21, "ftpuser", "115513875", 
				"/home/ftpuser/www/images", "/2017/05/23", 
				"hello.jpg", inputStream);
	}
}
