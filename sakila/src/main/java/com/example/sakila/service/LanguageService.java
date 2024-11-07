package com.example.sakila.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.LanguageMapper;
import com.example.sakila.vo.Language;

@Service 
@Transactional 
public class LanguageService {
	@Autowired LanguageMapper languageMapper;
	
	public List<Language> getLanguageList() {
		return languageMapper.selectLanguageList();
	}
}