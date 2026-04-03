package com.talenttalk.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@Data
@NoArgsConstructor
@Entity
@Table(name="companies")
public class CompanyDetailModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String email;
    private String password;
    private String industry;
    private String headQuarter;

    @Column(name = "reset_token")
    private String resetToken;

    @OneToMany(mappedBy="company",cascade=CascadeType.ALL)
    @ToString.Exclude // <--- ADD THIS
    private List<CompanyJob> jobs;


}