package com.talenttalk.repo;

import com.talenttalk.model.StudentDetailModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface StudentSignUpRepo extends JpaRepository<StudentDetailModel, Long> {
    Optional<StudentDetailModel> findByEmail(String email);
    Optional<StudentDetailModel> findByResetToken(String resetToken);

    // Using a Query to get just the first name (or full name) by ID
    @Query("SELECT s.firstName FROM StudentDetailModel s WHERE s.id = :id")
    String findByNameId(@Param("id") Long id);
}