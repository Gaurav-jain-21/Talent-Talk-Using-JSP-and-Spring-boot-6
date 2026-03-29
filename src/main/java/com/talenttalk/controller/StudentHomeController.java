package com.talenttalk.controller;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.model.CompanyJob;
import com.talenttalk.model.StudentDetailModel;
import com.talenttalk.service.CompanyJobsService;
import com.talenttalk.service.StudentDashboardService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

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


    @GetMapping("/studentProfile")
    public String studentProfile(HttpSession session , Model model){
        StudentDetailModel student = (StudentDetailModel) session.getAttribute("loggedInStudent");
        if(student==null){
            return "studentLogin";
        }
        model.addAttribute("student",student);
        return "studentProfile";
    }

    @Autowired
    private StudentDashboardService studentProfileService;
    @PostMapping("/updateStudentDetails")
    public String updataProfile(@ModelAttribute StudentDetailModel student, HttpSession session){
        studentProfileService.save(student);
        session.setAttribute("loggedInStudent",student);
        return "redirect:/studentProfile?success=true";
    }
}
