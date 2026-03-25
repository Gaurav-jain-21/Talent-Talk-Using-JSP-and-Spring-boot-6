package com.talenttalk.model;

import jakarta.persistence.*;

@Entity
@Table(name="companies")
public class CompanyDetailModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;
    private String Name;
    private String Email;
    private String Password;
    private String Industry;
    private String HeadQuarter;

    public CompanyDetailModel() {
    }

    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        Id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getIndustry() {
        return Industry;
    }

    public void setIndustry(String industry) {
        Industry = industry;
    }

    public String getHeadQuarter() {
        return HeadQuarter;
    }

    public void setHeadQuarter(String headQuarter) {
        HeadQuarter = headQuarter;
    }
}
