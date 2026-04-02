package com.talenttalk.controller;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.model.CompanyJob;
import com.talenttalk.model.StudentDetailModel;
import com.talenttalk.repo.ApplicationRepository;
import com.talenttalk.repo.CompanyRegisterRepo;
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
import java.util.Objects;
import java.util.stream.Collectors;

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

    @Autowired
    private CompanyRegisterRepo companyRepo;

    @Autowired
    private ApplicationRepository applicationRepo;

    @GetMapping("/adminCompany")
    public String showCompanies(HttpSession session, Model model) {
        // Security Check
        if (session.getAttribute("loggedInAdmin") == null) {
            return "redirect:/adminLogin";
        }

        List<CompanyDetailModel> companies = companyRepo.findAll();

        // We will pass the counts separately or use a transient field
        // For simplicity in JSP, we'll map the counts
        model.addAttribute("companies", companies);

        // This helper map stores CompanyID -> distinct number of students currently tied to company jobs
        model.addAttribute("hiredCounts", companies.stream().collect(Collectors.toMap(
                CompanyDetailModel::getId,
            c -> applicationRepo.findByJob_Company_Id(c.getId()).stream()
                .map(app -> app.getStudent() != null ? app.getStudent().getId() : null)
                .filter(Objects::nonNull)
                .distinct()
                .count()
        )));

        return "adminCompany";
    }

    @GetMapping("/deleteAdminCompany")
    public String deleteCompany(@RequestParam("id") Long id, HttpSession session) {
        if (session.getAttribute("loggedInAdmin") == null) {
            return "redirect:/adminLogin";
        }

        if (companyRepo.existsById(id)) {
            companyRepo.deleteById(id);
        }

        return "redirect:/adminCompany";
    }
}
