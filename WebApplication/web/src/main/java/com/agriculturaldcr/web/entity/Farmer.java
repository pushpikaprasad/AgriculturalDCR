package com.agriculturaldcr.web.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Farmer {

	@Id
	private int farmerId;
	public String farmerName;
	public String farmerMobile; // farmer_contact details

	public Farmer() {

	}

	public Farmer(String farmerName, String farmerMobile, int farmerId) {
		super();
		this.farmerName = farmerName;
		this.farmerMobile = farmerMobile;
		this.farmerId = farmerId;
	}

	public String getFarmerName() {
		return farmerName;
	}

	public void setFarmerName(String farmerName) {
		this.farmerName = farmerName;
	}

	public String getFarmerMobile() {
		return farmerMobile;
	}

	public void setFarmerMobile(String farmerMobile) {
		this.farmerMobile = farmerMobile;
	}

	public int getFarmerId() {
		return farmerId;
	}

	public void setFarmerId(int farmerId) {
		this.farmerId = farmerId;
	}
}
