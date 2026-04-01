package com.talenttalk.controller;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.model.CompanyJob;
// Remove the old 'model.model' import
import com.talenttalk.model.JobApplication;
import com.talenttalk.model.StudentDetailModel;
import com.talenttalk.repo.ApplicationRepository;
import com.talenttalk.service.JobApplicationService;
import com.talenttalk.service.StudentDashboardService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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

    @Autowired
    private StudentDashboardService studentService;
    @Autowired
    private JobApplicationService applicationService;
    @GetMapping("/viewStudentProfile")
    public String viewStudentProfile(@RequestParam("id") Long id,
                                     @RequestParam("appId") Long appId,
                                     Model model) {

        StudentDetailModel student = studentService.getStudentById(id);
        JobApplication application = applicationService.findById(appId);

        if (student == null || application == null) {
            return "redirect:/companyApplication";
        }

        model.addAttribute("student", student);
        model.addAttribute("jobTitle", application.getJob().getJobtitle());

        // CRITICAL FIX: This line ensures <input value="${appId}"> is not empty
        model.addAttribute("appId", appId);

        return "viewStudentProfile";
    }

//    @GetMapping("/viewStudentProfile")
//    public String viewStudentProfile(HttpSession session, Model model,
//                                     @RequestParam("id") Long id,
//                                     @RequestParam(value="appId", required=false) Long appId) {
//
//        StudentDetailModel student = studentService.getStudentById(id);
//
//        if (appId != null) {
//            // This is where it gets the REAL job title
//            JobApplication application = applicationService.findById(appId);
//            if (application != null) {
//                model.addAttribute("jobTitle", application.getJob().getJobtitle());
//            }
//        } else {
//            // This is why you see "General Applicant" currently
//            model.addAttribute("jobTitle", "General Applicant");
//        }
//
//        model.addAttribute("student", student);
//        model.addAttribute("appId", appId);
//        return "viewStudentProfile";
//    }

    @GetMapping("/displayResume")
    public ResponseEntity<byte[]> displayResume(@RequestParam("id") Long id) {
        StudentDetailModel student = studentService.getStudentById(id);

        if (student != null && student.getResume() != null) {
            return ResponseEntity.ok()
                    .contentType(MediaType.parseMediaType(student.getResumeFileType()))
                    .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"resume.pdf\"")
                    .body(student.getResume());
        }
        return ResponseEntity.notFound().build();
    }

    @PostMapping("/reject")
    public String rejectApplication(@RequestParam("appId") Long appId) {
        if (appId != null) {
            // Option 1: Update status (Recommended)
            applicationService.rejectApplication(appId);
        }

        // Redirect back to the main list page to refresh the view
        return "redirect:/companyApplication";
    }

    // 1. Process the button click
    @PostMapping("/shortlist")
    public String shortlistCandidate(@RequestParam("appId") Long appId) {
        applicationService.shortlistCandidate(appId);
        // Use "redirect:" to call the GET mapping and refresh the data properly
        return "redirect:/companyClient";
    }

    // 2. Load the Client Page with real data
    @GetMapping("/companyClient")
    public String showClientPage(Model model) {
        List<JobApplication> shortlisted = applicationService.getShortlistedCandidates();
        model.addAttribute("clients", shortlisted);
        return "companyClient"; // This matches your JSP name
    }
}