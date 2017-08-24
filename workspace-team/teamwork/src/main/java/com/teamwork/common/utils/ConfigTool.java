package com.teamwork.common.utils;

import org.springframework.beans.factory.InitializingBean;

public class ConfigTool implements InitializingBean{
	private static String imageSavePath;
	/**获取图片请求action*/
	public static final String imageAction = "image";

	public static String getImageSavePath() {
		return imageSavePath;
	}

	public void setImageSavePath(String imageSavePath) {
		ConfigTool.imageSavePath = imageSavePath;
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		//初始化要做的事情
	}
	
}
