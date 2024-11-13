package com.example.sakila.vo;

import lombok.Data;

@Data
public class Category {
	private Integer categoryId; // PK
	private String name;
	private String lastUpdate;
}
