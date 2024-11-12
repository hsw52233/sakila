package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FilmCategoryMapper {
	// /on/filmOne
	List<Map<String, Object>> selectFilmCategoryListByFilm(Integer filmId);
	
	Integer deleteFilmCategoryByFilm(Integer filmId);
	
	// 11/12 PM 숙제
	Integer deleteFilmCategoryByCategory(Integer categoryId);
}