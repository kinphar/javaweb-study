package com.teamwork.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.teamwork.common.pojo.Project;
import com.teamwork.common.utils.ExcelUtil;

@Controller
@RequestMapping("/task")
public class ExportController {
    @RequestMapping(value="task_export")
    public String download(HttpServletRequest request,HttpServletResponse response) throws IOException{
        String fileName="excel文件";
        //填充projects数据
        List<Project> projects=createData();
        List<Map<String,Object>> list=createExcelRecord(projects);
        String columnNames[]={"ID","项目名","销售人","负责人","所用技术","备注"};//列名
        String keys[]    =     {"id","name","saler","principal","technology","remarks"};//map中的key
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        try {
            ExcelUtil.createWorkBook(list,keys,columnNames).write(os);
        } catch (IOException e) {
            e.printStackTrace();
        }
        byte[] content = os.toByteArray();
        InputStream is = new ByteArrayInputStream(content);
        // 设置response参数，可以打开下载页面
        response.reset();
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        response.setHeader("Content-Disposition", "attachment;filename="+ new String((fileName + ".xls").getBytes(), "iso-8859-1"));
        ServletOutputStream out = response.getOutputStream();
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        try {
            bis = new BufferedInputStream(is);
            bos = new BufferedOutputStream(out);
            byte[] buff = new byte[2048];
            int bytesRead;
            // Simple read/write loop.
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        } catch (final IOException e) {
            throw e;
        } finally {
            if (bis != null)
                bis.close();
            if (bos != null)
                bos.close();
        }
        return null;
    }
    private List<Project> createData() {
    	List<Project> list = new ArrayList<Project>();
    	Project p1 = new Project();
    	p1.setId(100);
    	p1.setName("dqf");
    	p1.setTechnology("java");
    	p1.setRemarks("nothing");
    	Project p2 = new Project();
    	p2.setId(101);
    	p2.setName("lst");
    	p2.setTechnology("c#");
    	p2.setRemarks("nothing");
    	list.add(p1);
    	list.add(p2);
        return list;
    }
    
    private List<Map<String, Object>> createExcelRecord(List<Project> projects) {
        List<Map<String, Object>> listmap = new ArrayList<Map<String, Object>>();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("sheetName", "sheet1");
        listmap.add(map);
        Project project=null;
        for (int j = 0; j < projects.size(); j++) {
            project=projects.get(j);
            Map<String, Object> mapValue = new HashMap<String, Object>();
            mapValue.put("id", project.getId());
            mapValue.put("name", project.getName());
            mapValue.put("technology", project.getTechnology());
            mapValue.put("remarks", project.getRemarks());
            listmap.add(mapValue);
        }
        return listmap;
    }
}
