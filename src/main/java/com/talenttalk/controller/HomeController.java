package com.talenttalk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "startpage";
    }
    
    @GetMapping("/adminLogin")
    public String adminLogin() {
        return "adminLogin";
    }

    @GetMapping("/studentLogin")
    public String studentLogin() {
        return "studentLogin";
    }

    @GetMapping("/companyRegister")
    public String companyRegister() {
        return "companyRegister";
    }
}
