package com.agriculturaldcr.web.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.agriculturaldcr.web.dao.RoleRepository;
import com.agriculturaldcr.web.dao.UserRepository;
import com.agriculturaldcr.web.entity.Role;
import com.agriculturaldcr.web.entity.User;


@Service
public class UserService implements UserDetailsService{
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	public User findUserByUsername(String username){
		return userRepository.findByUsername(username);
	}
	
	public void saveAdminUser(User user) {
		System.out.println(user.getPassword());
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		user.setEnabled(true);
		Role adminRole = roleRepository.findByRole("ADMIN");
		if (adminRole == null) {
             Role newAdminRole = new Role();
             newAdminRole.setRole("ADMIN");
             roleRepository.save(newAdminRole);
         }
		user.setRoles(new HashSet<>(Arrays.asList(adminRole)));
		userRepository.save(user);
	}
	
	public void saveOfficerUser(User user) {
		System.out.println(user.getPassword());
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		user.setEnabled(true);
		Role officerRole = roleRepository.findByRole("OFFICER");
		if (officerRole == null) {
             Role newAdminRole = new Role();
             newAdminRole.setRole("OFFICER");
             roleRepository.save(newAdminRole);
         }
		user.setRoles(new HashSet<>(Arrays.asList(officerRole)));
		userRepository.save(user);
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{
		User user = userRepository.findByUsername(username);
		if(user != null) {
			List<GrantedAuthority> authorities = getUserAuthority(user.getRoles());
			return buildUserForAuthentication(user, authorities);
			
		}else {
			throw new UsernameNotFoundException("Username not found");
		}
		
	}
	 private List<GrantedAuthority> getUserAuthority(Set<Role> userRoles) {
	        Set<GrantedAuthority> roles = new HashSet<>();
	        userRoles.forEach((role) -> {
	            roles.add(new SimpleGrantedAuthority(role.getRole()));
	        });

	        List<GrantedAuthority> grantedAuthorities = new ArrayList<>(roles);
	        return grantedAuthorities;
	    }
	 
	 private UserDetails buildUserForAuthentication(User user, List<GrantedAuthority> authorities) {
		 return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(), authorities);
	 }
	
	

}
