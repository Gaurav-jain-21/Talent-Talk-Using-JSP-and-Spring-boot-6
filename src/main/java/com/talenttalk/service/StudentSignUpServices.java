package com.talenttalk.service;

import com.talenttalk.model.StudentDetailModel;
import com.talenttalk.repo.StudentSignUpRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentSignUpServices {

    @Autowired
    private StudentSignUpRepo repo;

    public void registerStudent(StudentDetailModel student) {
        repo.save(student);
    }
}