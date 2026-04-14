package com.talenttalk.repo;

import com.talenttalk.model.JobApplication;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ApplicationRepository extends JpaRepository<JobApplication, Long> {

    // 1. For Company Client Page: Find by Company ID (via Job) and Status (e.g., "Accepted")
    List<JobApplication> findByJob_Company_IdAndStatus(Long companyId, String status);

    // 2. For Student Progress Page: Find by Student ID and Status (e.g., "Accepted")
    List<JobApplication> findByStudent_IdAndStatus(Long studentId, String status);

    // 3. For Company Dashboard: Find all applications for a specific company
    List<JobApplication> findByJob_Company_Id(Long companyId);

    // 3b. For Company Application page: exclude shortlisted entries
    List<JobApplication> findByJob_Company_IdAndStatusNotIgnoreCase(Long companyId, String status);

    // 4. For Application Management: Check if a student already applied to a job
    boolean existsByJob_IdAndStudent_Id(Long jobId, Long studentId);

    // 5. General search by Status
    List<JobApplication> findByStatus(String status);

    // 6. Find all applications for a specific Job
    List<JobApplication> findByJob_Id(Long jobId);

    // 7. Payment page: only completed projects (progressStep = 3) for a company
    List<JobApplication> findByJob_Company_IdAndProgressStep(Long companyId, int progressStep);

    // 8. Payment action: ensure the application belongs to the logged-in company
    Optional<JobApplication> findByIdAndJob_Company_Id(Long appId, Long companyId);

    // 9. Student payment page: completed projects (progressStep = 3) for a student
    List<JobApplication> findByStudent_IdAndProgressStep(Long studentId, int progressStep);

    // 10. Dashboard: total jobs student has applied for
    long countByStudent_Id(Long studentId);

    // 11. Company dashboard: unique applicants (clients) count for a company
    long countDistinctStudent_IdByJob_Company_Id(Long companyId);
}