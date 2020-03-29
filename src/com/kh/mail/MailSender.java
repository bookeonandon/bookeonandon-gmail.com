package com.kh.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailSender extends Authenticator{

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("bookeonandon@gmail.com", "rnehrrhkwhgdkdy");
	}
}
