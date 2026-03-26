package com.talenttalk.service;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.repo.CompanyJobsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyDashboradService {
    @Autowired
    private CompanyJobsRepo repo;
    public long getActiveJobCount(CompanyDetailModel company) {
        // Pass the ID specifically
        return repo.countByCompany_Id(company.getId());
    }
}
