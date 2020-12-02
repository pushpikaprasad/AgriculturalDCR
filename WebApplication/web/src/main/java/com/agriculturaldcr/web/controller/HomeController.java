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

import com.agriculturaldcr.web.entity.Cultivation;
import com.agriculturaldcr.web.entity.Farmer;
import com.agriculturaldcr.web.service.AdminService;
import com.agriculturaldcr.web.service.CultivationService;

@RestController
@RequestMapping("/")
public class HomeController {

	@Autowired
	private CultivationService cultivationService;
	@Autowired
	AdminService adminService;

	// home page
	@GetMapping(produces = MediaType.TEXT_HTML_VALUE)
	public ModelAndView homePage(String name, Model model) {
		model.addAttribute("title", "Centralized Agricultural Data Collector and Reviewer System");

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		return modelAndView;
	}

	@GetMapping
	public Collection<Cultivation> viewAll() {
		return cultivationService.viewAll();
	}

	@GetMapping(value = "/{cultivationId}")
	public Optional<Cultivation> view(@PathVariable("cultivationId") String id) {
		return cultivationService.view(id);
	}
	
	@GetMapping(value= "/farmerName/{cultivationId}", produces = MediaType.TEXT_HTML_VALUE)
	public String getFarmerName(@PathVariable("cultivationId") String id) {
		return cultivationService.viewFarmerName(id);
	}

	@PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
	public void add(@RequestBody Cultivation cultivation) {
		// System.out.println(cultivation.toString());
		cultivationService.add(cultivation);
	}

	@PutMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
	public void update(@RequestBody Cultivation cultivation) {
		cultivationService.update(cultivation);
	}

	@DeleteMapping(value = "/{cultivationId}")
	public void delete(@PathVariable("cultivationId") String id) {
		cultivationService.delete(id);
	}

	// View Farmer
	@GetMapping(value = "/farmer/{farmerId}")
	public Optional<Farmer> viewFarmer(@PathVariable("farmerId") int id) {
		return adminService.viewFarmerById(id);
	}

}
