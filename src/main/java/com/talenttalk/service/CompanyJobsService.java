package com.talenttalk.service;

import com.talenttalk.model.CompanyJob;
import com.talenttalk.repo.CompanyJobsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyJobsService {
    @Autowired
    private CompanyJobsRepo repo;
    public void saveJob(CompanyJob job) {
        repo.save(job);
    }
}
