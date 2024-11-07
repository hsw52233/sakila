package com.example.sakila.vo;

import lombok.Data;

@Data
public class Film {
	private int filmId; // PK
	private String title; // 초록키
	private String description; // NULL
	private Integer releaseYear; // NULL
	private int languageId; // FK
	private Integer originalLanguageId; // FK 기본값 NULL
	private int rentalDuration;
	private double rentalRate;
	private Integer length; // 기본값 NULL
	private double replacementCost;
	private String rating;
	private String specialFeatures; // 기본값 NULL ex) xxx, yyy, zz,
	private String lastUpdate;
}