package com.talenttalk.controller;

import com.talenttalk.model.StudentDetailModel;
import com.talenttalk.repo.StudentSignUpRepo;
import com.talenttalk.service.EmailService;
import com.talenttalk.service.StudentSignUpServices;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;

@Controller
public class StudentSignUpController {

    private static final Logger logger = LoggerFactory.getLogger(StudentSignUpController.class);

    @Autowired
    private StudentSignUpServices services;

    @Autowired
    private StudentSignUpRepo studentRepo;

    @Autowired
    private EmailService emailService;

    @GetMapping("/checkStudentEmail")
    @ResponseBody
    public ResponseEntity<Boolean> checkStudentEmail(@RequestParam("email") String email) {
        boolean exists = studentRepo.findByEmail(email).isPresent();
        return ResponseEntity.ok(exists);
    }

    @PostMapping("/studentRegister")
    public String registerStudent(@ModelAttribute StudentDetailModel student,
                                  @RequestParam("confirmPassword") String confirmPassword,
                                  Model model) {

        // Check if email already exists
        if (studentRepo.findByEmail(student.getEmail()).isPresent()) {
            model.addAttribute("error", "Email already registered!");
            return "studentSignup";
        }

        // Check if passwords match
        if (!student.getPassword().equals(confirmPassword)) {
            model.addAttribute("error", "Passwords do not match!");
            return "studentSignup";
        }

        try {
            services.registerStudent(student);

            try {
                String studentName = ((student.getFirstName() != null ? student.getFirstName() : "") + " "
                        + (student.getLastName() != null ? student.getLastName() : "")).trim();
                emailService.sendStudentRegistrationSuccessEmail(student.getEmail(), studentName);
            } catch (Exception emailEx) {
                logger.warn("Student registered but confirmation email failed for {}", student.getEmail(), emailEx);
            }

            return "redirect:/studentLogin";
        } catch (Exception e) {
            model.addAttribute("error", "Registration failed: " + e.getMessage());
            return "studentSignup";
        }
    }
}