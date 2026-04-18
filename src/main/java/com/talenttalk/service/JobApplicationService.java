package com.talenttalk.service;

import com.talenttalk.model.JobApplication;
import com.talenttalk.repo.ApplicationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class JobApplicationService {
    @Autowired
    private ApplicationRepository repo;

    public List<JobApplication> findByCompanyId(Long id) {
        // Company application page should not show already shortlisted applications
        return repo.findByJob_Company_IdAndStatusNotIgnoreCase(id, "Shortlisted");
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

    public List<JobApplication> getApplicationsByCompanyAndStatus(Long companyId, String status) {
        return repo.findByJob_Company_IdAndStatus(companyId, status);
    }

    public List<JobApplication> getApplicationsByStudentAndStatus(Long studentId, String status) {
        return repo.findByStudent_IdAndStatus(studentId, status);
    }

    public List<JobApplication> getCompletedApplicationsForCompany(Long companyId) {
        return repo.findByJob_Company_IdAndProgressStep(companyId, 3);
    }

    public void markPaymentAsPaid(Long companyId, Long appId) {
        repo.findByIdAndJob_Company_Id(appId, companyId).ifPresent(app -> {
            if (app.getProgressStep() == 3) {
                app.setPaymentStatus("Paid");
                if (app.getPaymentDate() == null) {
                    app.setPaymentDate(LocalDateTime.now());
                }
                repo.save(app);
            }
        });
    }

    public JobApplication getPayableApplicationForCompany(Long companyId, Long appId) {
        JobApplication app = repo.findByIdAndJob_Company_Id(appId, companyId).orElse(null);
        if (app == null) {
            return null;
        }
        if (app.getProgressStep() != 3) {
            return null;
        }
        return app;
    }

    public List<JobApplication> getCompletedApplicationsForStudent(Long studentId) {
        return repo.findByStudent_IdAndProgressStep(studentId, 3);
    }

    public int getTotalPaidAmountForStudent(Long studentId) {
        return getCompletedApplicationsForStudent(studentId).stream()
                .filter(app -> "Paid".equalsIgnoreCase(app.getPaymentStatus()))
                .mapToInt(app -> app.getJob() != null ? app.getJob().getPayment() : 0)
                .sum();
    }
}
