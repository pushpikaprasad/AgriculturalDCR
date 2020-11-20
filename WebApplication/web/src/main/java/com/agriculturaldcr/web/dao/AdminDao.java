package com.agriculturaldcr.web.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.agriculturaldcr.web.entity.Admin;

@Repository
public class AdminDao {

	@Autowired
	public AdminRepository adminRepository;

	public Admin findAdmin(String username, String password) {
		return adminRepository.findAdminByUsernameAndPassword(username, password);
	}

	public void addAdmin(Admin newAdmin) {
		Admin admin = (Admin) newAdmin;
		try {
			adminRepository.save(admin);
		} catch (NullPointerException e) {
			System.out.println(e.getMessage() + " Admin dao: addAdmin() gives null object!");
		}
	}

	public void updateAdmin(Admin editAdmin) {
		Admin admin = (Admin) editAdmin;
		try {
			adminRepository.save(admin);
		} catch (NullPointerException e) {
			System.out.println(e.getMessage() + " Admin dao: updateAdmin() gives null object!");
		}
	}

	public void deleteAdmin(int id) {
		adminRepository.deleteById(id);
	}
}
