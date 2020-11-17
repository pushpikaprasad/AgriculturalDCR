package com.agriculturaldcr.web.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.agriculturaldcr.web.service.CultivationService;

@Controller
public class AdminController {
	
	@Autowired CultivationService cultivationService;
	
	@GetMapping(value={"/"}, produces = MediaType.TEXT_HTML_VALUE)
	public String welcomePage(String name, Model model){
		System.out.print("Admin control : welcome page!");
		model.addAttribute("message", "Welcome...!");
		return "welcome";
	}
	
	@GetMapping(value={"/home-admin"}, produces = MediaType.TEXT_HTML_VALUE)
	public String adminPage(String name, Model model){
		//model.addAttribute("cultivations", cultivationService.viewAll());
		return "index";
	}
}
