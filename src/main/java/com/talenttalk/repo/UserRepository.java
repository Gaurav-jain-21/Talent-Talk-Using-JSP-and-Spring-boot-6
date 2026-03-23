package com.talenttalk.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.talenttalk.model.model;


public interface UserRepository extends JpaRepository<model, Integer> {
}