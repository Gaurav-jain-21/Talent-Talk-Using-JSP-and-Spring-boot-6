package com.talenttalk.controller;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.model.JobApplication;
import com.talenttalk.service.CompanyDashboradService;
import com.talenttalk.service.JobApplicationService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class CompanyHomeController {
    @Autowired
    private CompanyDashboradService dashboardService;
    @GetMapping("/companyDashboard")
    public String CompanyDashboard(HttpSession session, Model model) {
        CompanyDetailModel currentCompany = (CompanyDetailModel) session.getAttribute("loggedInCompany");

        if (currentCompany == null) return "redirect:/companyLogin";

        // Add this print to your console to verify
        System.out.println("Checking jobs for Company ID: " + currentCompany.getId());

        long totalJobs = dashboardService.getActiveJobCount(currentCompany);
        model.addAttribute("activeJobsCount", totalJobs);

        return "companyDashboard";
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

    @Autowired
    private JobApplicationService applicationService;
    @GetMapping("/companyApplication")
    public String CompanyApplication(Model model, HttpSession session){
        CompanyDetailModel company = (CompanyDetailModel)  session.getAttribute("loggedInCompany");
        if (company == null) {
            return "redirect:/companyLogin";
        }
        List<JobApplication> applications= applicationService.findByCompanyId(company.getId());
        model.addAttribute("candidates",applications);
        return "companyApplication";
    }
}
