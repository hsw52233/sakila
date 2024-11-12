package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.LanguageService;
import com.example.sakila.vo.Language;

import lombok.extern.slf4j.Slf4j;



@Slf4j
@Controller
public class LanguageController {
	
	@Autowired LanguageService languageService;
	
	@GetMapping("/on/languageList")
	public String languageList(Model model) {
		List<Language> languageList = languageService.getLanguageList();
		log.debug("languageList : " + languageList);
		model.addAttribute("languageList", languageList);
		return "on/languageList";
	}
	
	@GetMapping("/on/addLanguage")
	public String addLanguage() {
		return "on/addLanguage";
	}
	
	@PostMapping("/on/addLanguage")
	public String addLanguage(Language language) {
		int insertLanguageRow = languageService.addLanguage(language);
		if(insertLanguageRow == 0) { 
			return "on/addLanguage";
		}
		return "redirect:/on/languageList";
	}
	
	@GetMapping("/on/removeLanguage")
	public String removeLanguage(@RequestParam int languageId) {
		
		int deleteLanguageRow = languageService.removeLanguage(languageId);
				
		if(deleteLanguageRow == 0) { 
			return "on/languageList";
		}
		
		return "redirect:/on/languageList";
	}
	
	
	
	

}