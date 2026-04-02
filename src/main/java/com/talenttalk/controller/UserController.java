package com.talenttalk.controller;

import com.talenttalk.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

    @Autowired
    private UserRepository repo;

    // 1. Display the "Choose Role" page (index.jsp)
    @GetMapping("/")
    public String home() {
        return "index"; 
    }

    // 2. Navigate to Student Login
    @GetMapping("/studentLoginPage")
    public String showStudentLogin() {
        return "studentLoginPage";
    }

    // 3. Navigate to Admin Login
    @GetMapping("/adminLogin")
    public String showAdminLogin() {
        return "adminLogin";
    }

    // 4. Navigate to Company Registration
    @GetMapping("/companyRegisterPage")
    public String showCompanyRegister() {
        return "companyRegister";
    }

    @GetMapping("/forgotPassword")
    public String showForgotPassword() {
        return "forgotPassword";
    }
}