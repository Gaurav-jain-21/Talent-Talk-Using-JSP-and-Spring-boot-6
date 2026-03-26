package com.talenttalk.controller;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.service.CompanyDashboradService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CompanyHomeController {
    @Autowired
    private CompanyDashboradService dashboardService;
    @GetMapping("/companyDashboard")
    public String CompanyDashboard(HttpSession session, Model model) {
        CompanyDetailModel currentCompany = (CompanyDetailModel) session.getAttribute("loggedInCompany");

        if (currentCompany == null) return "redirect:/login";

        // Add this print to your console to verify
        System.out.println("Checking jobs for Company ID: " + currentCompany.getId());

        long totalJobs = dashboardService.getActiveJobCount(currentCompany);
        model.addAttribute("activeJobsCount", totalJobs);

        return "companyDashboard";
    }
    @GetMapping("/companyClient")
    public String CompanyClient(){
        return "companyClient";
    }
    @GetMapping("/companyJobs")
    public String CompanyJobs(HttpSession session){
        if (session.getAttribute("loggedInCompany") == null) {
            return "redirect:/companyLogin";
        }
        return "companyJobs";
    }
    @GetMapping("/companyPayment")
    public String CompanyPayment(){
        return "companyPayment";
    }
    @GetMapping("/companySettings")
    public String CompanySettings(){
        return "companySettings";
    }
    @GetMapping("/companyForgotPassword")
    public String CompanyForgotPassword(){
        return "companyForgotPassword";
    }

    @GetMapping("/companyApplication")
    public String CompanyApplication(){
        return "companyApplication";
    }
    @GetMapping("/companyMessage")
    public String CompanyMessage(){
        return "companyMessage";
    }
}
