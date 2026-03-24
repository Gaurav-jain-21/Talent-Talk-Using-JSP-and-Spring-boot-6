package com.talenttalk.controller;

import com.talenttalk.model.StudentDetailModel;
import com.talenttalk.service.StudentSignUpServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model; // Added missing import
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StudentSignUpController {

    @Autowired
    private StudentSignUpServices services;

    @PostMapping("/studentRegister")
    public String registerStudent(@ModelAttribute StudentDetailModel student,
                                  @RequestParam("confirmPassword") String confirmPassword,
                                  Model model) {

        // Check if passwords match
        if (!student.getPassword().equals(confirmPassword)) {
            model.addAttribute("error", "Passwords do not match!");
            return "register"; // The name of your JSP file
        }

        try {
            services.registerStudent(student);
            return "studentLogin";//"redirect:/studentLogin";
        } catch (Exception e) {
            model.addAttribute("error", "Registration failed: " + e.getMessage());
            return "register";
        }
    }
}