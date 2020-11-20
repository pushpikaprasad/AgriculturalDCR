package com.agriculturaldcr.web.dao;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.agriculturaldcr.web.entity.Farmer;

@Repository
public interface FarmerRepository extends MongoRepository<Farmer, Integer> {

}
