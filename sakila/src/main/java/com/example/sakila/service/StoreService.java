package com.example.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.StoreMapper;
import com.example.sakila.vo.Staff;
import com.example.sakila.vo.Store;

@Service
@Transactional
public class StoreService {
	@Autowired StoreMapper storeMapper;
	
	public List<Store> getStoreList(Map paramMap) {
		return storeMapper.selectStoreList(paramMap);
	}
	
	
	public int getLastPage(int rowPerPage) {
		int count = storeMapper.selectStoreCount();
		int lastPage = count / rowPerPage;
		if(count % rowPerPage != 0) {
			lastPage += 1;
		}
		return lastPage;
	}
}
