package com.agriculturaldcr.web.controller;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.agriculturaldcr.web.entity.Cultivation;
import com.agriculturaldcr.web.service.CultivationService;


@RestController
@RequestMapping("/cultivations")
public class CultivationController {
	
	@Autowired private CultivationService cultivationService;
	
	@GetMapping
	public Collection<Cultivation> viewAll(){
		return cultivationService.viewAll();
	}

	@GetMapping(value="/{cultivationId}")
	public Cultivation view(@PathVariable("cultivationId") String id){
		return cultivationService.view(id);
	}
	
	@PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
	public void add(@RequestBody Cultivation cultivation) {
		cultivationService.add(cultivation);
	}
	
	/*@PutMapping
	 * used to update as POSTMAPPING
	 */
	
	@DeleteMapping(value="/{cultivationId}")
	public void delete(@PathVariable("cultivationId") String id) {
		cultivationService.delete(id);
	}
}