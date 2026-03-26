package com.talenttalk.controller;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.service.CompanyLoginServices;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CompanyLoginController {

    @Autowired
    private CompanyLoginServices service;

    @GetMapping("/companyLogin")
    public String showLoginPage() {
        return "companyLogin";
    }

    @PostMapping("/CompanyLoginForm")
    public String companyLogin(@RequestParam("email") String email,
                               @RequestParam("password") String password,
                               HttpSession session,
                               Model model) {

        CompanyDetailModel company = service.authenticate(email, password);

        if (company != null) {
            session.setAttribute("loggedInCompany", company);
            return "companyDashboard";
        } else {
            model.addAttribute("error", "Invalid email or password.");
            return "companyLogin";
        }
    }

    @GetMapping("/companyProfile")
    public String showProfile(HttpSession session, Model model){
        CompanyDetailModel company= (CompanyDetailModel) session.getAttribute("loggedInCompany");
        if(company==null){
            return "companyLogin";
        }
        model.addAttribute("company",company);
        return "companyProfile";
    }
    @PostMapping("/updateCompanyDetails")
    public String updateCompanyDetails(@ModelAttribute CompanyDetailModel company, HttpSession session) {
        service.updateCompany(company);
        session.setAttribute("loggedInCompany", company);
        return "redirect:/companyProfile?success=true"; // Redirect to a GET mapping
    }
//    @PostMapping("/updateCompanyDetails")
//    public String updateCompProfile(@ModelAttribute("company") CompanyDetailModel updatedData, HttpSession session){
//        CompanyDetailModel savedCompany = service.updateCompany(updatedData);
//
//        // IMPORTANT: Update the Session so the sidebar/header shows new name immediately
//        session.setAttribute("loggedInCompany", savedCompany);
//
//        return "companyProfile";
//
//    }

}