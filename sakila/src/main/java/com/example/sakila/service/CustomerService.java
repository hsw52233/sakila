package com.example.sakila.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.CustomerMapper;
import com.example.sakila.vo.Customer;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CustomerService {
	@Autowired CustomerMapper customerMapper;
	
	public Integer getLastPage(Integer rowPerPage) {
		return 0;
	}
	
	public Map<String, Object> getCustomerList(Integer currentPage, Integer rowPerPage) {
		Integer beginRow = (currentPage - 1) * rowPerPage;
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		
		// 한페이지당 페이징개수는 10개씩이라고 가정
		Integer numPerPage = 10;
		// 페이징 첫번째 페이지 넘버
		Integer startPagingNum = (currentPage-1)/10*10+1; 
		// 페이징 마지막 페이지 넘버
		Integer endPagingNum = startPagingNum + (numPerPage - 1); 
		// 현재페이지가 95다 91~100출력인데 마지막 페이지가 98이면 91 ~ 98
		
		/*
		Integer lastPage = this.getLastPage(rowPerPage);
		if(lastPage < endPagingNum) {
			endPagingNum = lastPage;
		}
		*/
		
		List<Customer> customerList = customerMapper.selectCustomerList(paramMap);
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("startPagingNum", startPagingNum);
		resultMap.put("endPagingNum", endPagingNum);
		resultMap.put("customerList", customerList);
		return resultMap;
	}
	
	public Integer addCustomer(Customer customer) {
		return customerMapper.insertCustomer(customer);
	}
}