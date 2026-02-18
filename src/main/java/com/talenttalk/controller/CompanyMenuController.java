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
}
