package com.teamwork.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.teamwork.common.pojo.EmailContent;
import com.teamwork.service.EmailService;

@Service
public class EmailServiceImpl implements EmailService {
	
	@Resource
    private JavaMailSender javaMailSender;
    
    @Value("${mail.from}")
	private String MAIL_FROM;

	@Override
	public boolean sendEmail(EmailContent mail) {
		//建立邮件消息
        MimeMessage message = javaMailSender.createMimeMessage();        
        MimeMessageHelper messageHelper;
        
        try {
            messageHelper = new MimeMessageHelper(message, true, "UTF-8");
            
            // 设置发件人邮箱
            if (MAIL_FROM != null) {
                messageHelper.setFrom(MAIL_FROM);
            } 
            
            // 设置收件人邮箱
            if (mail.getToEmails()!=null) {
                String[] toEmailArray = mail.getToEmails().split(";");
                List<String> toEmailList = new ArrayList<String>();
                if (null == toEmailArray || toEmailArray.length <= 0) {
                	throw new RuntimeException("收件人邮箱不得为空！");
                } else {
                    for (String s : toEmailArray) {
                        if (s!=null&&!s.equals("")) {
                            toEmailList.add(s);
                        }
                    }
                    if (null == toEmailList || toEmailList.size() <= 0) {
                        //throw new SimpleException("收件人邮箱不得为空！");
                    } else {
                        toEmailArray = new String[toEmailList.size()];
                        for (int i = 0; i < toEmailList.size(); i++) {
                            toEmailArray[i] = toEmailList.get(i);
                        }
                    }
                }
                messageHelper.setTo(toEmailArray);
            } 
            
            // 邮件主题
            if (mail.getSubject()!=null) {
                messageHelper.setSubject(mail.getSubject());
            } 
            
            // true 表示启动HTML格式的邮件
            messageHelper.setText(mail.getContent(), true);
            
            // 添加图片
            if (null != mail.getPictures()) {
                for (Iterator<Map.Entry<String, String>> it = mail.getPictures().entrySet()
                        .iterator(); it.hasNext();) {
                    Map.Entry<String, String> entry = it.next();
                    String cid = entry.getKey();
                    String filePath = entry.getValue();
                    if (null == cid || null == filePath) {
                        throw new RuntimeException("请确认每张图片的ID和图片地址是否齐全！");
                    }
                    
                    File file = new File(filePath);
                    if (!file.exists()) {
                        throw new RuntimeException("图片" + filePath + "不存在！");
                    }
                    
                    FileSystemResource img = new FileSystemResource(file);
                    messageHelper.addInline(cid, img);
                }
            }
            
            // 添加附件
            if (null != mail.getAttachments()) {
                for (Iterator<Map.Entry<String, String>> it = mail.getAttachments()
                        .entrySet().iterator(); it.hasNext();) {
                    Map.Entry<String, String> entry = it.next();
                    String cid = entry.getKey();
                    String filePath = entry.getValue();
                    if (null == cid || null == filePath) {
                        throw new RuntimeException("请确认每个附件的ID和地址是否齐全！");
                    }
                    
                    File file = new File(filePath);
                    if (!file.exists()) {
                        throw new RuntimeException("附件" + filePath + "不存在！");
                    }
                    
                    FileSystemResource fileResource = new FileSystemResource(file);
                    messageHelper.addAttachment(cid, fileResource);
                }
            }
            messageHelper.setSentDate(new Date());
            javaMailSender.send(message);
            
        } catch (MessagingException e) {            
            e.printStackTrace();
        }
        return true;
    }

}
