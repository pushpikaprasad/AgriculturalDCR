package com.agriculturaldcr.web.dao;

import java.util.Collection;
import java.util.LinkedHashMap;

//import java.util.Collection;

//import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
//import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.agriculturaldcr.web.entity.Cultivation;

@Repository
public class CultivationDao  { //implements CultivationRepository
	
	
	@Autowired public CultivationRepository cultivationRepo;
	public MongoTemplate mongoTemplate;
	/*
	public CultivationRepository cultivationRepo;

	
	public List<Cultivation> findAll() {
		// TODO Auto-generated method stub
		//return mongoTemplate.findAll(Cultivation.class);
		return cultivationRepo.findAll();
		//return null;
	}

	public void add(Cultivation culti) {
		cultivationRepo.save(culti);
	}
	
	public void update(Cultivation culti) {
		Cultivation entity = (Cultivation) culti;
		cultivationRepo.save(entity);
	}

	
	public Optional<Cultivation> findById(String id) {
		// TODO Auto-generated method stub
		//Cultivation culti = mongoTemplate.findById(id, Cultivation.class);
		
		//return Optional.of((Cultivation)culti);
		return cultivationRepo.findById(id);
	}
	
	public void deleteById(String id) {
		// TODO Auto-generated method stub
		//Cultivation culti = mongoTemplate.findById(id, Cultivation.class);
		//mongoTemplate.remove(culti);
		cultivationRepo.deleteById(id);
	}*/
	
	
	//Mock database 
	private static Map<String, Cultivation> cultivation;
	
	static {
		
		cultivation = new LinkedHashMap<String, Cultivation>(){
			{
				put("AA01", new Cultivation("AA01", "Carret", 1000, "Madawachchiya", false, 005));
				put("AA02", new Cultivation("AA02", "Beat", 500, "Vavniya", true, 003));
				put("AA03", new Cultivation("AA03", "Cucumber", 200, "Kilinochchi", false, 010));
				put("AA04", new Cultivation("AA04", "Green Chili", 3000, "Mihinthale", true, 014));
			}
		};		
	} 
	
	public Cultivation findById(String id) {
		return cultivation.get(id);
	}
	
	public Collection<Cultivation> findAll(){
		return cultivation.values();
	}
	
	public void remove(String id) {
		
		Cultivation toremove = cultivation.get(id);
		
		if(toremove != null) {
			cultivation.remove(id);
		}
		else {
			throw new RuntimeException("Object not found "+ id +" in CultivationDao class remove(id) method.");
		}
	}
	
	public void add(Cultivation c) {
		cultivation.put(c.getCultivationId(), c);
		String id = c.cultivationId;
		Cultivation culti = (Cultivation) c;
		try {
		System.out.println(c.toString());
		cultivationRepo.save(culti);
		//mongoTemplate.save(mongoTemplate.findById(id, Cultivation.class));
		}catch(NullPointerException e) {
			System.out.println(e.getMessage());
		}
		
	}
	
	//update method needs be to constructed
	
}
