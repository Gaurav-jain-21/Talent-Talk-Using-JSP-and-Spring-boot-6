package com.talenttalk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StudentLoginController {

    @PostMapping("/studentLogin")
    public String loginStudent(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            Model model) {

        // Temporary Hardcoded Login (for testing)
        if (email.equals("student@gmail.com") && password.equals("1234")) {
            return "studentDashboard";   // JSP name (without .jsp)
        } else {
            model.addAttribute("error", "Invalid email or password");
            return "studentLogin";       // back to login page
        }
    }
}
