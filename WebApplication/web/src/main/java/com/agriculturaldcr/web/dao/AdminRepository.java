package com.agriculturaldcr.web.dao;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

import com.agriculturaldcr.web.entity.Admin;

@Repository
public interface AdminRepository extends MongoRepository<Admin, Integer> {

	@Query("{username : ?0, password : ?1}")
	Admin findAdminByUsernameAndPassword(String username, String password);
	
	
}
