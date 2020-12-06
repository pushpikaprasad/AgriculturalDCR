package com.agriculturaldcr.web.dao;

import java.util.Collection;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.agriculturaldcr.web.entity.Officer;

@Repository
public class OfficerDao {

	@Autowired
	public OfficerRepository officerRepository;

	public Collection<Officer> findAllOfficers() {
		return officerRepository.findAll();
	}

	public Optional<Officer> findOfficerById(int officerId) {
		return officerRepository.findById(officerId);
	}

	public void addOfficer(Officer newOfficer) {
		Officer officer = (Officer) newOfficer;
		try {
			officerRepository.save(officer);
		} catch (NullPointerException e) {
			System.out.println(e.getMessage() + " Officer dao: addOfficer() gives null object!");
		}
	}

	public void updateOfficer(Officer editOfficer) {
		Officer officer = (Officer) editOfficer;
		try {
			officerRepository.save(officer);
		} catch (NullPointerException e) {
			System.out.println(e.getMessage() + " Officer dao: updateOfficer() gives null object!");
		}
	}

	public void deleteOfficer(int id) {
		officerRepository.deleteById(id);
	}
}
