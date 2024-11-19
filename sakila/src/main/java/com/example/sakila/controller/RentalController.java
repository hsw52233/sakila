package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.CustomerService;
import com.example.sakila.service.RentalService;
import com.example.sakila.util.TeamColor;
import com.example.sakila.vo.Customer;
import com.example.sakila.vo.Rental;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class RentalController {
	@Autowired CustomerService customerService;
	@Autowired RentalService rentalService;
	
	@GetMapping("/on/addRental")
	public String addRental(Model model
							, @RequestParam Integer inventoryId
							, @RequestParam(required = false) String searchName) {
		model.addAttribute("inventoryId", inventoryId);
		log.debug(TeamColor.JIN+"inventoryId: " + inventoryId + TeamColor.RESET);
		
		log.debug(TeamColor.KIM+"searchName: " + searchName + TeamColor.RESET);
		if(searchName != null && !searchName.equals("")) {
			// CustomerService 호출
			List<Customer> customerList = customerService.getCustomerListByName(searchName);
			log.debug(TeamColor.KIM+"searchName: " + customerList.toString() + TeamColor.RESET);
			model.addAttribute("customerList", customerList);
		}
		
		return "on/addRental";
	}
	
	@PostMapping("/on/addRental")
	public String addRental(Rental rental) {
		Integer row = rentalService.addRental(rental);
		return "redirect:/on/customerOne?customerId="+rental.getCustomerId();
	}
}