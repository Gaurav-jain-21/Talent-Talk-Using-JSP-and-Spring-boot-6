package com.talenttalk.controller;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.model.CompanyJob;
// Remove the old 'model.model' import
import com.talenttalk.model.JobApplication;
import com.talenttalk.repo.ApplicationRepository;
import org.springframework.ui.Model; // ADD THIS IMPORT
import com.talenttalk.service.CompanyJobsService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

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
    @PostMapping("/EditCompanyPost")
    public String updateJobDetails(@RequestParam("id") Long id,
                                   @RequestParam("jobtitle") String jobtitle,
                                   @RequestParam("payment") int payment,
                                   @RequestParam("projectdescription") String projectdescription,
                                   HttpSession session,
                                   Model model) { // Add Model here

        CompanyDetailModel currentCompany = (CompanyDetailModel) session.getAttribute("loggedInCompany");

        if (currentCompany == null) {
            return "companyLogin";
        }

        // 1. Perform the Update
        CompanyJob existingJob = service.getJobById(id);
        if (existingJob != null) {
            existingJob.setJobtitle(jobtitle);
            existingJob.setPayment(payment);
            existingJob.setProjectdescription(projectdescription);
            service.saveJob(existingJob);
        }

        // 2. RE-FETCH THE DATA (This is the missing step!)
        // We must fill the 'jobs' list again so the JSP has something to show
        List<CompanyJob> updatedList = service.getJobsByCompany(currentCompany);
        model.addAttribute("jobs", updatedList);

        // 3. Now return the view name
        return "companyManageJobs";
    }
    @Autowired
    private ApplicationRepository appRepo;
    @GetMapping("/viewApplicants")
    public String viewApplicants(@RequestParam("jobId") Long jobId,Model model){
        java.util.List<JobApplication> apps= appRepo.findByJobId(jobId);
        model.addAttribute("candidates",apps);
        model.addAttribute("totalCount",apps.size());
        return "companyApplication";

    }
}