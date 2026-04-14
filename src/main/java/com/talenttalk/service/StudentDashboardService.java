package com.talenttalk.service;

import com.talenttalk.model.StudentDetailModel;
import com.talenttalk.repo.CompanyJobsRepo;
import com.talenttalk.repo.CompanyRegisterRepo;
import com.talenttalk.repo.MessageRepository;
import com.talenttalk.repo.ApplicationRepository;
import com.talenttalk.repo.StudentSignUpRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentDashboardService {
    @Autowired
    private StudentSignUpRepo repo;
    public String getStudentName(StudentDetailModel currentStudent) {
        if (currentStudent == null) {
            return "";
        }
        return currentStudent.getFirstName();
    }

    public void save(StudentDetailModel student) {
        repo.save(student);
    }

    public StudentDetailModel getStudentById(Long id) {
        return repo.findById(id).orElse(null);
    }

    @Autowired
    private CompanyRegisterRepo companyRepo;
    @Autowired
    private CompanyJobsRepo jobRepo;

    @Autowired
    private MessageRepository messageRepo;

    @Autowired
    private ApplicationRepository applicationRepository;

    public long getTotalCompanies() {
        return companyRepo.count();
    }

    public long getTotalJobs() {
        return jobRepo.count();
    }

    public long getMessageCountForStudent(Long studentId) {
        // Replace 'studentId' with the actual field name in your Message entity
        return messageRepo.countByStudentId(studentId);
    }

    public long getAppliedJobsCountForStudent(Long studentId) {
        return applicationRepository.countByStudent_Id(studentId);
    }
}
