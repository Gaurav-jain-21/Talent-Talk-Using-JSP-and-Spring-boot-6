package com.talenttalk.service;

import com.talenttalk.model.JobApplication;
import com.talenttalk.repo.ApplicationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JobApplicationService {
    @Autowired
    private ApplicationRepository repo;

    public List<JobApplication> findByCompanyId(Long id) {
        // Changed from findByJobId to findByJob_Company_Id
        return repo.findByJob_Company_Id(id);
    }
    public JobApplication findById(Long appId) {
        return repo.findById(appId).orElse(null);
    }


}
