package com.demo.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.demo.demo.entity.User;
import com.demo.demo.service.UserService;

@RestController
public class DataController {

    @Autowired
    private UserService userService;

    @GetMapping("/status")
    public ResponseEntity<String> helloWorld(){
        return new ResponseEntity<>("App is running...!", HttpStatus.OK);
    }


    @CrossOrigin("*")
    @PostMapping(value = "/save")
    public ResponseEntity<User> saveUserInfo(@RequestBody User user){
        return new ResponseEntity<>(userService.saveUser(user), HttpStatus.CREATED);
    }





    
}
