package com.talenttalk.repo;

import com.talenttalk.model.CompanyDetailModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CompanyRegisterRepo extends JpaRepository<CompanyDetailModel, Long> {
    // Spring now correctly maps this to the 'email' field in your Model
    CompanyDetailModel findByEmail(String email);
}