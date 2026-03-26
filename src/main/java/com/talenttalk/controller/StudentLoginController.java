package com.talenttalk.controller;

import com.talenttalk.model.StudentDetailModel;
import com.talenttalk.service.StudentLoginService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StudentLoginController {

	@Autowired
	private StudentLoginService loginservice;

	@PostMapping("/studentLoginForm")
	public String login(@RequestParam("email") String email,
						@RequestParam("password") String password,
						HttpSession session,
						Model model) {

		StudentDetailModel student = loginservice.authenticate(email, password);

		if (student != null) {
			// Pass the student's name to the dashboard
			model.addAttribute("userName", student.getFirstName());
			session.setAttribute("loggedInStudent", student);
			return "studentDashboard";
		} else {
			model.addAttribute("error", "Invalid email or password");
			return "studentLoginPage";
		}
	}

	// This handles the link from your Register page
	@GetMapping("/studentLogin")
	public String showLoginPage() {
		return "studentLoginPage";
	}

	@GetMapping("/studentSignup")
	public String goToSignUpStd(){
		return "studentSignup";
	}
}