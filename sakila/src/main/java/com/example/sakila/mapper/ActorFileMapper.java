package com.example.sakila.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sakila.vo.ActorFile;

@Mapper
public interface ActorFileMapper {
	// [Service] /on/removeActorFile 
	ActorFile selectActorFileOne(int actorFileId);
	
	// /on/removeActorFile
	int deleteActorFile(int actorFileId);
	
	// /on/actorOne
	List<ActorFile> selectActorFileListByActor(int actorId);
	
	int insertActorFile(ActorFile actorFile);
}