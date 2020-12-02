package com.agriculturaldcr.web.service;

import java.util.Collection;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.agriculturaldcr.web.dao.CultivationDao;
import com.agriculturaldcr.web.dao.FarmerRepository;
import com.agriculturaldcr.web.entity.Cultivation;

@Service
public class CultivationService {

	@Autowired
	private CultivationDao cultivationDao;
	@Autowired
	private FarmerRepository farmerDao;

	// search cultivation by id
	public Optional<Cultivation> view(String cultivationId) { // view record
		return cultivationDao.findById(cultivationId);
	}

	// view all cultivations
	public Collection<Cultivation> viewAll() { // view records
		return cultivationDao.findAll();
	}

	// add cultivation
	public void add(Cultivation cultivation) { // add record
		if (farmerDao.findById(cultivation.getFarmerId()) != null) {
			cultivationDao.add(cultivation);
		} else {
			System.out.println("Farmer " + farmerDao.findById(cultivation.getFarmerId()).get().getFarmerName()
					+ " does not exists in the system!");
		}
	}

	// update cultivation
	public void update(Cultivation cultivation) { // update record
		cultivationDao.update(cultivation);
	}

	// delete cultivation
	public void delete(String cultivationId) { // delete record
		cultivationDao.delete(cultivationId);
	}
	 
	//get farmer name
	public String viewFarmerName(String cultivationId) { // add record
		String farmerName = farmerDao.findById(cultivationDao.findById(cultivationId).get().getFarmerId()).get().getFarmerName(); 
		return farmerName;
	}

}
