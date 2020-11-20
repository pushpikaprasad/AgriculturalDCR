package com.agriculturaldcr.web.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Cultivation {
	
	@Id
	public String cultivationId;
	
	public String cultivationType;
	public int harvestAmount;
	public String location;
	public boolean availability;
	public int farmerId;	//owner: String
	
	public Cultivation() {
		
	}

	public Cultivation(String cultivationId, String cultivationType, int harvestAmount, String location,
			boolean availability, int farmerId) {
		super();
		this.cultivationId = cultivationId;
		this.cultivationType = cultivationType;
		this.harvestAmount = harvestAmount;
		this.location = location;
		this.availability = availability;
		this.farmerId = farmerId;
	}



	public String getCultivationType() {
		return cultivationType;
	}

	public void setCultivationType(String cultivationType) {
		this.cultivationType = cultivationType;
	}

	public int getHarvestAmount() {
		return harvestAmount;
	}

	public void setHarvestAmount(int harvestAmount) {
		this.harvestAmount = harvestAmount;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public boolean isAvailability() {
		return availability;
	}

	public void setAvailability(boolean availability) {
		this.availability = availability;
	}



	public String getCultivationId() {
		return cultivationId;
	}



	public void setCultivationId(String cultivationId) {
		this.cultivationId = cultivationId;
	}



	public int getFarmerId() {
		return farmerId;
	}



	public void setFarmerId(int farmerId) {
		this.farmerId = farmerId;
	}

	@Override
	public String toString() {
		return "Cultivation [cultivationId=" + cultivationId + ", cultivationType=" + cultivationType
				+ ", harvestAmount=" + harvestAmount + ", location=" + location + ", availability=" + availability
				+ ", farmerId=" + farmerId + "]";
	}

	
	

}
