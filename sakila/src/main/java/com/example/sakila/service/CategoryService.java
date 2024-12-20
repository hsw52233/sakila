package com.example.sakila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.CategoryMapper;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.Category;
import com.example.sakila.vo.Language;

@Service
@Transactional
public class CategoryService {
	@Autowired CategoryMapper categoryMapper;
	
	// /on/modifyActor
		public int modifyCategory(Category category) {
			return categoryMapper.updateCategory(category);
		}
	
	public List<Category> getCategoryList() {
		return categoryMapper.selectCategoryList();
	}
	
	// /on/addCategory
		public int addCategory(Category paramCategory) {
			return categoryMapper.insertCategory(paramCategory);
		}
		
		// on/removeCategory
		public int removeCategory(Integer categoryId) {
			return categoryMapper.deleteCategory(categoryId);
		}
		
		// /on/actorOne
		public Category getCategoryById(int categoryId) {
			return categoryMapper.selectCategory(categoryId);
		}
		
		
}