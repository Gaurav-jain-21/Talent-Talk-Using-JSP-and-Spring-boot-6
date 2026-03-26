package com.talenttalk.controller;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.model.CompanyJob;
// Remove the old 'model.model' import
import org.springframework.ui.Model; // ADD THIS IMPORT
import com.talenttalk.service.CompanyJobsService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class CompanyJobsController {
    @Autowired
    private CompanyJobsService service;

    @PostMapping("/addCompanyJob")
    public String addjob(@ModelAttribute("job") CompanyJob job, HttpSession session){
        CompanyDetailModel currentCompany = (CompanyDetailModel) session.getAttribute("loggedInCompany");
        if (currentCompany != null) {
            job.setCompany(currentCompany);
            service.saveJob(job);
        }
        // Change return to redirect so the list refreshes after adding
        return "companyJobs";
    }

    @GetMapping("/companyManageJobs")
    public String showManageJobs(HttpSession session, Model model){
        CompanyDetailModel currentCompany = (CompanyDetailModel) session.getAttribute("loggedInCompany");

        if (currentCompany == null) {
            return "companyLogin";
        }

        List<CompanyJob> jobList = service.getJobsByCompany(currentCompany);
        model.addAttribute("jobs", jobList);

        return "companyManageJobs";
    }
    @GetMapping("/deleteJob")
    public String deleteJob(@RequestParam("id") Long id, HttpSession session, Model model){
        service.deleteJobById(id);
        CompanyDetailModel currentCompany = (CompanyDetailModel) session.getAttribute("loggedInCompany");

        if (currentCompany == null) {
            return "companyLogin";
        }

        List<CompanyJob> jobList = service.getJobsByCompany(currentCompany);
        model.addAttribute("jobs", jobList);
        return "companyManageJobs";

    }
}