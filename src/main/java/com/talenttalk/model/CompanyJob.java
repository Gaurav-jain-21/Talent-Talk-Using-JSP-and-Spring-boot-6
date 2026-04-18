package com.talenttalk.model;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

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
    @ToString.Exclude
    private CompanyDetailModel company;
    @OneToMany(mappedBy = "job", cascade = CascadeType.ALL, orphanRemoval = true)
    @ToString.Exclude
    private java.util.List<JobApplication> applications;

    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        this.Id = id;
    }

    public String getJobtitle() {
        return jobtitle;
    }

    public void setJobtitle(String jobtitle) {
        this.jobtitle = jobtitle;
    }

    public String getProjecttype() {
        return projecttype;
    }

    public void setProjecttype(String projecttype) {
        this.projecttype = projecttype;
    }

    public int getPayment() {
        return payment;
    }

    public void setPayment(int payment) {
        this.payment = payment;
    }

    public String getTimeline() {
        return timeline;
    }

    public void setTimeline(String timeline) {
        this.timeline = timeline;
    }

    public String getProjectdescription() {
        return projectdescription;
    }

    public void setProjectdescription(String projectdescription) {
        this.projectdescription = projectdescription;
    }

    public CompanyDetailModel getCompany() {
        return company;
    }

    public void setCompany(CompanyDetailModel company) {
        this.company = company;
    }

    public java.util.List<JobApplication> getApplications() {
        return applications;
    }

    public void setApplications(java.util.List<JobApplication> applications) {
        this.applications = applications;
    }

}
