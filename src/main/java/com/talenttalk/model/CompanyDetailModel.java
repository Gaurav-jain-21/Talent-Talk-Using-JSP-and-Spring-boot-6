package com.talenttalk.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

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
    @OneToMany(mappedBy="company",cascade=CascadeType.ALL)
    private List<CompanyJob> jobs;


}