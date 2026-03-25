package com.talenttalk.controller;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.service.CompanyLoginServices;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CompanyLoginController {

    @Autowired
    private CompanyLoginServices service;

    @PostMapping("/CompanyLoginForm")
    public String companyLogin(@RequestParam("email") String email,
                               @RequestParam("password") String password,
                               HttpSession session,
                               Model model) {

        CompanyDetailModel company = service.authenticate(email, password);

        if (company != null) {
            // Store company object in session
            session.setAttribute("loggedInCompany", company);
            // Redirect to a dashboard page (you'll need a @GetMapping for this)
            return "redirect:/companyDashboard";
        } else {
            // Send back to login with error message
            model.addAttribute("error", "Invalid email or password. Please try again.");
            return "companyLogin";
        }
    }
}