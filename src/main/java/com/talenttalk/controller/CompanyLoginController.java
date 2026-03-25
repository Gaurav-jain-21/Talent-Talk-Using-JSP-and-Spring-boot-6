package com.talenttalk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CompanyLoginController {

    @GetMapping("/companyRegister")
    public String getCompanyRegisterPage(){
        return "companyRegister";
    }

}
