package com.talenttalk.controller;

import com.talenttalk.model.StudentDetailModel;
import com.talenttalk.model.Message;
import com.talenttalk.repo.CompanyRegisterRepo;
import com.talenttalk.service.MessageService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class StudentMessageController {

    @Autowired
    private MessageService messageService;

    @Autowired
    private CompanyRegisterRepo companyRegisterRepo;

    @GetMapping("/studentMessage")
    public String showStudentMessages(HttpSession session, Model model) {
        // 1. Get the Student object from the session
        StudentDetailModel student = (StudentDetailModel) session.getAttribute("loggedInStudent");

        // 2. Check if the student is actually logged in
        if (student == null) {
            System.out.println("DEBUG: No 'loggedInStudent' found in session. Redirecting...");
            return "redirect:/studentLogin"; // Or your specific student login path
        }

        // 3. Get the email FROM the student object
        String studentEmail = student.getEmail();

        // 4. Fetch the inbox using that email
        model.addAttribute("inbox", messageService.getInbox(studentEmail));

        return "studentMessage";
    }

    @GetMapping("/deleteMessage/{id}")
    public String deleteMessage(@PathVariable("id") Long id) {
        messageService.deleteMessage(id);
        return "redirect:/studentMessage";
    }

    @PostMapping("/studentMessage/send")
    public String sendMessageToCompany(@RequestParam("companyEmail") String companyEmail,
                                       @RequestParam("messageContent") String messageContent,
                                       HttpSession session) {
        StudentDetailModel student = (StudentDetailModel) session.getAttribute("loggedInStudent");
        if (student == null) {
            return "redirect:/studentLogin";
        }

        String normalizedCompanyEmail = companyEmail == null ? "" : companyEmail.trim();
        String normalizedMessage = messageContent == null ? "" : messageContent.trim();

        if (normalizedCompanyEmail.isEmpty() || normalizedMessage.isEmpty()) {
            return "redirect:/studentMessage?error=missing";
        }

        if (companyRegisterRepo.findByEmail(normalizedCompanyEmail) == null) {
            return "redirect:/studentMessage?error=company";
        }

        Message msg = new Message();
        msg.setSenderEmail(student.getEmail());
        msg.setReceiverEmail(normalizedCompanyEmail);
        msg.setSubject("Student Message");
        msg.setContent(normalizedMessage);

        messageService.sendMessage(msg);
        return "redirect:/studentMessage?status=sent";
    }
}