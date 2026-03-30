package com.talenttalk.repo;

import com.talenttalk.model.JobApplication;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ApplicationRepository extends JpaRepository<JobApplication, Long> {
    // This helps the company see all students for a specific job
    List<JobApplication> findByJobId(Long jobId);

    // This prevents a student from applying to the same job twice
    boolean existsByJobIdAndStudentId(Long jobId, Long studentId);
}
