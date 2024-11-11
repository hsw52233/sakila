package com.example.sakila.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.LanguageService;
import com.example.sakila.vo.Language;
import com.example.sakila.vo.Store;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LanguageController {
	@Autowired
	LanguageService languageService;
	
	@GetMapping("/on/languageList")
	public String languageList(Model model, @RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(defaultValue = "10") int rowPerPage) {

		Map<String, Object> map = new HashMap<>();
		int beginRow = (currentPage - 1) * rowPerPage;
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		log.debug(map.toString());

		List<Language> languageList = languageService.getLanguageList(map);
		log.debug(languageList.toString());

		int lastPage = languageService.getLastPage(rowPerPage);

		model.addAttribute("languageList", languageList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);

		return "on/languageList";
	}
}
