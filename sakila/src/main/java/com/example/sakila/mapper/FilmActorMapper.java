package com.example.sakila.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.FilmActor;

@Mapper
public interface FilmActorMapper {
	// 필름 삭제시 film_actor들 삭제
	Integer deleteFilmActorByFilm(int filmId);
	
	// 배우 삭제시 flim_actor들을 삭제
	int deleteFileByActor(int actorId); // Integer deleteFilmActorByActor(int actorId)
	
	int deleteFileActor(FilmActor filmActor);
	
	int insertFileActor(FilmActor filmActor);
}