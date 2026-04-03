package com.talenttalk.controller;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.repo.CompanyRegisterRepo;
import com.talenttalk.service.EmailService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.UUID;

@Controller
public class CompanyPasswordController {

	@Autowired
	private CompanyRegisterRepo companyRepo;

	@Autowired
	private EmailService emailService;

	@PostMapping("/companyForgotPassword")
	public String processCompanyForgotPassword(@RequestParam("email") String email,
											   HttpServletRequest request,
											   RedirectAttributes ra) {
		CompanyDetailModel company = companyRepo.findByEmail(email);

		if (company == null) {
			ra.addFlashAttribute("errorMsg", "Email not found.");
			return "redirect:/companyForgotPassword";
		}

		String token = UUID.randomUUID().toString();
		company.setResetToken(token);
		companyRepo.save(company);

		String resetLink = request.getScheme() + "://" + request.getServerName() + ":"
				+ request.getServerPort() + request.getContextPath() + "/resetCompanyPassword?token=" + token;

		emailService.sendResetEmail(email, resetLink);
		ra.addFlashAttribute("successMsg", "Reset link sent to your email!");
		return "redirect:/companyForgotPassword";
	}

	@GetMapping("/resetCompanyPassword")
	public String showCompanyResetForm(@RequestParam("token") String token,
									   RedirectAttributes ra,
									   Model model) {
		CompanyDetailModel company = companyRepo.findByResetToken(token);

		if (company == null) {
			ra.addFlashAttribute("errorMsg", "Invalid or expired reset link.");
			return "redirect:/companyForgotPassword";
		}

		model.addAttribute("token", token);
		return "resetCompanyPassword";
	}

	@PostMapping("/updateCompanyPassword")
	public String updateCompanyPassword(@RequestParam("token") String token,
										@RequestParam("password") String password,
										RedirectAttributes ra) {
		CompanyDetailModel company = companyRepo.findByResetToken(token);

		if (company == null) {
			ra.addFlashAttribute("errorMsg", "Invalid or expired reset link.");
			return "redirect:/companyForgotPassword";
		}

		company.setPassword(password);
		company.setResetToken(null);
		companyRepo.save(company);

		ra.addFlashAttribute("successMsg", "Password updated successfully. Please login again.");
		return "redirect:/companyLogin";
	}
}
