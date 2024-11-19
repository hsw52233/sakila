package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Rental;

@Mapper
public interface RentalMapper {
	Integer insertRental(Rental rental);
}