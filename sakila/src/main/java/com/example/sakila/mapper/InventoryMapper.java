package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Inventory;

@Mapper
public interface InventoryMapper {
	// /on/addInventory
	Integer insertInventory(Inventory inventory);
	
	// /on/inventoryList
	List<Map<String, Object>> selectInventoryListByStore(Map<String, Object> paramMap);
	
	// /on/removeFilm
	Integer selectCountInventoryByFilm(Integer filmId);
}