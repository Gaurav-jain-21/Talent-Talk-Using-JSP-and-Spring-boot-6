package com.talenttalk.service;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.repo.CompanyRegisterRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyRegisterServices {

    @Autowired
    private CompanyRegisterRepo repo;

    public void saveCompany(CompanyDetailModel company) {
        repo.save(company);
    }
}