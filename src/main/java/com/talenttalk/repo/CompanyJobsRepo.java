package com.talenttalk.repo;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.model.CompanyJob;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CompanyJobsRepo extends JpaRepository<CompanyJob,Long> {
    List<CompanyJob> findByCompany(CompanyDetailModel company);
    long countByCompany_Id(Long companyId);
}
