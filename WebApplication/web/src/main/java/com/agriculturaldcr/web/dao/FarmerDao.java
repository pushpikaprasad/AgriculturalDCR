package com.agriculturaldcr.web.dao;

import java.util.Collection;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.agriculturaldcr.web.entity.Farmer;

@Repository
public class FarmerDao {

	@Autowired
	public FarmerRepository farmerRepository;

	public Collection<Farmer> viewAll() {
		return farmerRepository.findAll();
	}

	public Optional<Farmer> viewById(int id) {
		return farmerRepository.findById(id);
	}

	public void addFarmer(Farmer newFarmer) {
		Farmer farmer = (Farmer) newFarmer;
		try {
			farmerRepository.save(farmer);
		} catch (NullPointerException e) {
			System.out.println(e.getMessage() + " Farmer dao: addFarmer() gives null object!");
		}
	}

	public void updateFarmer(Farmer editfarmer) {
		Farmer farmer = (Farmer) editfarmer;
		try {
			farmerRepository.save(farmer);
		} catch (NullPointerException e) {
			System.out.println(e.getMessage() + " Farmer dao: updateFarmer() gives null object!");
		}
	}

	public void deleteFarmer(int id) {
		farmerRepository.deleteById(id);
	}

}
