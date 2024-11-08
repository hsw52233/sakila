package com.example.sakila.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.sakila.mapper.ActorFileMapper;
import com.example.sakila.mapper.ActorMapper;
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
	
	// /on/filmOne
	public List<Actor> getActorListByFilm(int filmId) { //특정 영화와 관련된 배우 목록을 검색
		return actorMapper.selectActorListByFilm(filmId);
	}
	
	// /on/actorOne
	public Actor getActorOne(int actorId) { // ID를 기준으로 단일 액터의 세부 정보를 가져옵니다
		return actorMapper.selectActorOne(actorId);
	}
	
	//검색 기준에 따라 페이지가 매겨진 배우 목록을 검색
	public List<Actor> getActorList(int currentPage, int rowPerPage, String searchWord) {
		Map<String, Object> paramMap = new HashMap<>();
		int beginRow = (currentPage - 1) * rowPerPage;
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		paramMap.put("searchWord", searchWord);
		
		return actorMapper.selectActorList(paramMap);
	}
	
	//검색 결과에 따라 페이지가 매겨진 배우 목록의 마지막 페이지 번호를 계
	public int getLastPageBySearchWord(int rowPerPage, String searchWord) {
		int count = actorMapper.selectActorCount(searchWord);
		System.out.println("count :" + count);
		int lastPage = count / rowPerPage;
		if(count % rowPerPage != 0) {
			lastPage++;
		}
		return lastPage;
	}
	
	
	public void addActor(ActorForm actorForm, String path) {
		 Actor actor = new Actor();
		 actor.setFirstName(actorForm.getFirstName());
		 actor.setLastName(actorForm.getLastName());
		 
		 int row1 = actorMapper.insertActor(actor); //ActorMapper새로운 액터를 데이터베이스에 삽입
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
