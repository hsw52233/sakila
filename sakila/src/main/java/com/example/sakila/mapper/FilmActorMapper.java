package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmActor;

@Mapper
public interface FilmActorMapper {
	// 배우 삭제시 flim_actor들을 삭제
	int deleteFileByActor(int actorId);
	
	int deleteFileActor(FilmActor filmActor);
	
	int insertFileActor(FilmActor filmActor);
}