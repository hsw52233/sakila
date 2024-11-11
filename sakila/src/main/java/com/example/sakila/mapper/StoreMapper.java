package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


import com.example.sakila.vo.Store;

@Mapper
public interface StoreMapper {
	List<Store> selectStoreList(Map<String, Object> map);

	int selectStoreCount();
}
