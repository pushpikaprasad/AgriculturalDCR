package com.agriculturaldcr.web.controller;


import java.sql.Date;
import java.text.DateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.agriculturaldcr.web.service.CultivationService;

@RestController
public class HomePageController {
	
	@GetMapping(value = "/", produces = MediaType.TEXT_HTML_VALUE)
	@ResponseBody
	public String welcomePage() {
		return "<html><script></script><body>Welcome! <br/> </body></html>";
	}
	
	/*@Autowired private CultivationService cultivationService;
	
	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	@ResponseBody
	public void welcome(ModelMap model) {
		
		 Date date = new Date(0);
         DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
                 DateFormat.LONG);

         String formattedDate = dateFormat.format(date);

		model.put("cultivations",formattedDate);
		//return "view/welcome";
	}
	
	@RequestMapping("/")
	public String index() {
		return "indexPage";
	}*/
	
	
	
	
	
}