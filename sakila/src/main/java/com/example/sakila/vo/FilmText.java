package com.example.sakila.vo;

import lombok.Data;

@Data
public class FilmText {
	private int filmId; // PK
	private String title;
	private String description;
}
