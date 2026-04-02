package com.talenttalk.controller;

import com.talenttalk.model.StudentDetailModel;
import com.talenttalk.repo.StudentSignUpRepo;
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
public class ForgotPasswordController {

    @Autowired
    private StudentSignUpRepo studentRepo;

    @Autowired
    private EmailService emailService;

    @PostMapping("/forgotPassword")
    public String processRequest(@RequestParam("email") String email, HttpServletRequest request, RedirectAttributes ra) {
        StudentDetailModel student = studentRepo.findByEmail(email).orElse(null); // Ensure findByEmail is in your Repo

        if (student != null) {
            String token = UUID.randomUUID().toString();
            student.setResetToken(token);
            studentRepo.save(student);

            String resetLink = request.getScheme() + "://" + request.getServerName() + ":"
                    + request.getServerPort() + request.getContextPath() + "/resetPassword?token=" + token;

            emailService.sendResetEmail(email, resetLink);
            ra.addFlashAttribute("successMsg", "Reset link sent to your email!");
        } else {
            ra.addFlashAttribute("errorMsg", "Email not found.");
        }
        return "redirect:/forgotPassword";
    }

    @GetMapping("/resetPassword")
    public String showResetForm(@RequestParam("token") String token, Model model) {
        StudentDetailModel student = studentRepo.findByResetToken(token).orElse(null);
        if (student == null) {
            return "redirect:/forgotPassword";
        }

        model.addAttribute("token", token);
        return "resetPasswordForm";
    }

    @PostMapping("/resetPassword")
    public String processResetPassword(@RequestParam("token") String token,
                                       @RequestParam("password") String password,
                                       RedirectAttributes ra) {
        StudentDetailModel student = studentRepo.findByResetToken(token).orElse(null);
        if (student == null) {
            ra.addFlashAttribute("errorMsg", "Invalid or expired reset link.");
            return "redirect:/forgotPassword";
        }

        student.setPassword(password);
        student.setResetToken(null);
        studentRepo.save(student);

        ra.addFlashAttribute("successMsg", "Password updated successfully. Please login again.");
        return "redirect:/studentLogin";
    }
}
