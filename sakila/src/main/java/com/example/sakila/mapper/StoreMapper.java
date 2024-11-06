package com.example.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Store;

@Mapper
public interface StoreMapper {
	List<Store> selectStoreList();
}
