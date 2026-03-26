package com.talenttalk.service;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.model.CompanyJob;
import com.talenttalk.repo.CompanyJobsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

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

    public void deleteJobById(Long id) {
        repo.deleteById(id);
    }

    public CompanyJob getJobById(Long id) {
        Optional<CompanyJob> job = repo.findById(id);
        return job.orElse(null); // Return the job if it exists, otherwise null
    }
}
