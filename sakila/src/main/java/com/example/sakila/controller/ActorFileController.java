package com.example.sakila.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.service.ActorFileService;
import com.example.sakila.vo.ActorForm;

import jakarta.servlet.http.HttpSession;

@Controller
public class ActorFileController {
	@Autowired ActorFileService actorFileService;
	
	@PostMapping("/on/addActorFile")
	public String addActorFile(HttpSession session
								, Model model
								, ActorForm actorForm) {
		List<MultipartFile> list = actorForm.getActorFile();
		for(MultipartFile f : list) { // 이미지파일은 *.jpg or *.png 가능
			if(f.getContentType().equals("image/jpeg") == false
					&& f.getContentType().equals("image/png") == false) {
				model.addAttribute("msg", "이미지 파일만 입력이 가능합니다");
				return "on/addActorFile";
			}
		}
		
		String path = session.getServletContext().getRealPath("/upload/");
		actorFileService.addActorFile(actorForm, path); // 배우의 프로필에 파일을 추가하는 맥락에서 파일 업로드를 처리하는 데 사용
		return "redirect:/on/actorOne?actorId="+actorForm.getActorId();
	}
	
	
	@GetMapping("/on/addActorFile")
	public String addActorFile(Model model, @RequestParam int actorId) {
		model.addAttribute("actorId", actorId);
		return "on/addActorFile";
	}
	
	
}