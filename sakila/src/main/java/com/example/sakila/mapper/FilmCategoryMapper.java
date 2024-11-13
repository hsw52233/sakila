package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmCategory;

@Mapper
public interface FilmCategoryMapper {
	
	Integer deleteFilmCategory(FilmCategory filmCategory);
	
	// /on/addFilmCategory
	Integer insertFilmCategory(FilmCategory filmCategory);
	
	// /on/filmOne
	List<Map<String, Object>> selectFilmCategoryListByFilm(Integer filmId);
	
	Integer deleteFilmCategoryByFilm(Integer filmId);
	
	// 11/12 PM 숙제
	Integer deleteFilmCategoryByCategory(Integer categoryId);
}