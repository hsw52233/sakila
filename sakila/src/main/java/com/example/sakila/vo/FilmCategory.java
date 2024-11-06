package com.example.sakila.vo;

import lombok.Data;

@Data
public class FilmCategory {
	private int filmId; // PK
	private int categoryId; // PK, FK
	private String lastUpdate;
}
