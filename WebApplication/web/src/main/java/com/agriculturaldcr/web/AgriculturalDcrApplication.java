 package com.agriculturaldcr.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

@SpringBootApplication
public class AgriculturalDcrApplication {

	public static void main(String[] args) {
		SpringApplication.run(AgriculturalDcrApplication.class, args);
	}

}
