package com.agriculturaldcr.web.entity;

public class Admin {
	private int adminId;
	private String adminUsername;
	private String adminPassword;
	public String adminName;
	
	public Admin() {
		
	}

	public Admin(int adminId, String adminUsername, String adminPassword, String adminName) {
		super();
		this.adminId = adminId;
		this.adminUsername = adminUsername;
		this.adminPassword = adminPassword;
		this.adminName = adminName;
	}

	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}

	public String getAdminUsername() {
		return adminUsername;
	}

	public void setAdminUsername(String adminUsername) {
		this.adminUsername = adminUsername;
	}

	public String getAdminPassword() {
		return adminPassword;
	}

	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	
	

}