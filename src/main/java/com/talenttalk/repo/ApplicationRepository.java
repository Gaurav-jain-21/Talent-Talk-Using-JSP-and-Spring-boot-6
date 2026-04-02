package com.talenttalk.repo;

import com.talenttalk.model.JobApplication;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ApplicationRepository extends JpaRepository<JobApplication, Long> {

    // 1. For Company Client Page: Find by Company ID (via Job) and Status (e.g., "Accepted")
    List<JobApplication> findByJob_Company_IdAndStatus(Long companyId, String status);

    // 2. For Student Progress Page: Find by Student ID and Status (e.g., "Accepted")
    List<JobApplication> findByStudent_IdAndStatus(Long studentId, String status);

    // 3. For Company Dashboard: Find all applications for a specific company
    List<JobApplication> findByJob_Company_Id(Long companyId);

    // 4. For Application Management: Check if a student already applied to a job
    boolean existsByJob_IdAndStudent_Id(Long jobId, Long studentId);

    // 5. General search by Status
    List<JobApplication> findByStatus(String status);

    // 6. Find all applications for a specific Job
    List<JobApplication> findByJob_Id(Long jobId);
}