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

}
