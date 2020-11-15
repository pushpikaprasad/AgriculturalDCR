package com.agriculturaldcr.web.dao;

import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.agriculturaldcr.web.entity.Cultivation;

@Repository
public class CultivationDao {
	
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
	}
	
	//update method needs be to constructed

}
