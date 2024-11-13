package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.CategoryService;
import com.example.sakila.vo.Category;
import com.example.sakila.vo.FilmCategory;
import com.example.sakila.vo.Language;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;



@Slf4j
@Controller
public class CategoryController {
	
	@Autowired CategoryService categoryService;
	
	@GetMapping("/on/categoryList")
	public String categoryList(Model model) {
		List<Category> categoryList = categoryService.getCategoryList();
		log.debug("categoryList : " + categoryList);
		model.addAttribute("categoryList", categoryList);
		return "on/categoryList";
	}
	
	@GetMapping("/on/addCategory")
	public String addCategory() {
		return "on/addCategory";
	}
	
	@PostMapping("/on/addCategory")
	public String addCategory(Category category) {
		int insertCategoryRow = categoryService.addCategory(category);
		if(insertCategoryRow == 0) { 
			return "on/addCategory";
		}
		return "redirect:/on/categoryList";
	}
	
	@GetMapping("/on/removeCategory")
	public String removeCategory(@RequestParam int categoryId) {
		
		int deleteCategoryRow = categoryService.removeCategory(categoryId);
				
		if(deleteCategoryRow == 0) { 
			return "on/categoryList";
		}
		
		return "redirect:/on/categoryList";
	}
	
	

}