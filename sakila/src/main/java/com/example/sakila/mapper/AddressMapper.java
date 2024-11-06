package com.example.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Address;

@Mapper
public interface AddressMapper {
	List<Address> selectAddressListByWord(String searchAddress);
}
