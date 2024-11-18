package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.sakila.mapper.InventoryMapper;
import com.example.sakila.vo.Inventory;

@Service
public class InventoryService {
	@Autowired InventoryMapper inventoryMapper;
	
	public Integer removeInventoryByKey(Integer inventoryId) {
		return inventoryMapper.deleteInvetoryByKey(inventoryId);
	}
	
	public Integer addInventory(Inventory inventory) {
		return inventoryMapper.insertInventory(inventory);
	}
	
	public List<Map<String, Object>> getInventoryListByStore(
			Integer storeId, Integer currentPage, Integer rowPerPage) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("storeId", storeId);
		paramMap.put("rowPerPage", rowPerPage);
		int beginRow = (currentPage - 1) * rowPerPage;
		paramMap.put("beginRow", beginRow);
		
		return inventoryMapper.selectInventoryListByStore(paramMap);
	}
	
	public Integer getCountInventoryByFilm(Integer filmId) {
		return inventoryMapper.selectCountInventoryByFilm(filmId);
	}
}