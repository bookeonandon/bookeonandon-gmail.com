package com.kh.common.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptWrapper extends HttpServletRequestWrapper {

	public EncryptWrapper(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String key) {
		
		
		String value = "";
		
		if(key.equals("memberPwd") || key.equals("newPwd") || key.equals("adminPwd")) {	// 효우씨 새로운 비번
			
			String realPwd = super.getParameter(key);
			System.out.println(realPwd);
			try {
				MessageDigest md = MessageDigest.getInstance("SHA-512");
				
				byte[] bytes = realPwd.getBytes(Charset.forName("utf-8"));
				
				md.update(bytes);
				
				value = Base64.getEncoder().encodeToString(md.digest());
				
				
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			
		}else {
			value = super.getParameter(key);
		}
		
		return value;
	}
}
