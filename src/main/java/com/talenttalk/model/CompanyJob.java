package com.talenttalk.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@Entity
@Table(name = "companyjobs")
public class CompanyJob {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;
    private String jobtitle;
    private String projecttype;
    private int payment;
    private String timeline;
    @Column(columnDefinition = "TEXT")
    private String projectdescription;
    @ManyToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="company_id",nullable=false)
    private CompanyDetailModel company;

}
