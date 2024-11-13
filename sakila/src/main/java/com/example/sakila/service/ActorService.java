package com.example.sakila.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.management.RuntimeErrorException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.mapper.ActorFileMapper;
import com.example.sakila.mapper.ActorMapper;
import com.example.sakila.mapper.FilmActorMapper;
import com.example.sakila.vo.Actor;
import com.example.sakila.vo.ActorFile;
import com.example.sakila.vo.ActorForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class ActorService {
	@Autowired ActorMapper actorMapper;
	@Autowired ActorFileMapper actorFileMapper;
	@Autowired FilmActorMapper filmActorMapper;
	
	public List<Actor> getActorListByActor(String searchName) {
		return actorMapper.selectActorListByActor(searchName);
	}
	
	
	// /on/removeActor
	public void removeActor(int actorId, String path) {
		// 1) film_actor 삭제(없을 수도 있다)
		filmActorMapper.deleteFileByActor(actorId);
		// 2) actor_file 삭제
		List<ActorFile> list = actorFileMapper.selectActorFileListByActor(actorId);
		actorFileMapper.deleteActorFileByActor(actorId);
		// 3) actor 삭제
		int row = actorMapper.deleteActor(actorId);
		// 4) 물리적 파일 삭제
		if(row == 1 && list !=null && list.size() > 0) { // actor 삭제했고 물리적파일 존재한다면
			for(ActorFile af : list) {
				String fullname = path + af.getFilename() + "." + af.getExt();
				File f = new File(fullname);
				f.delete();
			}
		}
	}
	
	// /on/modifyActor
	public int modifyActor(Actor actor) {
		return actorMapper.updateActor(actor);
	}
	
	// /on/filmOne
	public List<Actor> getActorListByFilm(int filmId) {
		return actorMapper.selectActorListByFilm(filmId);
	}
	
	// /on/actorOne
	public Actor getActorOne(int actorId) {
		return actorMapper.selectActorOne(actorId);
	}
	
	
	public List<Actor> getActorList(int currentPage, int rowPerPage, String searchWord) {
		Map<String, Object> paramMap = new HashMap<>();
		int beginRow = (currentPage - 1) * rowPerPage;
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		return actorMapper.selectActorList(paramMap);
	}
	
	
	public void addActor(ActorForm actorForm, String path) {
		 Actor actor = new Actor();
		 actor.setFirstName(actorForm.getFirstName());
		 actor.setLastName(actorForm.getLastName());
		 
		 int row1 = actorMapper.insertActor(actor);
		 // mybatis selectKey의 값
		 int actorId = actor.getActorId();
		 
		 if(row1 == 1 && actorForm.getActorFile() != null) {
			 // 파일 입력, ActorFile 입력
			 List<MultipartFile> list = actorForm.getActorFile();
			 for(MultipartFile mf : list) {
				 ActorFile actorFile = new ActorFile();
				 
				 actorFile.setActorId(actorId);
				 actorFile.setType(mf.getContentType());
				 actorFile.setSize(mf.getSize());
				 String filename = UUID.randomUUID().toString().replace("-", "");
				 actorFile.setFilename(filename);
				 int dotIdx = mf.getOriginalFilename().lastIndexOf(".");
				 String originname = mf.getOriginalFilename().substring(0, dotIdx);
				 String ext = mf.getOriginalFilename().substring(dotIdx+1);
				 actorFile.setOriginname(originname);
				 actorFile.setExt(ext);
				 
				 int row2 = actorFileMapper.insertActorFile(actorFile);
				 if(row2 == 1) {
					 // 물리적 파일 저장
					 try {
						mf.transferTo(new File(path + filename +"."+ ext));
					 } catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						// 예외 발생하고 예외처리 하지 않아야지 @Transactional 작동한다
						// so... RuntimeException을 인위적으로 발생
						throw new RuntimeException();
					 }	 
				 }
			 }
		 }
	}
}