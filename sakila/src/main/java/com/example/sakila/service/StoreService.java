package com.example.sakila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.StoreMapper;
import com.example.sakila.vo.Store;

@Service
@Transactional
public class StoreService {
	@Autowired StoreMapper storeMapper;
	
	public List<Store> getStoreList() {
		return storeMapper.selectStoreList();
	}
}
