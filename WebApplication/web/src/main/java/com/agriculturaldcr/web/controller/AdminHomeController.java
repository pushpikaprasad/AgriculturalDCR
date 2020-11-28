package com.agriculturaldcr.web.controller;

import java.util.Collection;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.agriculturaldcr.web.entity.Admin;
import com.agriculturaldcr.web.entity.Cultivation;
import com.agriculturaldcr.web.entity.Farmer;
import com.agriculturaldcr.web.entity.Officer;
import com.agriculturaldcr.web.service.AdminService;

@RestController
@RequestMapping("/Admin")
public class AdminHomeController {

	@Autowired
	AdminService adminService;

	// Admin home page
	@GetMapping(produces = MediaType.TEXT_HTML_VALUE)
	public ModelAndView welcomePage(String name, Model model) {
		System.out.print("Admin control : welcome page!");
		model.addAttribute("title", "Centralized Agricultural Data Collector and Reviewer System");
		model.addAttribute("subtitle", "System Adiministrator Home Page");
		model.addAttribute("message", "Welcome...!");
		model.addAttribute("AdminId","1");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("AdminHome");
		return modelAndView;
	}
	
	// Admin manage-officer page
		@GetMapping(value = { "/manage-officers"}, produces = MediaType.TEXT_HTML_VALUE)
		public ModelAndView officerControlPage(String name, Model model) {
			System.out.print("Admin control : welcome page!");
			model.addAttribute("AdminId","1");
			
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("manage-officers");
			return modelAndView;
		}
	
	// view Admin
	@GetMapping(value = { "/{adminId}"})
	public Optional<Admin> viewAdmin(@PathVariable("adminId") int adminId){
		return adminService.viewAdminById(adminId);
	}

	// update Admin
	@PutMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
	public void updateAdmin(@RequestBody Admin admin) {
		adminService.updateAdmin(admin);
	}

	// Delete Admin
	@DeleteMapping(value = "/{adminId}")
	public void deleteAdmin(@PathVariable("adminId") int adminId) {
		adminService.deleteAdmin(adminId);
	}

	// View Officers
	@GetMapping(value = "/officers")
	public Collection<Officer> viewAllOffiers() {
		return adminService.viewAllOfficers();
	}

	// View Officer
	@GetMapping(value = "/officers/{officerId}")
	public Optional<Officer> viewOfficerById(@PathVariable("officerId") int id) {
		return adminService.viewOfficerById(id);
	}

	// Create Officer Account
	@PostMapping(value = "/officers", consumes = MediaType.APPLICATION_JSON_VALUE)
	public void addOfficer(@RequestBody Officer newOffier) {
		adminService.createOfficerAccount(newOffier);
	}

	// Update Officer Account
	@PutMapping(value = "/officers", consumes = MediaType.APPLICATION_JSON_VALUE)
	public void updateOfficer(@RequestBody Officer editOffier) {
		adminService.updateOfficerAccount(editOffier);
	}

	// Delete Officer Account
	@DeleteMapping(value = "/officers/{officerId}")
	public void deleteOfficer(@PathVariable("officerId") int id) {
		adminService.deleteOfficerAccount(id);
	}

	// view All Farmers
	@GetMapping(value = { "/farmers" })
	public Collection<Farmer> viewAllFarmers() {
		return adminService.viewAllFarmers();
	}

	// View Farmer
	@GetMapping(value = "/farmers/{farmerId}")
	public Optional<Farmer> viewFarmer(@PathVariable("farmerId") int id) {
		return adminService.viewFarmerById(id);
	}

	// Add Farmer
	@PostMapping(value = "/farmers", consumes = MediaType.APPLICATION_JSON_VALUE)
	public void addFarmer(@RequestBody Farmer newFarmer) {
		adminService.addFarmer(newFarmer);
	}

	// Update Farmer Details
	@PutMapping(value = "/farmers", consumes = MediaType.APPLICATION_JSON_VALUE)
	public void updateFarmer(@RequestBody Farmer editFarmer) {
		adminService.updateFarmer(editFarmer);
	}

	// Delete Farmer Details
	@DeleteMapping(value = "/farmers/{farmerId}")
	public void deleteFarmerById(@PathVariable("farmerId") int id) {
		adminService.deleteFarmer(id);
	}

	// View Cultivations
	@GetMapping(value = "/cultivations")
	public Collection<Cultivation> viewAllCultivations() {
		return adminService.viewAllCultivations();
	}

	// View cultivation By Location
	@GetMapping(value = "/cultivations/{location}")
	public Cultivation viewCultivationByLocation(@PathVariable("location") String location) {
		return adminService.viewCultivationByPlace(location);
	}

	// Add Cultivation Details
	@PostMapping(value = "/cultivations", consumes = MediaType.APPLICATION_JSON_VALUE)
	public void addCultivation(@RequestBody Cultivation cultivation) {
		adminService.addCultivation(cultivation);
	}

	// Update Cultivation Details
	@PutMapping(value = "/cultivations", consumes = MediaType.APPLICATION_JSON_VALUE)
	public void updateCultivation(@RequestBody Cultivation cultivation) {
		adminService.updateCultivation(cultivation);
	}

	// Delete Cultivation Details
	@DeleteMapping(value = "/cultivations/{cultivationId}")
	public void deleteCultivation(@PathVariable("cultivationId") String cultivationId) {
		adminService.deleteCultivationDetailById(cultivationId);

	}

	/*
	 * @GetMapping(value={"/cultivations"}, produces = MediaType.TEXT_HTML_VALUE)
	 * public ModelAndView adminPage(String name, Model model){
	 * 
	 * ModelAndView modelAndView = new ModelAndView();
	 * modelAndView.setViewName("index"); return modelAndView; }
	 */
}
