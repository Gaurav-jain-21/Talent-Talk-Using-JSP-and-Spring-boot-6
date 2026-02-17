package com.talenttalk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminLoginController {

    @PostMapping("/adminLogin")
    public String loginAdmin(
            @RequestParam("AdminEmail") String email,
            @RequestParam("Adminpwd") String password,
            Model model) {

        // Temporary Hardcoded Login (for testing)
        if (email.equals("admin@gmail.com") && password.equals("1234")) {
            return "adminDashboard";   // JSP name (without .jsp)
        } else {
            model.addAttribute("error", "Invalid email or password");
            return "adminLogin";       // back to login page
        }
    }
}
