package com.talenttalk.service;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.repo.CompanyRegisterRepo; // Import your repo
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyLoginServices {

    @Autowired
    private CompanyRegisterRepo repo;

    public CompanyDetailModel authenticate(String email, String password) {
        CompanyDetailModel company = repo.findByEmail(email);

        // Check if company exists and password matches
        if (company != null && company.getPassword().equals(password)) {
            return company;
        }
        return null;
    }
}