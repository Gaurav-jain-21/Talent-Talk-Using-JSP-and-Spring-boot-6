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

    public void rejectApplication(Long appId) {
        JobApplication app = repo.findById(appId).orElse(null);
        if (app != null) {
            // Set the status so it moves to the 'Rejected' tab in your UI

            repo.deleteById(appId);
        }
    }

    // Alternative: If you just want to remove it from the database
    public void deleteApplication(Long appId) {
        repo.deleteById(appId);
    }

    public void shortlistCandidate(Long appId) {
        repo.findById(appId).ifPresent(app -> {
            app.setStatus("Shortlisted");
            repo.save(app);
        });
    }

    public List<JobApplication> getShortlistedCandidates() {
        return repo.findByStatus("Shortlisted");
    }

    /**
     * The completed method for your Company Client page.
     * It filters by the logged-in company's ID and the status (e.g., "Accepted").
     */
    public List<JobApplication> getApplicationsByCompanyAndStatus(Long companyId, String status) {
        return repo.findByJob_Company_IdAndStatus(companyId, status);
    }
}
