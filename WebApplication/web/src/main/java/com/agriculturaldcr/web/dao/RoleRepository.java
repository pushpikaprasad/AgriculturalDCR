package com.agriculturaldcr.web.dao;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.agriculturaldcr.web.entity.Role;

public interface RoleRepository extends MongoRepository<Role, String>{	
	Role findByRole(String role);
}
