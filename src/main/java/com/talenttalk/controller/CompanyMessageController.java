package com.talenttalk.controller;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.model.Message;
import com.talenttalk.service.MessageService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class CompanyMessageController {

    @Autowired
    private MessageService messageService;

    @GetMapping("/companyMessage")
    public String showCompanyMessages(HttpSession session, Model model) {

        // 1. Get the OBJECT from the session using the correct key
        CompanyDetailModel company = (CompanyDetailModel) session.getAttribute("loggedInCompany");

        // 2. Check if the object exists
        if (company == null) {
            System.out.println("DEBUG: No 'loggedInCompany' found in session. Redirecting...");
            return "redirect:/companyLogin";
        }

        // 3. Get the email FROM the object
        String companyEmail = company.getEmail();
        System.out.println("DEBUG: Logged in as: " + companyEmail);

        // 4. Fetch messages and send to JSP
        model.addAttribute("messages", messageService.getInbox(companyEmail));

        return "companyMessage";
    }

    @PostMapping("/sendMessage")
    public String sendMessage(@RequestParam("clientEmail") String clientEmail,
                              @RequestParam("messageContent") String messageContent,
                              HttpSession session) {

        // Use the same logic here to get the sender's email
        CompanyDetailModel company = (CompanyDetailModel) session.getAttribute("loggedInCompany");

        if (company == null) {
            return "redirect:/companyLogin";
        }

        Message msg = new Message();
        msg.setSenderEmail(company.getEmail()); // Extract email here
        msg.setReceiverEmail(clientEmail);
        msg.setSubject("Project Requirement");
        msg.setContent(messageContent);

        messageService.sendMessage(msg);

        return "redirect:/companyMessage?status=sent";
    }
}