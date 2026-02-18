package com.talenttalk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/CompanyLogin")
public class CompanyLoginController {

    @PostMapping
    public String loginCompany(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            Model model) {

        if (email.equals("company@gmail.com") && password.equals("1234")) {
            return "companyDashboard";
        } else {
            model.addAttribute("error", "Invalid email or password");
            return "companyLogin";
        }
    }
}
