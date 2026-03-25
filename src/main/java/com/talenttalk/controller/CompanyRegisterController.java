package com.talenttalk.controller;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.service.CompanyRegisterServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CompanyRegisterController {

    @Autowired
    private CompanyRegisterServices services;

    @PostMapping("/companyRegisterForm")
    public String registerCompany(@ModelAttribute CompanyDetailModel company) {
        services.saveCompany(company);
        // Redirecting to a success page or login page after registration
        return "companyLogin";
    }
}