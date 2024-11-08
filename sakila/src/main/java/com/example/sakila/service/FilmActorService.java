package com.example.sakila.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.sakila.mapper.FilmActorMapper;
import com.example.sakila.vo.FilmActor;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class FilmActorService {
	@Autowired FilmActorMapper filmActorMapper;
	
	public int removeFilmActor(FilmActor filmActor) {
		return filmActorMapper.deleteFileActor(filmActor);
	}
	
	public int addFilmActor(FilmActor filmActor) {
		return filmActorMapper.insertFileActor(filmActor);
	}
}