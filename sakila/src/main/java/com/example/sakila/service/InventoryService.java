package com.example.sakila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.sakila.mapper.InventoryMapper;

@Service
public class InventoryService {
	@Autowired InventoryMapper inventoryMapper;
	
	public Integer getCountInventoryByFilm(Integer filmId) {
		return inventoryMapper.selectCountInventoryByFilm(filmId);
	}
}