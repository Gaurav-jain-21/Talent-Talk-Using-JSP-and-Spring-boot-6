package com.talenttalk.service;

import com.talenttalk.model.CompanyDetailModel;
import com.talenttalk.repo.CompanyRegisterRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CompanyDetailsService {

    @Autowired
    private CompanyRegisterRepo repo;

    // Fetch all companies for the Admin User list
    public List<CompanyDetailModel> getAllCompanies() {
        return repo.findAll();
    }

    // Ability for Admin to remove a company
    public void deleteCompany(Long id) {
        repo.deleteById(id);
    }

    // Count for Admin Dashboard stats
    public long countCompanies() {
        return repo.count();
    }
}