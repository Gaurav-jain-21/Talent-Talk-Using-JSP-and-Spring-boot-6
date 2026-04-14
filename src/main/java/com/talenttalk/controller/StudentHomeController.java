package com.talenttalk.controller;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.model.CompanyJob;
import com.talenttalk.model.JobApplication;
import com.talenttalk.model.StudentDetailModel;
import com.talenttalk.repo.ApplicationRepository;
import com.talenttalk.repo.CompanyJobsRepo;
import com.talenttalk.repo.StudentSignUpRepo;
import com.talenttalk.service.CompanyJobsService;
import com.talenttalk.service.JobApplicationService;
import com.talenttalk.service.StudentDashboardService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.util.List;

@Controller
public class StudentHomeController {
    @Autowired
    private CompanyJobsService companyJobsService;

    @GetMapping("/studentProject")
    public String goToStudentProject(HttpSession session, Model model) {
        List<CompanyJob> allJobs = companyJobsService.getAllJobs();
        model.addAttribute("jobs", allJobs);
        return "studentProject";
    }

    @Autowired
    private ApplicationRepository appRepo;

    /**
     * Displays the Progress page with Shortlisted cards and Active Project table.
     */
    @Autowired
    private JobApplicationService jobApplicationService;
    @GetMapping("/studentJobs")
    public String showStudentProgress(HttpSession session, Model model) {
        StudentDetailModel student = (StudentDetailModel) session.getAttribute("loggedInStudent");
        if (student == null) return "redirect:/studentLogin";

        // 1. Fetch Shortlisted (for the top cards)
        List<JobApplication> shortlisted = jobApplicationService.getApplicationsByStudentAndStatus(student.getId(), "Shortlisted");
        model.addAttribute("shortlistedJobs", shortlisted);

        // 2. Fetch Shortlisted work items for the progress table
        List<JobApplication> active = jobApplicationService.getApplicationsByStudentAndStatus(student.getId(), "Shortlisted");
        model.addAttribute("activeProjects", active);

        return "studentJobs";
    }
    @PostMapping("/updateProjectStatus")
    public String updateProjectStatus(@RequestParam("applicationId") Long appId,
                                      @RequestParam("newStep") int newStep) {

        // 1. Find the specific application
        JobApplication application = appRepo.findById(appId)
                .orElseThrow(() -> new RuntimeException("Application not found with ID: " + appId));

        // 2. Update the progress step (1, 2, or 3)
        application.setProgressStep(newStep);

        // 3. Save to MySQL
        appRepo.save(application);

        // 4. Redirect back to the same page to show the updated table
        return "redirect:/studentJobs";
    }


    @GetMapping("/studentPayments")
    public String goToStudentPayments(HttpSession session, Model model) {
        StudentDetailModel student = (StudentDetailModel) session.getAttribute("loggedInStudent");
        if (student == null) {
            return "redirect:/studentLogin";
        }

        List<JobApplication> completedPayments = jobApplicationService.getCompletedApplicationsForStudent(student.getId());
        model.addAttribute("completedPayments", completedPayments);
        model.addAttribute("completedProjects", completedPayments.size());
        model.addAttribute("totalReceived", jobApplicationService.getTotalPaidAmountForStudent(student.getId()));

        return "studentPayments";
    }

    @GetMapping("/studentSettings")
    public String goToStudentSettings(HttpSession session) {
        if (session.getAttribute("loggedInStudent") == null) {
            return "redirect:/studentLogin";
        }
        return "studentSettings";
    }


    @GetMapping("/studentProfile")
    public String studentProfile(HttpSession session, Model model) {
        StudentDetailModel student = (StudentDetailModel) session.getAttribute("loggedInStudent");
        if (student == null) {
            return "redirect:/studentLogin";
        }
        model.addAttribute("student", student);
        return "studentProfile";
    }

    @Autowired
    private StudentDashboardService studentProfileService;

    @Autowired
    private StudentSignUpRepo studentRepo;

    @PostMapping("/updateStudentDetails")
    public String updateDetails(@ModelAttribute StudentDetailModel student,
                                @RequestParam(value = "resumeFile", required = false) MultipartFile file,
                                HttpSession session,
                                RedirectAttributes ra) throws IOException {

        // 1. Fetch the EXISTING managed entity from the database
        StudentDetailModel existingStudent = studentRepo.findById(student.getId()).orElse(null);

        if (existingStudent == null) {
            ra.addFlashAttribute("errorMsg", "Student not found.");
            return "redirect:/studentLogin";
        }

        // 2. Update basic details on the EXISTING object
        existingStudent.setFirstName(student.getFirstName());
        existingStudent.setLastName(student.getLastName());
        existingStudent.setEmail(student.getEmail());
        existingStudent.setAddress(student.getAddress());
        existingStudent.setProfession(student.getProfession());
        // Do NOT call setApplications() - the existing list remains untouched/managed

        // 3. Handle the file upload
        if (file != null && !file.isEmpty()) {
            String contentType = file.getContentType();
            if (contentType != null && (contentType.equals("application/pdf") || contentType.equals("image/jpeg"))) {
                existingStudent.setResume(file.getBytes());
                existingStudent.setResumeFileType(contentType);
            } else {
                ra.addFlashAttribute("errorMsg", "Only PDF and JPG files are allowed.");
                return "redirect:/studentProfile";
            }
        }

        // 4. Save the managed entity
        studentRepo.save(existingStudent);

        // 5. Update session with the fresh data
        session.setAttribute("loggedInStudent", existingStudent);

        ra.addFlashAttribute("successMsg", "Profile updated successfully!");
        return "redirect:/studentProfile";
    }
    @Autowired
    private CompanyJobsRepo jobsRepo;

    @PostMapping("/confirmApplication")
    public String jobApplication(@RequestParam("jobId") Long jobId, HttpSession session, Model model){
        StudentDetailModel student= (StudentDetailModel)  session.getAttribute("loggedInStudent");
        if (student==null){
            return "redirect:/studentLogin";
        }
        CompanyJob job= jobsRepo.findById(jobId)
                .orElseThrow(() -> new RuntimeException("Job not found with ID: " + jobId));
        if (!appRepo.existsByJob_IdAndStudent_Id(jobId, student.getId())) {
            JobApplication application = new JobApplication();
            application.setJob(job);
            application.setStudent(student);
            application.setStatus("Applied");
            appRepo.save(application);
        }

        return "redirect:/studentProject";
    }
}