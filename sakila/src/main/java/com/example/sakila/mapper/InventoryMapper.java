package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface InventoryMapper {
	Integer selectCountInventoryByFilm(Integer filmId);
}