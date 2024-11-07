
package com.example.sakila.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ActorForm {
	private int actorId;
	private String firstName;
	private String lastName;
	private List<MultipartFile> actorFile; // MultipartFile은 파일 업로드를 처리하는 데 사용되는 framework이다.
}
