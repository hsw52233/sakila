package com.example.sakila.vo;

import lombok.Data;

@Data
public class Film {
	private int filmId; // PK
	private String title; // 초록키
	private String description;
	private String releaseYear;
	private int languageId; // FK
	private int originalLanguageId; // FK
	private int rentalDuration;
	private Double rentalRate;
	private int length;
	private Double replacementCost;
	private String rating;
	private String specialFeatures;
	private String lastUpdate;
}
