package com.talenttalk.controller;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.repo.CompanyRegisterRepo;
import com.talenttalk.service.CompanyRegisterServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;

@Controller
public class CompanyRegisterController {

    @Autowired
    private CompanyRegisterServices services;

    @Autowired
    private CompanyRegisterRepo companyRepo;

    @GetMapping("/checkCompanyEmail")
    @ResponseBody
    public ResponseEntity<Boolean> checkCompanyEmail(@RequestParam("email") String email) {
        CompanyDetailModel company = companyRepo.findByEmail(email);
        return ResponseEntity.ok(company != null);
    }

    @PostMapping("/companyRegisterForm")
    public String registerCompany(@ModelAttribute CompanyDetailModel company, Model model) {
        // Check if email already exists
        if (companyRepo.findByEmail(company.getEmail()) != null) {
            model.addAttribute("error", "Email already registered!");
            return "companyRegister";
        }

        services.saveCompany(company);
        return "redirect:/companyLogin";
    }
}