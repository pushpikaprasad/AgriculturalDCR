package com.agriculturaldcr.web.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Officer {

	@Id
	private int officerId;
	private String officerUsername;
	private String officerPassword;
	public String officerName;
	public String workArea;
	public String officerContactNumber; // mobile number
	public char assignedBranch;

	public Officer() {

	}

	public Officer(int officerId, String officerUsername, String officerPassword, String officerName, String workArea,
			String officerContactNumber, char assignedBranch) {
		super();
		this.officerId = officerId;
		this.officerUsername = officerUsername;
		this.officerPassword = officerPassword;
		this.officerName = officerName;
		this.workArea = workArea;
		this.officerContactNumber = officerContactNumber;
		this.assignedBranch = assignedBranch;
	}

	public int getOfficerId() {
		return officerId;
	}

	public void setOfficerId(int officerId) {
		this.officerId = officerId;
	}

	public String getOfficerUsername() {
		return officerUsername;
	}

	public void setOfficerUsername(String officerUsername) {
		this.officerUsername = officerUsername;
	}

	public String getOfficerPassword() {
		return officerPassword;
	}

	public void setOfficerPassword(String officerPassword) {
		this.officerPassword = officerPassword;
	}

	public String getOfficerName() {
		return officerName;
	}

	public void setOfficerName(String officerName) {
		this.officerName = officerName;
	}

	public String getWorkArea() {
		return workArea;
	}

	public void setWorkArea(String workArea) {
		this.workArea = workArea;
	}

	public String getOfficerContactNumber() {
		return officerContactNumber;
	}

	public void setOfficerContactNumber(String officerContactNumber) {
		this.officerContactNumber = officerContactNumber;
	}

	public char getAssignedBranch() {
		return assignedBranch;
	}

	public void setAssignedBranch(char assignedBranch) {
		this.assignedBranch = assignedBranch;
	}

}
