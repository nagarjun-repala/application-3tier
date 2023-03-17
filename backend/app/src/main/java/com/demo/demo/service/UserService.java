package com.demo.demo.service;

import org.springframework.stereotype.Service;

import com.demo.demo.entity.User;

@Service
public interface UserService {
    
    User saveUser(User user);
}
