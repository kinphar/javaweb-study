package com.teamwork.service;

import com.teamwork.common.pojo.EmailContent;

public interface EmailService {

	public boolean sendEmail(EmailContent mail);

}
