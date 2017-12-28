package com.teamwork.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.teamwork.common.utils.RandomUtils;
import com.teamwork.common.utils.StringUtils;

/**
 * 上传图片的controller
 * 
 * @author liuyazhuang
 *
 */
@Controller
@RequestMapping(value = "/resource/upload")
public class UploadFilesController {

	@Value("${uploading.url}")
	private String UPLOADING_URL;

	@Value("${visit.url}")
	private String VISIT_URL;

	/**
	 * 上传图片
	 * 
	 * @param file
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/images")
	public Map<String, Object> uploadImages(MultipartFile upfile, HttpServletRequest request,
			HttpServletResponse response) {
		Map<String, Object> params = new HashMap<String, Object>();
		try {
			String basePath = getUploadBasePath();
			String visitUrl = getVisitBaseUrl();

			String ext = StringUtils.getExt(upfile.getOriginalFilename());
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			String date = df.format(new Date());
			String fileName = String.valueOf(System.currentTimeMillis()).concat("_").concat(RandomUtils.getRandom(6))
					.concat(".").concat(ext);

			StringBuilder savePath = new StringBuilder();
			savePath.append(basePath).append("/images/").append(date).append("/").append(fileName);
			visitUrl = visitUrl.concat("/images/").concat(date).concat("/").concat(fileName);

			File fdest = new File(savePath.toString());
			if (!fdest.exists()) {
				fdest.getParentFile().mkdirs();
			}
			upfile.transferTo(fdest);

			params.put("state", "SUCCESS");
			params.put("url", visitUrl);
			params.put("size", upfile.getSize());
			params.put("original", fileName);
			params.put("type", upfile.getContentType());
		} catch (Exception e) {
			params.put("state", "ERROR");
		}
		return params;
	}

	/**
	 * 上传文件
	 * 
	 * @param file
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/file")
	public Map<String, Object> uploadFile(MultipartFile upfile, HttpServletRequest request,
			HttpServletResponse response) {
		Map<String, Object> params = new HashMap<String, Object>();
		try {
			String basePath = getUploadBasePath();
			String visitUrl = getVisitBaseUrl();

			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd/HHmmss");
			String time = df.format(new Date());
			String fileName = upfile.getOriginalFilename();

			StringBuilder savePath = new StringBuilder();
			savePath.append(basePath).append("/files/").append(time).append("/").append(fileName);
			visitUrl = visitUrl.concat("/files/").concat(time).concat("/").concat(fileName);

			File fdest = new File(savePath.toString());
			if (!fdest.exists()) {
				fdest.getParentFile().mkdirs();
			}
			upfile.transferTo(fdest);

			params.put("state", "SUCCESS");
			params.put("url", visitUrl);
			params.put("size", upfile.getSize());
			params.put("original", fileName);
			params.put("type", upfile.getContentType());
		} catch (Exception e) {
			params.put("state", "ERROR");
		}
		return params;
	}

	/*
	 * Current for markdown editor.
	 */
	@RequestMapping(value = "/mdfile", method = RequestMethod.POST)
	public void hello(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "editormd-image-file", required = false) MultipartFile attach) {
		try {
			request.setCharacterEncoding("utf-8");
			response.setHeader("Content-Type", "text/html");

			String basePath = getUploadBasePath();
			String visitUrl = getVisitBaseUrl();

			String ext = StringUtils.getExt(attach.getOriginalFilename());
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			String date = df.format(new Date());
			String fileName = String.valueOf(System.currentTimeMillis()).concat("_").concat(RandomUtils.getRandom(6))
					.concat(".").concat(ext);

			StringBuilder savePath = new StringBuilder();
			savePath.append(basePath).append("/images/").append(date).append("/").append(fileName);
			visitUrl = visitUrl.concat("/images/").concat(date).concat("/").concat(fileName);

			File fdest = new File(savePath.toString());
			if (!fdest.exists()) {
				fdest.getParentFile().mkdirs();
			}
			attach.transferTo(fdest);

			// 下面response返回的json格式是editor.md所限制的，规范输出就OK
			response.getWriter().write("{\"success\": 1, \"message\":\"上传成功\",\"url\":\"" + visitUrl + "\"}");
		} catch (Exception e) {
			try {
				response.getWriter().write("{\"success\":0}");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}

	private String getUploadBasePath() {
		String basePath = UPLOADING_URL;
		if (basePath == null || "".equals(basePath)) {
			basePath = "/var/tmp/upload";
		}
		return basePath;
	}

	private String getVisitBaseUrl() {
		String vUrl = VISIT_URL;
		if (vUrl == null || "".equals(vUrl)) {
			vUrl = "/upload/";
		}
		return vUrl;
	}

}
