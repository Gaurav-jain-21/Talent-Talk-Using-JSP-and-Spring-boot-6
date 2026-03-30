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
        return repo.findByNameId(Math.toIntExact(currentStudent.getId()));
    }

    public void save(StudentDetailModel student) {
        repo.save(student);
    }
}
