package com.example.sakila.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.StoreService;
import com.example.sakila.vo.Store;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class StoreController {

	@Autowired
	StoreService storeService;

	@GetMapping("/on/storeList")
	public String staffList(Model model, @RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(defaultValue = "10") int rowPerPage) {

		Map<String, Object> map = new HashMap<>();
		int beginRow = (currentPage - 1) * rowPerPage;
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage);
		log.debug(map.toString());

		List<Store> storeList = storeService.getStoreList(map);
		log.debug(storeList.toString());

		int lastPage = storeService.getLastPage(rowPerPage);

		model.addAttribute("storeList", storeList);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("lastPage", lastPage);

		return "on/storeList";
	}
}

