package com.talenttalk.model;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity
public class JobApplication {
    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private CompanyJob job;

    @ManyToOne
    private StudentDetailModel student;

    private String status= "Applied";
    private LocalDateTime appliedDate = LocalDateTime.now();

    // Inside JobApplication.java or your Project Model
    private int progressStep = 1; // 1: Started, 2: In Progress, 3: Completed

    private String paymentStatus = "Pending";

}
