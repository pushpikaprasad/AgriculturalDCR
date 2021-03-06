package com.agriculturaldcr.web.dao;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.agriculturaldcr.web.entity.Officer;

@Repository
public interface OfficerRepository extends MongoRepository<Officer, Integer> {

}
