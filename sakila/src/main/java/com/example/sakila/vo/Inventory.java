package com.example.sakila.vo;

import lombok.Data;

@Data
public class Inventory {
	private int inventoryId; // PK
	private int filmId; // FK
	private int storeId; // FK
	private String lastUpdate;
}
