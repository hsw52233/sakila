package com.example.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Category;
import com.example.sakila.vo.Language;

@Mapper
public interface CategoryMapper {
	List<Category> selectCategoryList();
	
	
	// /on/addCategory
		int insertCategory(Category paramCategory);
		
		// /on/removeCategory
		int deleteCategory(int categoryId);
}