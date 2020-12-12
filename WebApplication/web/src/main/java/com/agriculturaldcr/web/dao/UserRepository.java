package com.agriculturaldcr.web.dao;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.agriculturaldcr.web.entity.User;


public interface UserRepository extends MongoRepository<User, String> {
	User findByUsername(String Username);
	User findByEmail(String Email);
}
