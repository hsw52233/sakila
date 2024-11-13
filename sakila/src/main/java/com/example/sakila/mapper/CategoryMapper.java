package com.example.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Actor;
import com.example.sakila.vo.Category;
import com.example.sakila.vo.Language;

@Mapper
public interface CategoryMapper {
	List<Category> selectCategoryList();
	
	
	// /on/addCategory
		int insertCategory(Category paramCategory);
		
		// /on/removeCategory
		Integer deleteCategory(Integer categoryId);
		
		int updateCategory(Category category);
		
		// /on/actorOne
		Category selectCategory(int categoryId);
}