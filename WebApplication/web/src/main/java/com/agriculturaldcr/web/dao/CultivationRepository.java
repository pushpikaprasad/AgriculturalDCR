package com.agriculturaldcr.web.dao;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.agriculturaldcr.web.entity.Cultivation;

@Repository
public interface CultivationRepository extends MongoRepository<Cultivation, String>{
	
}