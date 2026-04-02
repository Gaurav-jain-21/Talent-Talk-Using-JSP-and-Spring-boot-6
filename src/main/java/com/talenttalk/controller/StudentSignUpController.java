package com.talenttalk.controller;

import com.talenttalk.model.StudentDetailModel;
import com.talenttalk.repo.StudentSignUpRepo;
import com.talenttalk.service.StudentSignUpServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;

@Controller
public class StudentSignUpController {

    @Autowired
    private StudentSignUpServices services;

    @Autowired
    private StudentSignUpRepo studentRepo;

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
            return "redirect:/studentLogin";
        } catch (Exception e) {
            model.addAttribute("error", "Registration failed: " + e.getMessage());
            return "studentSignup";
        }
    }
}