package com.talenttalk.controller;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.repo.CompanyRegisterRepo;
import com.talenttalk.service.CompanyRegisterServices;
import com.talenttalk.service.EmailService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;

@Controller
public class CompanyRegisterController {

    private static final Logger logger = LoggerFactory.getLogger(CompanyRegisterController.class);

    @Autowired
    private CompanyRegisterServices services;

    @Autowired
    private CompanyRegisterRepo companyRepo;

    @Autowired
    private EmailService emailService;

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

        try {
            emailService.sendCompanyRegistrationSuccessEmail(company.getEmail(), company.getName());
        } catch (Exception emailEx) {
            logger.warn("Company registered but confirmation email failed for {}", company.getEmail(), emailEx);
        }

        return "redirect:/companyLogin";
    }
}
