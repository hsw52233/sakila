package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FilmCategoryMapper {
	Integer deleteFilmCategoryByFilm(int filmId);
	
	// 11/12 PM 숙제
	Integer deleteFilmCategoryByCategory(int categoryId);
}