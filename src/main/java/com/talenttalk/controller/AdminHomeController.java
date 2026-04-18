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

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.YearMonth;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

@Controller
public class AdminHomeController {

    @GetMapping("/adminDashboard")
    public String showAdminDashboard(HttpSession session, Model model) {
        // Only allow if an Admin object exists in the session
        if (session.getAttribute("loggedInAdmin") == null) {
            return "redirect:/adminLogin";
        }

        long totalUsers = studentRepo.count() + companyRepo.count();
        long totalJobs = jobService.getAllJobs().size();
        long totalPayments = 0L;

        Map<YearMonth, Long> monthlyEarnings = new LinkedHashMap<>();
        YearMonth currentMonth = YearMonth.now();
        for (int i = 5; i >= 0; i--) {
            monthlyEarnings.put(currentMonth.minusMonths(i), 0L);
        }

        for (var app : applicationRepo.findByProgressStep(3)) {
            if (app.getPaymentStatus() != null && "Paid".equalsIgnoreCase(app.getPaymentStatus())) {
                long amount = app.getJob() != null ? app.getJob().getPayment() : 0L;
                totalPayments += amount;

                LocalDateTime paymentDate = app.getPaymentDate() != null ? app.getPaymentDate() : app.getAppliedDate();
                if (paymentDate != null) {
                    YearMonth ym = YearMonth.from(paymentDate);
                    if (monthlyEarnings.containsKey(ym)) {
                        monthlyEarnings.put(ym, monthlyEarnings.get(ym) + amount);
                    }
                }
            }
        }

        long maxMonthlyEarning = 0L;
        for (Long value : monthlyEarnings.values()) {
            if (value > maxMonthlyEarning) {
                maxMonthlyEarning = value;
            }
        }

        List<Map<String, String>> earningsOverview = new ArrayList<>();
        for (Map.Entry<YearMonth, Long> entry : monthlyEarnings.entrySet()) {
            Map<String, String> month = new LinkedHashMap<>();
            month.put("label", entry.getKey().getMonth().name().substring(0, 3) + " " + entry.getKey().getYear());
            month.put("amount", String.format("$%,d", entry.getValue()));
            int height = maxMonthlyEarning == 0L ? 15 : (int) Math.max(15, (entry.getValue() * 100) / maxMonthlyEarning);
            month.put("height", String.valueOf(height));
            earningsOverview.add(month);
        }

        model.addAttribute("totalUsers", totalUsers);
        model.addAttribute("totalJobs", totalJobs);
        model.addAttribute("totalPayments", String.format("$%,d", totalPayments));
        model.addAttribute("earningsOverview", earningsOverview);
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
            company -> company.getId(),
            company -> applicationRepo.findByJob_Company_Id(company.getId()).stream()
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

    @GetMapping("/adminInsights")
    public String showAdminInsights(){
        return "adminInsights";
    }

    @GetMapping("/adminPayment")
    public String showAdminPayment(HttpSession session, Model model){
        if (session.getAttribute("loggedInAdmin") == null) {
            return "redirect:/adminLogin";
        }

        List<Map<String, String>> adminPayments = new ArrayList<>();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MMM dd, yyyy hh:mm a");
        long totalRevenue = 0L;
        long pendingPayouts = 0L;

        for (var app : applicationRepo.findByProgressStep(3)) {
            Map<String, String> payment = new LinkedHashMap<>();
            long amount = app.getJob() != null ? app.getJob().getPayment() : 0L;
            boolean isPaid = app.getPaymentStatus() != null && "Paid".equalsIgnoreCase(app.getPaymentStatus());

            payment.put("companyName", app.getJob() != null && app.getJob().getCompany() != null
                ? app.getJob().getCompany().getName()
                    : "N/A");
            payment.put("studentName", app.getStudent() != null
                ? ((app.getStudent().getFirstName() == null ? "" : app.getStudent().getFirstName()) +
                (app.getStudent().getLastName() == null ? "" : " " + app.getStudent().getLastName())).trim()
                    : "N/A");
            payment.put("role", app.getJob() != null && app.getJob().getJobtitle() != null
                    ? app.getJob().getJobtitle()
                    : "N/A");
                payment.put("amount", String.format("$%,d", amount));
            payment.put("status", app.getPaymentStatus() == null || app.getPaymentStatus().isBlank()
                    ? "Pending"
                    : app.getPaymentStatus());

            LocalDateTime paymentDate = app.getPaymentDate();
            if (paymentDate == null && "Paid".equalsIgnoreCase(payment.get("status"))) {
            paymentDate = app.getAppliedDate();
            }
            payment.put("date", paymentDate != null ? paymentDate.format(formatter) : "Pending");
            adminPayments.add(payment);

            if (isPaid) {
                totalRevenue += amount;
            } else {
                pendingPayouts += amount;
            }
        }

        model.addAttribute("adminPayments", adminPayments);
        model.addAttribute("totalRevenue", String.format("$%,d", totalRevenue));
        model.addAttribute("pendingPayouts", String.format("$%,d", pendingPayouts));
        return "adminPayment";
    }

    @GetMapping("/adminSettings")
    public String showAdminSettings(HttpSession session){
        if(session.getAttribute("loggedInAdmin")==null){
            return "redirect:/adminLogin";
        }
        return "adminSettings";
    }
}
