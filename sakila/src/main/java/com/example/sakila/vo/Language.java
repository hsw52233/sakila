package com.example.sakila.vo;

import lombok.Data;

@Data
public class Language {
	private int languageId; // PK
	private String name;
	private String lastUpdate;
}
