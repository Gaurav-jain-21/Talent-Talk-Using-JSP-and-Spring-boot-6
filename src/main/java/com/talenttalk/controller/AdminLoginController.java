package com.talenttalk.controller;

import com.talenttalk.model.AdminModel;
import com.talenttalk.repo.AdminRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminLoginController {

    @Autowired
    private AdminRepository adminRepo;

    @PostMapping("/adminLogin")
    public String processLogin(@RequestParam("AdminEmail") String email,
                               @RequestParam("Adminpwd") String password,
                               HttpSession session,
                               Model model) {

        // 1. Look for the admin in MySQL
        AdminModel admin = adminRepo.findByEmail(email);

        // 2. Validate existence and password
        if (admin != null && admin.getPassword().equals(password)) {
            // Success: Save admin object to session
            session.setAttribute("loggedInAdmin", admin);
            return "redirect:/adminDashboard";
        } else {
            // Failure: Send error message back to JSP
            model.addAttribute("error", "Invalid Email or Password. Please try again.");
            return "adminLogin";
        }
    }

    @GetMapping("/adminLogout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/adminLogin";
    }
}
