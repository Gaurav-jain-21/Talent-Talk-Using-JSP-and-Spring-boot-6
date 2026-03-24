package com.talenttalk.service;

import com.talenttalk.model.StudentDetailModel;
import com.talenttalk.repo.StudentSignUpRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Optional;

@Service
public class StudentLoginService {

	@Autowired
	private StudentSignUpRepo repo;

	public StudentDetailModel authenticate(String email, String password) {
		// Find the student by email (assuming your repo has this method)
		// Note: You may need to add findByEmail to your Repository interface
		Optional<StudentDetailModel> studentOpt = repo.findByEmail(email);

		if (studentOpt.isPresent()) {
			StudentDetailModel student = studentOpt.get();
			// Compare the plain text password (use .equals, not ==)
			if (student.getPassword().equals(password)) {
				return student; // Authentication successful
			}
		}
		return null; // Authentication failed
	}
}