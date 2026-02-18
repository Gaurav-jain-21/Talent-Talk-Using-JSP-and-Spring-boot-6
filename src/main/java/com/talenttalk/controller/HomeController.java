package com.talenttalk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

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
    
    @GetMapping("/LogoutAdmin")
    public String logoutAdmin(HttpSession session) {

//        // invalidate admin session
//        session.invalidate();

        // redirect to startpage.jsp
        return "startpage";
    }
    
    @GetMapping("/companyLogin")
    public String companyLoginpage() {
    	return "companyLogin";
    }
    
    @GetMapping("/LogoutCompany")
    public String LogoutCompany(HttpSession session) {
    	return "startpage";
    }
}
