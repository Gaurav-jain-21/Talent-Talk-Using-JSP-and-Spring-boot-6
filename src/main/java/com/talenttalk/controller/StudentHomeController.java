package com.talenttalk.controller;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.model.CompanyJob;
import com.talenttalk.model.StudentDetailModel;
import com.talenttalk.repo.StudentSignUpRepo;
import com.talenttalk.service.CompanyJobsService;
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

    @GetMapping("/studentJobs")
    public String goToStudentJobs() {
        return "studentJobs";
    }

    @GetMapping("/studentPayments")
    public String goToStudentPayments() {
        return "studentPayments";
    }

    @GetMapping("/studentSettings")
    public String goToStudentSettings() {
        return "studentSettings";
    }

    @GetMapping("/studentMessage")
    public String goToStudentMessage() {
        return "studentMessage";
    }


    @GetMapping("/studentProfile")
    public String studentProfile(HttpSession session, Model model) {
        StudentDetailModel student = (StudentDetailModel) session.getAttribute("loggedInStudent");
        if (student == null) {
            return "studentLogin";
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

        // Check if file was actually uploaded
        if (file != null && !file.isEmpty()) {
            String contentType = file.getContentType();
            if (contentType != null && (contentType.equals("application/pdf") || contentType.equals("image/jpeg"))) {
                student.setResume(file.getBytes());
                student.setResumeFileType(contentType);
            } else {
                ra.addFlashAttribute("errorMsg", "Only PDF and JPG files are allowed.");
                return "redirect:/studentProfile"; // Use redirect to show flash attributes
            }
        } else {
            // If no new file is uploaded, keep the old one from the database
            StudentDetailModel existing = studentRepo.findById(student.getId()).orElse(null);
            if (existing != null) {
                student.setResume(existing.getResume());
                student.setResumeFileType(existing.getResumeFileType());
            }
        }

        studentRepo.save(student);
        session.setAttribute("loggedInStudent", student);
        ra.addFlashAttribute("successMsg", "Profile updated successfully!");

        return "redirect:/studentProfile";
    }
}