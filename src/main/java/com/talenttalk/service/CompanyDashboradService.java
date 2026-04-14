package com.talenttalk.service;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.model.JobApplication;
import com.talenttalk.repo.ApplicationRepository;
import com.talenttalk.repo.CompanyJobsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyDashboradService {
    @Autowired
    private CompanyJobsRepo repo;

    @Autowired
    private ApplicationRepository applicationRepository;

    public long getActiveJobCount(CompanyDetailModel company) {
        // Pass the ID specifically
        return repo.countByCompany_Id(company.getId());
    }

    public long getJobPostCount(Long companyId) {
        return repo.countByCompany_Id(companyId);
    }

    public long getTotalClientCount(Long companyId) {
        return applicationRepository.countDistinctStudent_IdByJob_Company_Id(companyId);
    }

    public List<JobApplication> getApplicationsForCompany(Long companyId) {
        return applicationRepository.findByJob_Company_Id(companyId);
    }
}
