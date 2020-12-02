package com.agriculturaldcr.web.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import com.agriculturaldcr.web.dao.CultivationDao;
import com.agriculturaldcr.web.dao.FarmerDao;
import com.agriculturaldcr.web.dao.FarmerRepository;
import com.agriculturaldcr.web.entity.Cultivation;
import com.agriculturaldcr.web.entity.Farmer;

public class FarmerService {

	@Autowired
	private CultivationDao cultivationDao;
	@Autowired
	private FarmerDao farmerDao;
	
	//View Farmer details with cultivations
	public Collection viewFarmerAndCultivation(int farmerId) {
		Collection<Cultivation> cultivations = cultivationDao.viewCultivationByFarmerId(farmerId);
		Optional<Farmer> farmer = farmerDao.viewById(farmerId);
		
		Collection farmerAndCultivation = new ArrayList();
		
		
		
		Iterator iterator = cultivations.iterator();
		while(iterator.hasNext()) {
			Object object = iterator.next();
			
			
			
		}
			
		
		return null;
	}
	
}
