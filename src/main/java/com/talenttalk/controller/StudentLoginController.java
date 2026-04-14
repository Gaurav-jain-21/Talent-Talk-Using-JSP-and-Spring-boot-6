package com.talenttalk.controller;

import com.talenttalk.model.StudentDetailModel;
import com.talenttalk.service.JobApplicationService;
import com.talenttalk.service.StudentDashboardService;
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

	@Autowired
	private StudentDashboardService dashboardservice;

	@Autowired
	private JobApplicationService jobApplicationService;

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
			return "redirect:/studentDashboard";
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

	@GetMapping("/studentDashboard")
	public String showStudentDashboard(HttpSession session, Model model) {
		StudentDetailModel currentStudent = (StudentDetailModel) session.getAttribute("loggedInStudent");

		if (currentStudent == null) {
			return "redirect:/studentLogin";
		}

		// 1. Get existing name logic
		String studentName = dashboardservice.getStudentName(currentStudent);
		model.addAttribute("userName", studentName);

		// 2. Fetch counts from database
		long totalCompanies = dashboardservice.getTotalCompanies();
		long totalJobs = dashboardservice.getTotalJobs();
		long messageCount = dashboardservice.getMessageCountForStudent(currentStudent.getId());
		long appliedJobsCount = dashboardservice.getAppliedJobsCountForStudent(currentStudent.getId());
		int totalEarning = jobApplicationService.getTotalPaidAmountForStudent(currentStudent.getId());

		// 3. Add to model for JSP access
		model.addAttribute("companyCount", totalCompanies);
		model.addAttribute("jobCount", totalJobs);
		model.addAttribute("messageCount", messageCount);
		model.addAttribute("appliedJobsCount", appliedJobsCount);
		model.addAttribute("totalEarning", totalEarning);

		return "studentDashboard";
	}
}