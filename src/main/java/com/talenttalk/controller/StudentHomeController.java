package com.talenttalk.controller;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.model.CompanyJob;
import com.talenttalk.service.CompanyJobsService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class StudentHomeController {
    @Autowired
    private CompanyJobsService companyJobsService;
    @GetMapping("/studentProject")
    public String goToStudentProject(HttpSession session, Model model){
        List<CompanyJob> allJobs= companyJobsService.getAllJobs();
        model.addAttribute("jobs",allJobs);
        return "studentProject";
    }
    @GetMapping("/studentJobs")
    public String goToStudentJobs(){
        return "studentJobs";
    }
    @GetMapping("/studentPayments")
    public String goToStudentPayments(){
        return "studentPayments";
    }
    @GetMapping("/studentSettings")
    public String goToStudentSettings(){
        return "studentSettings";
    }
    @GetMapping("/studentMessage")
    public String goToStudentMessage(){
        return "studentMessage";
    }
}
