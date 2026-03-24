package com.talenttalk.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class StudentHomeController {
    @GetMapping("/studentProject")
    public String goToStudentProject(){
        return "studentProject";
    }
    @GetMapping("/studentDashboard")
    public String goToStudentDashboard(){
        return "studentDashboard";
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
