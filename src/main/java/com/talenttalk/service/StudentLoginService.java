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

		Optional<StudentDetailModel> studentOpt = repo.findByEmail(email);

		if (studentOpt.isPresent()) {
			StudentDetailModel student = studentOpt.get();

			if (student.getPassword().equals(password)) {
				return student;
			}
		}
		return null;
	}
}