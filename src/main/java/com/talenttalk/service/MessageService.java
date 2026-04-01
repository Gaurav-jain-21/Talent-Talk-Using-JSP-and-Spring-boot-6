package com.talenttalk.service;

import com.talenttalk.model.Message;
import com.talenttalk.repo.MessageRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class MessageService {

    @Autowired
    private MessageRepository repo;

    public void sendMessage(Message msg) {
        repo.save(msg);
    }

    public List<Message> getInbox(String email) {
        return repo.findByReceiverEmailOrderByTimestampDesc(email);
    }

    public void deleteMessage(Long id) {
        repo.deleteById(id);
    }
}