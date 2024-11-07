package com.example.sakila.vo;

import java.util.List;

import lombok.Data;

@Data
public class FilmForm {
	private String title; 
	private String description;
	private String releaseYear;
	private int languageId; 
	private int originalLanguageId; 
	private int rentalDuration;
	private Double rentalRate;
	private int length;
	private Double replacementCost;
	private String rating;
	
	private List<String> specialFeatures;
	// private String[] specialFeatures;
}