package com.talenttalk.service;

import org.springframework.stereotype.Service;

@Service
public class StudentLoginService {
	private final String student_email="student@gmail.com";
	private final String student_pass="12345";
	public boolean authenticate(String email, String password) {
		if(email!=null && password!=null) {
			return email.equals(student_email) && password.equals(student_pass);
		}
		return false;
	}

}
