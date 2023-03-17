package com.demo.demo.repository;

import org.springframework.data.repository.CrudRepository;
import com.demo.demo.entity.User;

public interface UserRepository extends CrudRepository<User, Long>{
    
}
