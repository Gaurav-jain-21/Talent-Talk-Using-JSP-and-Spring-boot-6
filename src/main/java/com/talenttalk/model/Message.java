package com.talenttalk.model;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDateTime;

@Entity
@Data
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String senderEmail;   // The one who sends
    private String receiverEmail; // The one who gets it
    private String subject;

    @Column(columnDefinition = "TEXT")
    private String content;

    private LocalDateTime timestamp;
    private boolean isRead = false;

    @PrePersist
    protected void onCreate() {
        timestamp = LocalDateTime.now();
    }
}