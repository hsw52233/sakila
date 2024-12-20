package com.example.sakila.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.service.AddressService;
import com.example.sakila.service.CustomerService;
import com.example.sakila.service.StoreService;
import com.example.sakila.vo.Address;
import com.example.sakila.vo.Customer;
import com.example.sakila.vo.Store;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CustomerController {
	@Autowired CustomerService customerService;
	@Autowired StoreService storeService;
	@Autowired AddressService addressService;
	
	@GetMapping("/on/customerOne")
	public String customerOne(Model model,@RequestParam Integer customerId) {
		Customer customer = customerService.getCustomerOne(customerId);
		model.addAttribute("customer",customer);
		return "on/customerOne";
	}
	
	
	@GetMapping("/on/customerList")
	public String customerList(Model model
							, @RequestParam(defaultValue = "1") Integer currentPage
							, @RequestParam(defaultValue = "10") Integer rowPerPage
							, @RequestParam(required = false) String searchWord) {
		Map<String, Object> resultMap = customerService.getCustomerList(currentPage, rowPerPage,searchWord);
		
		log.debug(resultMap.toString());
		
		model.addAttribute("currentPage", currentPage);
		// resultMap 풀어서.... 이동(통으로 넘기면 View코드 복잡...)
		model.addAttribute("startPagingNum", resultMap.get("startPagingNum"));
		model.addAttribute("endPagingNum", resultMap.get("endPagingNum"));
		model.addAttribute("customerList", resultMap.get("customerList"));
		model.addAttribute("searchWord",resultMap.get("searchWord"));
		
		return "on/customerList";
	}
	
	
	@GetMapping("/on/addCustomer")
	public String addCustomer(Model model
							, @RequestParam(required = false) String searchAddress) {
		
		Map<String, Object> map = new HashMap<>();
		// sotreList <--
		List<Store> storeList = storeService.getStoreList(map);
		model.addAttribute("storeList", storeList);
		
		// addressList <-- 검색 searchAddress != null
		if(searchAddress != null && !searchAddress.equals("")) {
			List<Address> addressesList = addressService.getAddressListByWord(searchAddress);
			model.addAttribute("addressesList", addressesList);
		}
		
		return "on/addCustomer";
	}
	
	@PostMapping("/on/addCustomer")
	public String addCustomer(Customer customer) {
		// 고객추가
		Integer row = customerService.addCustomer(customer);
		if(row == 0) {// 입력실패시 입력페이지로 포워딩
			return "on/addCustomer";
		}
		return "redirect:/on/customerList";
	}
}