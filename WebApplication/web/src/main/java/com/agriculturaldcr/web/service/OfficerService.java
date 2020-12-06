package com.agriculturaldcr.web.service;

import java.util.Collection;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.agriculturaldcr.web.dao.AdminDao;
import com.agriculturaldcr.web.dao.CultivationDao;
import com.agriculturaldcr.web.dao.FarmerDao;
import com.agriculturaldcr.web.dao.OfficerDao;
import com.agriculturaldcr.web.entity.Cultivation;
import com.agriculturaldcr.web.entity.Farmer;
import com.agriculturaldcr.web.entity.Officer;

@Service
public class OfficerService {

	@Autowired
	public AdminDao adminDao;
	@Autowired
	public CultivationDao cultivationDao;
	@Autowired
	public FarmerDao farmerDao;
	@Autowired
	public OfficerDao officerDao;

	// officer account creation
	public void officerRegistration(Officer officer) {
		officerDao.addOfficer(officer);
	}
	
	// view officer by Id
	public Optional<Officer> viewOfficerById(int officerId){
		return officerDao.findOfficerById(officerId);
	}

	// update officer account
	public void updateOfficer(Officer officer) {
		officerDao.updateOfficer(officer);
	}

	// Display farmer
	public Optional<Farmer> viewFarmerById(int farmerId) {
		return farmerDao.viewById(farmerId);
	}

	// Display All Farmers
	public Collection<Farmer> viewAllFarmers() {
		return farmerDao.viewAll();
	}

	// add farmer details
	public void addFarmer(Farmer newFarmer) {
		farmerDao.addFarmer(newFarmer);
	}

	// update farmer Details
	public void updateFarmer(Farmer editFarmer) {
		farmerDao.updateFarmer(editFarmer);
	}

	// view cultivations
	public Collection<Cultivation> viewAllCultivations() {
		return cultivationDao.findAll();
	}

	// add cultivation
	public void addCultivation(Cultivation cultivation) {
		cultivationDao.add(cultivation);
	}

	// update cultivation
	public void updateCultivation(Cultivation cultivation) {
		cultivationDao.update(cultivation);
	}

	// Generate report
	public void generateReport() {
		// need to implement
	}

}
