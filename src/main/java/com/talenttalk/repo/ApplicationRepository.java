package com.talenttalk.repo;

import com.talenttalk.model.JobApplication;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ApplicationRepository extends JpaRepository<JobApplication, Long> {

    // Use an underscore or a custom query to traverse the relationship:
    // JobApplication -> CompanyJob (job) -> CompanyDetailModel (company) -> id
    List<JobApplication> findByJob_Company_Id(Long companyId);

    List<JobApplication> findByJobId(Long jobId);
    boolean existsByJobIdAndStudentId(Long jobId, Long studentId);

    List<JobApplication> findByStatus(String status);

    List<JobApplication> findByStudentIdAndStatus(Long studentId, String status);
    List<JobApplication> findByJob_Company_IdAndStatus(Long companyId, String status);

}