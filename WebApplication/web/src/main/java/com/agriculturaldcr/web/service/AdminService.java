package com.agriculturaldcr.web.service;

import java.util.Collection;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.agriculturaldcr.web.dao.AdminDao;
import com.agriculturaldcr.web.dao.CultivationDao;
import com.agriculturaldcr.web.dao.FarmerDao;
import com.agriculturaldcr.web.dao.OfficerDao;
import com.agriculturaldcr.web.entity.Admin;
import com.agriculturaldcr.web.entity.Cultivation;
import com.agriculturaldcr.web.entity.Farmer;
import com.agriculturaldcr.web.entity.Officer;

@Service
public class AdminService {

	@Autowired
	public AdminDao adminDao;
	@Autowired
	public CultivationDao cultivationDao;
	@Autowired
	public FarmerDao farmerDao;
	@Autowired
	public OfficerDao officerDao;

	// Admin logging
	public Admin adminLoging(String username, String password) {
		return adminDao.findAdmin(username, password);
	}
	
	//View Admin
	public Optional<Admin> viewAdminById(int adminId) {
		return adminDao.findAdminById(adminId);
	}

	// Admin account creation
	public void adminRegistration(Admin newAdmin) {
		adminDao.addAdmin(newAdmin);
	}

	// Update admin
	public void updateAdmin(Admin admin) {
		adminDao.updateAdmin(admin);
	}

	// Delete admin
	public void deleteAdmin(int id) {
		adminDao.deleteAdmin(id);
	}

	// Display buyer --> need to implement

	// display officers
	public Collection<Officer> viewAllOfficers() {
		return officerDao.findAllOfficers();
	}

	// Display officer
	public Optional<Officer> viewOfficerById(int officerId) {
		return officerDao.findOfficerById(officerId);
	}

	// Create officer account
	public void createOfficerAccount(Officer newOffier) {
		officerDao.addOfficer(newOffier);
	}

	// Manage officer account
	public void updateOfficerAccount(Officer officer) {
		officerDao.updateOfficer(officer);
	}

	// Delete officer account
	public void deleteOfficerAccount(int id) {
		officerDao.deleteOfficer(id);
	}

	// Display All Farmers
	public Collection<Farmer> viewAllFarmers() {
		return farmerDao.viewAll();
	}

	// Display farmer
	public Optional<Farmer> viewFarmerById(int farmerId) {
		return farmerDao.viewById(farmerId);
	}

	// add farmer details
	public void addFarmer(Farmer newFarmer) {
		farmerDao.addFarmer(newFarmer);
	}

	// update farmer Details
	public void updateFarmer(Farmer editFarmer) {
		farmerDao.updateFarmer(editFarmer);
	}

	// Delete farmer details
	public void deleteFarmer(int farmerId) {
		farmerDao.deleteFarmer(farmerId);
	}

	// View all cultivations
	public Collection<Cultivation> viewAllCultivations() {
		return cultivationDao.findAll();
	}

	// view cultivation by Id
	public Cultivation viewCultivationByPlace(String location) {
		return cultivationDao.viewCultivationByPlace(location);
	}

	// add cultivation
	public void addCultivation(Cultivation cultivation) {
		cultivationDao.add(cultivation);
	}

	// update cultivation
	public void updateCultivation(Cultivation cultivation) {
		cultivationDao.update(cultivation);
	}

	// Delete cultivation by id
	public void deleteCultivationDetailById(String cultivationId) {
		cultivationDao.delete(cultivationId);
	}

	// Generate report
	public void generateReport() {
		// need to implement
	}
}
