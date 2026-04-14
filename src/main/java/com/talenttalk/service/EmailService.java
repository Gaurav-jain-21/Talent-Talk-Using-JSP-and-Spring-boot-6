package com.talenttalk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailService {
    @Autowired
    private JavaMailSender mailSender;

    @Value("${spring.mail.username}")
    private String fromEmail;

    public void sendResetEmail(String to, String resetLink) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(fromEmail);
        message.setTo(to);
        message.setSubject("Password Reset Request - Talent Talk");
        message.setText("Click the link below to reset your password:\n" + resetLink);
        mailSender.send(message);
    }

    public void sendStudentRegistrationSuccessEmail(String to, String studentName) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(fromEmail);
        message.setTo(to);
        message.setSubject("Registration Successful - Talent Talk");

        String displayName = (studentName != null && !studentName.trim().isEmpty()) ? studentName.trim() : "Student";
        message.setText("Hi " + displayName + ",\n\n"
                + "Your registration on Talent Talk was successful.\n"
                + "You can now log in and start using your account.\n\n"
                + "Regards,\nTalent Talk Team");

        mailSender.send(message);
    }

    public void sendCompanyRegistrationSuccessEmail(String to, String companyName) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(fromEmail);
        message.setTo(to);
        message.setSubject("Company Registration Successful - Talent Talk");

        String displayName = (companyName != null && !companyName.trim().isEmpty()) ? companyName.trim() : "Company";
        message.setText("Hi " + displayName + ",\n\n"
                + "Your company account registration on Talent Talk was successful.\n"
                + "You can now log in and start posting jobs.\n\n"
                + "Regards,\nTalent Talk Team");

        mailSender.send(message);
    }

    public void sendApplicationRejectionEmail(String to, String studentName, String jobTitle) {
        if (to == null || to.trim().isEmpty()) {
            return;
        }

        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(fromEmail);
        message.setTo(to);
        message.setSubject("Application Update - Talent Talk");

        String displayName = (studentName != null && !studentName.trim().isEmpty()) ? studentName.trim() : "Student";
        String displayJobTitle = (jobTitle != null && !jobTitle.trim().isEmpty()) ? jobTitle.trim() : "the position";

        message.setText("Hi " + displayName + ",\n\n"
                + "We are sorry to inform you that your application for " + displayJobTitle + " was not selected at this time.\n"
                + "Better luck next time.\n\n"
                + "Regards,\nTalent Talk Team");

        mailSender.send(message);
    }
}
