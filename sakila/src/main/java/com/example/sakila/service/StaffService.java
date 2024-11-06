package com.example.sakila.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.vo.Staff;

@Service
@Transactional
public class StaffService {
	@Autowired StaffMapper staffMapper;
	
	public Map<String, Object> getStaffOne(int staffId) {
		return staffMapper.selectStaffOne(staffId);
	}
	
	public int getLastPage(int rowPerPage) {
		int count = staffMapper.selectStaffCount();
		int lastPage = count / rowPerPage;
		if(count % rowPerPage != 0) {
			lastPage += 1;
		}
		return lastPage;
	}
	
	public List<Staff> getStaffList(Map paramMap) {
		return staffMapper.selectStaffList(paramMap);
	}
	
	public int addStaff(Staff paramStaff) {
		return staffMapper.insertStaff(paramStaff);
	}
	
	public int modifyStaff(Staff paramStaff) {
		 return staffMapper.updateStaff(paramStaff);
	}
	
	public Staff login(Staff paramStaff) {
		return staffMapper.login(paramStaff);
	}
}
