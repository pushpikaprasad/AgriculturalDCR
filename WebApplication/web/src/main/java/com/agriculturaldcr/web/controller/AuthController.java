package com.agriculturaldcr.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.agriculturaldcr.web.entity.User;
import com.agriculturaldcr.web.service.UserService;


@Controller
public class AuthController {
	
	@Autowired
	private UserService userService;
		
	//@RequestMapping(value = "/login", method = RequestMethod.POST)
	/*public ModelAndView login() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("index");
        return modelAndView;
    }*/

    //@RequestMapping(value = "/Admin-signup", method = RequestMethod.GET)
    @GetMapping(value = "/Admin-signup")
    public ModelAndView signup() {
        ModelAndView modelAndView = new ModelAndView();
        User user = new User();
        modelAndView.addObject("user", user);
        modelAndView.setViewName("signup");
        return modelAndView;
    }

    //@RequestMapping(value = "/signup", method = RequestMethod.POST)
    @PostMapping(value = "/Admin-signup", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ModelAndView createNewUser(@RequestBody User user, BindingResult bindingResult) {

		System.out.println(user.getPassword());
        ModelAndView modelAndView = new ModelAndView();
        User userExists = userService.findUserByUsername(user.getUsername());
        if (userExists != null) {
            bindingResult
                    .rejectValue("email", "error.user",
                            "There is already a user registered with the username provided");
        }
        if (bindingResult.hasErrors()) {
            modelAndView.setViewName("signup");
        } else {
        	
            userService.saveAdminUser(user);
            modelAndView.addObject("successMessage", "User has been registered successfully");
            modelAndView.addObject("user", new User());
            modelAndView.setViewName("index");

        }
        return modelAndView;
    }

   /* @RequestMapping(value = "/Admin", method = RequestMethod.GET)
    public ModelAndView admin() {
        ModelAndView modelAndView = new ModelAndView();
        org.springframework.security.core.Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByUsername(auth.getName());
        modelAndView.addObject("currentUser", user);
        modelAndView.setViewName("AdminHome");
        return modelAndView;
    }*/
    
    
    // Checkpoint: model
    
 // Admin home page
 	//@GetMapping(produces = MediaType.TEXT_HTML_VALUE)
    //@RequestMapping(value = "/Admin", method = RequestMethod.GET)
    @GetMapping(value = "/Admin",produces = MediaType.TEXT_HTML_VALUE)
 	public ModelAndView welcomeAdminPage(Model model) {
 		ModelAndView modelAndView = new ModelAndView();
 		org.springframework.security.core.Authentication auth = SecurityContextHolder.getContext().getAuthentication();
 		User user = userService.findUserByUsername(auth.getName());
 		System.out.print("Admin control : welcome page!");
 		model.addAttribute("title", "Centralized Agricultural Data Collector and Reviewer System");
 		model.addAttribute("subtitle", "System Adiministrator Home Page");
 		model.addAttribute("message", "Welcome...!");
 		model.addAttribute("AdminId", user.getId());
 		modelAndView.setViewName("AdminHome");
 		return modelAndView;
 	}
    
    /*@RequestMapping(value = "/Officer", method = RequestMethod.GET)
    public ModelAndView officer() {
        ModelAndView modelAndView = new ModelAndView();
        org.springframework.security.core.Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        User user = userService.findUserByUsername(auth.getName());
        modelAndView.addObject("currentUser", user);
        modelAndView.setViewName("OfficerHome");
        return modelAndView;
    }*/
    
 // Officer home page
 	//@GetMapping(produces = MediaType.TEXT_HTML_VALUE)
    //@RequestMapping(value = "/Officer", method = RequestMethod.GET)
    @GetMapping(value = "/Officer", produces = MediaType.TEXT_HTML_VALUE)
 	public ModelAndView welcomeOfficerPage(Model model) {
    	ModelAndView modelAndView = new ModelAndView();
 		org.springframework.security.core.Authentication auth = SecurityContextHolder.getContext().getAuthentication();
 		User user = userService.findUserByUsername(auth.getName());
 		model.addAttribute("title", "Centralized Agricultural Data Collector and Reviewer System");
 		model.addAttribute("subtitle", "Officer Home Page");
 		model.addAttribute("message", "Welcome...!");
 		model.addAttribute("OfficerId", user.getId());
 		modelAndView.setViewName("OfficerHome");
 		return modelAndView;
 	}
    
}
