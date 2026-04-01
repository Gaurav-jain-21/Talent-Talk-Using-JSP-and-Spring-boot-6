package com.talenttalk.repo;

import com.talenttalk.model.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface MessageRepository extends JpaRepository<Message, Long> {
    // For the Student/Company Inbox
    List<Message> findByReceiverEmailOrderByTimestampDesc(String email);

    // For the Sent folder
    List<Message> findBySenderEmailOrderByTimestampDesc(String email);
}