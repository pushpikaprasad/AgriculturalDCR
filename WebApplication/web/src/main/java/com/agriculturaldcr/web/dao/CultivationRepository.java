package com.agriculturaldcr.web.dao;

import java.util.Collection;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;

import com.agriculturaldcr.web.entity.Cultivation;

@Repository
public interface CultivationRepository extends MongoRepository<Cultivation, String> {

	@Query("{location : ?0}")
	Cultivation viewCultivationsByPlace(String location);
	
	@Query("{farmerId: ?0}")
	Collection<Cultivation> viewCultivationByFarmerId(int FramerId);
}