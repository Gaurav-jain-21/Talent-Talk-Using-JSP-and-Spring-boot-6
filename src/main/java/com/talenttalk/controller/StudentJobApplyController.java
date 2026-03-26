package com.talenttalk.controller;

import com.talenttalk.model.CompanyJob;
import com.talenttalk.service.CompanyJobsService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StudentJobApplyController {
    @Autowired
    private CompanyJobsService companyJobsService;
    @GetMapping("/JobApply")
    public String getJobApplyPage(@RequestParam("jobId") Long jobId, HttpSession session, Model model){
        CompanyJob job= companyJobsService.getJobById(jobId);
        model.addAttribute("job",job);
        return "JobApply";
    }
}
