package com.talenttalk.service;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.model.CompanyJob;
import com.talenttalk.repo.CompanyJobsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CompanyJobsService {
    @Autowired
    private CompanyJobsRepo repo;
    public void saveJob(CompanyJob job) {
        repo.save(job);
    }

    public List<CompanyJob> getJobsByCompany(CompanyDetailModel currentCompany) {
        return repo.findByCompany(currentCompany);
    }
}
