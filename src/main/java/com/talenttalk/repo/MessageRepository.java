package com.talenttalk.repo;

import com.talenttalk.model.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface MessageRepository extends JpaRepository<Message, Long> {
    // For the Student/Company Inbox
    List<Message> findByReceiverEmailOrderByTimestampDesc(String email);

    // For the Sent folder
    List<Message> findBySenderEmailOrderByTimestampDesc(String email);

    // Custom Query: Join Message with StudentDetailModel based on the email
    @Query("SELECT COUNT(m) FROM Message m WHERE m.receiverEmail = " +
            "(SELECT s.email FROM StudentDetailModel s WHERE s.id = :studentId)")
    long countByStudentId(@Param("studentId") Long studentId);

    // Optional: Count only UNREAD messages for the dashboard
    @Query("SELECT COUNT(m) FROM Message m WHERE m.isRead = false AND m.receiverEmail = " +
            "(SELECT s.email FROM StudentDetailModel s WHERE s.id = :studentId)")
    long countUnreadByStudentId(@Param("studentId") Long studentId);
}