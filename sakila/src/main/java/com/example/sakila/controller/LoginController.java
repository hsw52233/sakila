package com.example.sakila.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.sakila.mapper.StaffMapper;
import com.example.sakila.service.StaffService;
import com.example.sakila.vo.Staff;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j 
@Controller 
public class LoginController {
	@Autowired StaffService staffService;
	
	@GetMapping("/on/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		log.debug("로그아웃 성공");
		return "redirect:/off/login";
	}
	
	// 로그인 폼
	@GetMapping("/off/login")
	public String login() {
		log.debug("/off/login 실행됨.");
		return "off/login";
	}
	
	// 로그인 액션
	@PostMapping("/off/login")
	public String login(Model model, HttpSession session,
			@RequestParam(name = "staffId") int staffId
			, @RequestParam(name = "password") String password) {
			// int staffId = Interger.parseInt(request.getParameter("staffId"))
			// String password = request.getParameter("password")
			
			Staff paramStaff = new Staff();
			paramStaff.setStaffId(staffId); 
			paramStaff.setPassword(password);
			
			Staff loginStaff = staffService.login(paramStaff);
			if(loginStaff == null) {
				log.debug("로그인 실패");
				model.addAttribute("msg", "로그인실패");
				return "/off/login";
			}
			session.setAttribute("loginStaff", loginStaff);
			log.debug("로그인 성공, 세션loginStaff속성 추가");
		return "redirect:/on/main";
	}
}
