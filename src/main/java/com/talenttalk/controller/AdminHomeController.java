package com.talenttalk.controller;

import com.talenttalk.model.CompanyJob;
import com.talenttalk.model.StudentDetailModel;
import com.talenttalk.repo.StudentSignUpRepo;
import com.talenttalk.service.CompanyJobsService;
import com.talenttalk.service.StudentService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class AdminHomeController {

    @GetMapping("/adminDashboard")
    public String showAdminDashboard(HttpSession session) {
        // Only allow if an Admin object exists in the session
        if (session.getAttribute("loggedInAdmin") == null) {
            return "redirect:/adminLogin";
        }
        return "adminDashboard";
    }

    @Autowired
    private StudentSignUpRepo studentRepo;

    @Autowired
    private StudentService studentService;

    @GetMapping("/adminUsers")
    public String showStudentUsers(HttpSession session, Model model) {
        // 1. Security Check
        if (session.getAttribute("loggedInAdmin") == null) {
            return "redirect:/adminLogin";
        }

        // 2. Fetch only Students
        List<StudentDetailModel> studentList = studentService.getAllStudents();

        // 3. Add to model
        model.addAttribute("students", studentList);

        return "adminUsers";
    }

    // 4. Delete Student Logic
    @GetMapping("/deleteStudent")
    public String deleteStudent(@RequestParam("id") Long id, HttpSession session) {
        if (session.getAttribute("loggedInAdmin") == null) {
            return "redirect:/adminLogin";
        }

        if (studentRepo.existsById(id)) {
            studentService.deleteStudent(id);
        }

        return "redirect:/adminUsers";
    }


    @Autowired
    private CompanyJobsService jobService;

    @GetMapping("/adminJobs")
    public String showAdminJobs(HttpSession session, Model model) {
        if (session.getAttribute("loggedInAdmin") == null) {
            return "redirect:/adminLogin";
        }

        List<CompanyJob> allJobs = jobService.getAllJobs();
        model.addAttribute("allJobs", allJobs);
        return "adminJobs";
    }

    @GetMapping("/deleteAdminJob")
    public String deleteJob(@RequestParam("id") Long id, HttpSession session) {
        if (session.getAttribute("loggedInAdmin") == null) {
            return "redirect:/adminLogin";
        }

        if (jobService.getJobById(id) != null) {
            jobService.deleteJobById(id);
        }

        return "redirect:/adminJobs";
    }
}
