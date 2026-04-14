package com.talenttalk.controller;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.model.JobApplication;
import com.talenttalk.service.CompanyDashboradService;
import com.talenttalk.service.JobApplicationService;
import com.talenttalk.service.RazorpayPaymentService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CompanyHomeController {
    @Autowired
    private CompanyDashboradService dashboardService;
    @GetMapping("/companyDashboard")
    public String CompanyDashboard(HttpSession session, Model model) {
        CompanyDetailModel currentCompany = (CompanyDetailModel) session.getAttribute("loggedInCompany");

        if (currentCompany == null) return "redirect:/companyLogin";

        // Add this print to your console to verify
        System.out.println("Checking jobs for Company ID: " + currentCompany.getId());

        long totalJobs = dashboardService.getActiveJobCount(currentCompany);
        long totalClients = dashboardService.getTotalClientCount(currentCompany.getId());
        long jobPostsCount = dashboardService.getJobPostCount(currentCompany.getId());
        List<JobApplication> companyApplications = dashboardService.getApplicationsForCompany(currentCompany.getId());

        model.addAttribute("activeJobsCount", totalJobs);
        model.addAttribute("totalClientsCount", totalClients);
        model.addAttribute("jobPostsCount", jobPostsCount);
        model.addAttribute("recentApplications", companyApplications);

        return "companyDashboard";
    }
    @GetMapping("/companyJobs")
    public String CompanyJobs(HttpSession session){
        if (session.getAttribute("loggedInCompany") == null) {
            return "redirect:/companyLogin";
        }
        return "companyJobs";
    }
    @GetMapping("/companyPayment")
    public String CompanyPayment(HttpSession session, Model model){
        CompanyDetailModel company = (CompanyDetailModel) session.getAttribute("loggedInCompany");
        if (company == null) {
            return "redirect:/companyLogin";
        }

        List<JobApplication> completedApplications = applicationService.getCompletedApplicationsForCompany(company.getId());
        model.addAttribute("completedPayments", completedApplications);
        return "companyPayment";
    }

    @PostMapping("/companyPayment/pay")
    public String payCompletedWork(@RequestParam("appId") Long appId,
                                   HttpSession session,
                                   Model model,
                                   RedirectAttributes ra) {
        CompanyDetailModel company = (CompanyDetailModel) session.getAttribute("loggedInCompany");
        if (company == null) {
            return "redirect:/companyLogin";
        }

        JobApplication app = applicationService.getPayableApplicationForCompany(company.getId(), appId);
        if (app == null) {
            ra.addFlashAttribute("errorMsg", "Payment can be made only for completed company projects.");
            return "redirect:/companyPayment";
        }
        if ("Paid".equalsIgnoreCase(app.getPaymentStatus())) {
            ra.addFlashAttribute("successMsg", "This payment is already marked as paid.");
            return "redirect:/companyPayment";
        }

        try {
            Map<String, String> orderData = razorpayPaymentService.createOrder(appId, company.getId(), app.getJob().getPayment());
            Map<String, Long> pendingOrders = getPendingOrderMap(session);
            pendingOrders.put(orderData.get("orderId"), appId);
            session.setAttribute("pendingRazorpayOrders", pendingOrders);

            model.addAttribute("razorpayOrderId", orderData.get("orderId"));
            model.addAttribute("razorpayKeyId", orderData.get("keyId"));
            model.addAttribute("amountInPaise", orderData.get("amountInPaise"));
            model.addAttribute("currency", orderData.get("currency"));
            model.addAttribute("appId", appId);
            model.addAttribute("companyName", company.getName());
            model.addAttribute("companyEmail", company.getEmail());
            model.addAttribute("studentName", app.getStudent().getFirstName() + " " + app.getStudent().getLastName());
            model.addAttribute("jobRole", app.getJob().getJobtitle());

            return "companyRazorpayCheckout";
        } catch (IllegalStateException ex) {
            ra.addFlashAttribute("errorMsg", ex.getMessage());
            return "redirect:/companyPayment";
        }
    }

    @PostMapping("/companyPayment/verify")
    public String verifyPayment(@RequestParam("razorpay_payment_id") String paymentId,
                                @RequestParam("razorpay_order_id") String orderId,
                                @RequestParam("razorpay_signature") String signature,
                                HttpSession session,
                                RedirectAttributes ra) {
        CompanyDetailModel company = (CompanyDetailModel) session.getAttribute("loggedInCompany");
        if (company == null) {
            return "redirect:/companyLogin";
        }

        Map<String, Long> pendingOrders = getPendingOrderMap(session);
        Long appId = pendingOrders.get(orderId);
        if (appId == null) {
            ra.addFlashAttribute("errorMsg", "Payment session expired or invalid order.");
            return "redirect:/companyPayment";
        }

        boolean verified = razorpayPaymentService.verifySignature(orderId, paymentId, signature);
        if (!verified) {
            ra.addFlashAttribute("errorMsg", "Razorpay signature verification failed. Payment not marked as paid.");
            return "redirect:/companyPayment";
        }

        applicationService.markPaymentAsPaid(company.getId(), appId);
        pendingOrders.remove(orderId);
        session.setAttribute("pendingRazorpayOrders", pendingOrders);
        ra.addFlashAttribute("successMsg", "Payment received and marked as paid.");
        return "redirect:/companyPayment";
    }
    @GetMapping("/companySettings")
    public String CompanySettings(HttpSession session){
        if (session.getAttribute("loggedInCompany") == null) {
            return "redirect:/companyLogin";
        }
        return "companySettings";
    }
    @GetMapping("/companyForgotPassword")
    public String CompanyForgotPassword(){
        return "companyForgotPassword";
    }

    @Autowired
    private JobApplicationService applicationService;

    @Autowired
    private RazorpayPaymentService razorpayPaymentService;

    @SuppressWarnings("unchecked")
    private Map<String, Long> getPendingOrderMap(HttpSession session) {
        Object existing = session.getAttribute("pendingRazorpayOrders");
        if (existing instanceof Map<?, ?> map) {
            return (Map<String, Long>) map;
        }
        return new HashMap<>();
    }

    @GetMapping("/companyApplication")
    public String CompanyApplication(Model model, HttpSession session){
        CompanyDetailModel company = (CompanyDetailModel)  session.getAttribute("loggedInCompany");
        if (company == null) {
            return "redirect:/companyLogin";
        }
        List<JobApplication> applications= applicationService.findByCompanyId(company.getId());
        model.addAttribute("candidates",applications);
        return "companyApplication";
    }
}
