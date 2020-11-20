package com.agriculturaldcr.web.controller;

import java.util.Collection;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.agriculturaldcr.web.entity.Cultivation;
import com.agriculturaldcr.web.entity.Farmer;
import com.agriculturaldcr.web.entity.Officer;
import com.agriculturaldcr.web.service.OfficerService;

@RestController
@RequestMapping("/Officer")
public class OfficerHomeController {

	@Autowired
	public OfficerService officerService;

	// Officer home page
	@GetMapping(value = { "/" }, produces = MediaType.TEXT_HTML_VALUE)
	public ModelAndView welcomePage(String name, Model model) {
		System.out.print("Officer control : welcome page!");
		model.addAttribute("title", "Centralized Agricultural Data Collector and Reviewer System");
		model.addAttribute("subtitle", "Officer Home Page");
		model.addAttribute("message", "Welcome...!");

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("OfficerHome");
		return modelAndView;
	}

	// Update Officer Details
	@PutMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
	public void updateAdmin(@RequestBody Officer officer) {
		officerService.updateOfficer(officer);
	}

	// view All Farmers
	@GetMapping(value = { "/farmers" }, produces = MediaType.TEXT_HTML_VALUE)
	public Collection<Farmer> viewAllFarmers() {
		return officerService.viewAllFarmers();
	}

	// View Farmer By Id
	@GetMapping(value = { "/farmers/{farmerId}" }, produces = MediaType.TEXT_HTML_VALUE)
	public Optional<Farmer> viewFarmerById(@PathVariable("farmerId") int farmerId) {
		return officerService.viewFarmerById(farmerId);
	}

	// Add Farmer Details
	@PostMapping(value = "/farmers", consumes = MediaType.APPLICATION_JSON_VALUE)
	public void addFarmer(@RequestBody Farmer newFarmer) {
		officerService.addFarmer(newFarmer);
	}

	// Update Farmer Details
	@PutMapping(value = "/farmers", consumes = MediaType.APPLICATION_JSON_VALUE)
	public void updateFarmer(@RequestBody Farmer editFarmer) {
		officerService.updateFarmer(editFarmer);
	}

	// View All Cultivations
	@GetMapping(value = "/cultivations", produces = MediaType.TEXT_HTML_VALUE)
	public Collection<Cultivation> viewAllCultivations() {
		return officerService.viewAllCultivations();
	}

	// Add Cultivation Details
	@PostMapping(value = "/cultivations", consumes = MediaType.APPLICATION_JSON_VALUE)
	public void addCultivation(@RequestBody Cultivation cultivation) {
		officerService.addCultivation(cultivation);
	}

	// Update Cultivation
	@PutMapping(value = "/cultivations", consumes = MediaType.APPLICATION_JSON_VALUE)
	public void updateCultivation(@RequestBody Cultivation cultivation) {
		officerService.updateCultivation(cultivation);
	}

}
