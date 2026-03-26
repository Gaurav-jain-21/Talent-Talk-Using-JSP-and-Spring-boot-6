package com.talenttalk.controller;

import com.talenttalk.model.CompanyDetailModel;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CompanyHomeController {
    @GetMapping("/companyDashboard")
    public String CompanyDashboard(HttpSession session){
        if (session.getAttribute("loggedInCompany") == null) {
            return "redirect:/companyLogin";
        }
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
    @GetMapping("/companyManageJobs")
    public String CompanyManageJobs(){
        return "companyManageJobs";
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
