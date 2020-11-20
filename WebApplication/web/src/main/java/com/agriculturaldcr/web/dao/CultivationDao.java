package com.agriculturaldcr.web.dao;

import java.util.Collection;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.agriculturaldcr.web.entity.Cultivation;

@Repository
public class CultivationDao {

	@Autowired
	public CultivationRepository cultivationRepo;

	public Optional<Cultivation> findById(String id) {
		return cultivationRepo.findById(id);
	}

	public Collection<Cultivation> findAll() {
		return cultivationRepo.findAll();
	}

	public void delete(String id) {
		cultivationRepo.deleteById(id);
	}

	public void add(Cultivation c) {
		Cultivation culti = (Cultivation) c;
		try {
			System.out.println(c.toString());
			cultivationRepo.save(culti);
		} catch (NullPointerException e) {
			System.out.println(e.getMessage() + " Cultivation dao: add() gives null object!");
		}

	}

	public void update(Cultivation c) {
		Cultivation culti = (Cultivation) c;
		try {
			System.out.println(c.toString());
			cultivationRepo.save(culti);
		} catch (NullPointerException e) {
			System.out.println(e.getMessage() + " Cultivation dao: add() gives null object!");
		}
	}

	public Cultivation viewCultivationByPlace(String location) {
		return cultivationRepo.viewCultivationsByPlace(location);
	}

}
