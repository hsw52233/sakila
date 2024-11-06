package com.example.sakila.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.Staff;

@Mapper
public interface StaffMapper {
	
	int updateStaff(Staff staff); // 업뎃문 하나로 모든 컬럼을 개별수정가능하게
	
	int selectStaffCount();
	
	List<Staff> selectStaffList(Map<String, Object> map);
	
	int insertStaff(Staff staff);
	
	// /on/staffOne.jsp
	Map<String, Object> selectStaffOne(int staffId);
	
	// /off/login.jsp
	Staff login(Staff staff);
}
