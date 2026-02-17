package com.talenttalk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminMenuController {

    @GetMapping("/adminDashboard")
    public String showDashboard() {
        return "adminDashboard";
    }

    @GetMapping("/adminCompany")
    public String showCompanyVerification() {
        return "adminCompany";
    }
}
