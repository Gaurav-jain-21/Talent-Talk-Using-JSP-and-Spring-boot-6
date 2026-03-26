package com.talenttalk.controller;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.model.CompanyJob;
import com.talenttalk.service.CompanyJobsService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CompanyJobsController {
    @Autowired
    private CompanyJobsService service;

    @PostMapping("/addCompanyJob")
    public String addjob(@ModelAttribute("job") CompanyJob job, HttpSession session){
        CompanyDetailModel currentCompany= (CompanyDetailModel) session.getAttribute("loggedInCompany");
        if (currentCompany != null) {
            job.setCompany(currentCompany); // Link job to this specific company
            service.saveJob(job);
        }
        return "companyJobs";
    }

}
