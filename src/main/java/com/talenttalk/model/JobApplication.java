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

    private LocalDateTime paymentDate;

    // Inside JobApplication.java or your Project Model
    private int progressStep = 1; // 1: Started, 2: In Progress, 3: Completed

    private String paymentStatus = "Pending";

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public CompanyJob getJob() {
        return job;
    }

    public void setJob(CompanyJob job) {
        this.job = job;
    }

    public StudentDetailModel getStudent() {
        return student;
    }

    public void setStudent(StudentDetailModel student) {
        this.student = student;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public LocalDateTime getAppliedDate() {
        return appliedDate;
    }

    public void setAppliedDate(LocalDateTime appliedDate) {
        this.appliedDate = appliedDate;
    }

    public LocalDateTime getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(LocalDateTime paymentDate) {
        this.paymentDate = paymentDate;
    }

    public int getProgressStep() {
        return progressStep;
    }

    public void setProgressStep(int progressStep) {
        this.progressStep = progressStep;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

}
