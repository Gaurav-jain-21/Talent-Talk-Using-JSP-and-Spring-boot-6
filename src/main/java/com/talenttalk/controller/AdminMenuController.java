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
    
    @GetMapping("/adminJobs")
    public String showJobs() {
    	return "adminJobs";
    }
    
    @GetMapping("/adminInvoice")
    public String showInvoice() {
    	return "adminInvoice";
    }
    
    @GetMapping("/adminInsights")
    public String showInsights() {
    	return "adminInsights";
    }
    
    @GetMapping("/adminUsers")
    public String showUsers() {
    	return "adminUsers";
    }
    
    @GetMapping("/adminPayment")
    public String showPayment() {
    	return "adminPayment";
    }
}
