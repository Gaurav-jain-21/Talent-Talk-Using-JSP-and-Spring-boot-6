package com.talenttalk.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminHomeController {

    @GetMapping("/adminDashboard")
    public String showAdminDashboard(HttpSession session) {
        // Only allow if an Admin object exists in the session
        if (session.getAttribute("loggedInAdmin") == null) {
            return "redirect:/adminLogin";
        }
        return "adminDashboard";
    }
}
