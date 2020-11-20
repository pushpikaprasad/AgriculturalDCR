package com.agriculturaldcr.web.service;

import java.util.Collection;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.agriculturaldcr.web.dao.CultivationDao;
import com.agriculturaldcr.web.entity.Cultivation;

@Service
public class CultivationService {
	
	@Autowired private CultivationDao cultivationDao;
	
	
	public Cultivation view(String cultivationId) {		//view record
		return cultivationDao.findById(cultivationId);
		//return cultivationDao.findById(cultivationId);
	}
	
	public Collection<Cultivation> viewAll(){ 	//view records
		return cultivationDao.findAll();
		//return cultivationDao.findAll();
	}
	
	public void add(Cultivation cultivation) {	//add record
		cultivationDao.add(cultivation);
		//cultivationDao.add(cultivation);
	}
	
/*	public void update(Cultivation cultivation) {	//update record
		//update whole raw data or field???
		
		cultivationDao.update(cultivation);
	}*/
	
	public void delete(String cultivationId) {	//delete record
		cultivationDao.remove(cultivationId);
		//cultivationDao.deleteById(cultivationId);
	}

}
