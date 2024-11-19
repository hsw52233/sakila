package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


import com.example.sakila.vo.Customer;

@Mapper
public interface CustomerMapper {
	// /on/addRental
	List<Customer> selectCustomerListByName(String searchName);
	
	List<Customer> selectCustomerList(Map<String, Object> paramMap);
	
	Integer insertCustomer(Customer customer);
	// /on/customerOne
    Customer selectCustomerOne(int customerId);
}