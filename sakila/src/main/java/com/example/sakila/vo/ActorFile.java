package com.example.sakila.vo;

import lombok.Data;

@Data
public class ActorFile {
	private int actorFileId;
	private int actorId;
	private String originname;
	private String filename;
	private String ext;
	private String type;
	private long size;
	private String createDate;
}
