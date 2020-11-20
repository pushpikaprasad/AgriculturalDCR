package com.agriculturaldcr.web.dao;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

import com.agriculturaldcr.web.entity.Officer;

@Repository
public interface OfficerRepository extends MongoRepository<Officer, Integer> {

	@Query("{username : ?0, password : ?1}")
	Officer findOffierByUsernameAndPassword(String username, String password);
}
