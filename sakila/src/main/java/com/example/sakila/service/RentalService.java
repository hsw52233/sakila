package com.example.sakila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.RentalMapper;
import com.example.sakila.vo.Rental;

@Service
@Transactional
public class RentalService {
	@Autowired RentalMapper rentalMapper;
	
	public Integer addRental(Rental rental) {
		return rentalMapper.insertRental(rental);
	}
}