package com.talenttalk.service;

import com.talenttalk.model.StudentDetailModel;
import com.talenttalk.repo.StudentSignUpRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class StudentService {

    @Autowired
    private StudentSignUpRepo repo;

    // Fetch all students for the Admin User list
    public List<StudentDetailModel> getAllStudents() {
        return repo.findAll();
    }

    // Ability for Admin to remove a student
    public void deleteStudent(Long id) {
        repo.deleteById(id);
    }

    // Count for Admin Dashboard stats
    public long countStudents() {
        return repo.count();
    }
}