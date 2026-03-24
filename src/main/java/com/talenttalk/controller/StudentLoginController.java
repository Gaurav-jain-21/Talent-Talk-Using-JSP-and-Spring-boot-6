package com.talenttalk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller; // Use this for JSP
import org.springframework.ui.Model; // Correct Model import
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.talenttalk.service.StudentLoginService;

@Controller // 1. Changed from @RestController to @Controller
public class StudentLoginController {

	@Autowired
	private StudentLoginService loginservice;

	@PostMapping("/studentLogin")
	public String login(@RequestParam("email") String email,
						@RequestParam("password") String password,
						Model model) { // 2. Use org.springframework.ui.Model

		boolean isValid = loginservice.authenticate(email, password);

		if(isValid) {
			// Pass the email to the dashboard to personalize the "Welcome" message
			model.addAttribute("userEmail", email);
			return "studentDashboard"; // This looks for studentDashboard.jsp
		}
		else {
			model.addAttribute("error", "Invalid email or password");
			return "studentLogin"; // Returns to the login page
		}
	}
}