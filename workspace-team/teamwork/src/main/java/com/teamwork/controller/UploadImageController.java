package com.teamwork.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.teamwork.common.utils.RandomUtils;
import com.teamwork.common.utils.StringUtils;


/**
 * 上传图片的controller
 * @author liuyazhuang
 *
 */
@Controller
@RequestMapping(value="/resource/upload")
public class UploadImageController {
	
	@Value("${uploading.url}")
	private String UPLOADING_URL;
	
	@Value("${visit.url}")
	private String VISIT_URL;
	
	
	/**
	 * 上传图片
	 * @param file
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/images")
	public Map<String, Object> images (MultipartFile upfile, HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> params = new HashMap<String, Object>();
		try{
			 String basePath = UPLOADING_URL;
			 String visitUrl = VISIT_URL;
			 if(basePath == null || "".equals(basePath)){
				 basePath = "/var/tmp/upload";  
			 }
			 if(visitUrl == null || "".equals(visitUrl)){
				 visitUrl = "/upload/"; 
			 }
			 String ext = StringUtils.getExt(upfile.getOriginalFilename());
			 String fileName = String.valueOf(System.currentTimeMillis()).concat("_").concat(RandomUtils.getRandom(6)).concat(".").concat(ext);
			 
			 StringBuilder savePath = new StringBuilder();
			 savePath.append(basePath).append("/").append(fileName);
			 visitUrl = visitUrl.concat(fileName);
			 
			 System.out.println("basePath:" + basePath + ";visitUrl:" + visitUrl);
			 System.out.println("ext:" + ext + ";fileName:" + fileName);
			 System.out.println("savePath:" + savePath.toString());
			 
			 File fdest = new File(savePath.toString());
			 if(!fdest.exists()){
				 fdest.getParentFile().mkdirs();
			 }
			 /*OutputStream out = new FileOutputStream(fdest);
			 FileCopyUtils.copy(upfile.getInputStream(), out);*/			 
			 upfile.transferTo(fdest);
			 
			 params.put("state", "SUCCESS");
			 params.put("url", visitUrl);
			 params.put("size", upfile.getSize());
			 params.put("original", fileName);
			 params.put("type", upfile.getContentType());
		} catch (Exception e){
			 params.put("state", "ERROR");
		}
		 return params;
	}
	
}
