package com.talenttalk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CompanyMenuController {

    @GetMapping("/companyDashboard")
    public String viewCompanyDashboard() {
        return "companyDashboard";
    }
    @GetMapping("/companyClient")
    public String viewCompanyClient() {
    	return "companyClient";
    }
    @GetMapping("/companyJobs")
    public String viewCompanyJobs() {
    	return "companyJobs";
    }
    @GetMapping("/companyManageJobs")
    public String viewCompanyManageJobs() {
    	return "companyManageJobs";
    }
    @GetMapping("/companyApplication")
    public String viewApplication() {
    	return "companyApplication";
    }
    @GetMapping("/companyMessage")
    public String viewMessage() {
    	return "companyMessage";
    }
    @GetMapping("/companyPayment")
    public String viewPayment() {
    	return "companyPayment";
    }
}

