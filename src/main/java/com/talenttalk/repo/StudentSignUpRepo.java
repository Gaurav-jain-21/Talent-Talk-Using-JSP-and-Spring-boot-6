package com.talenttalk.repo;

import com.talenttalk.model.StudentDetailModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface StudentSignUpRepo extends JpaRepository<StudentDetailModel, Integer> {
    Optional<StudentDetailModel> findByEmail(String email);
}
