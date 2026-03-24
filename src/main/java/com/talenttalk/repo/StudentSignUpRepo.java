package com.talenttalk.repo;

import com.talenttalk.model.StudentDetailModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StudentSignUpRepo extends JpaRepository<StudentDetailModel, Integer> {
}