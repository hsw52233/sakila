package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmActor;

@Mapper
public interface FilmActorMapper {
	
	int deleteFileActor(FilmActor filmActor);
	
	int insertFileActor(FilmActor filmActor);
}