package com.talenttalk.service;

import com.talenttalk.model.StudentDetailModel;
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
}
