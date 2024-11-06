package com.example.sakila.vo;

import lombok.Data;

@Data
public class Rental {
	private int rentalId; // PK
	private String rentalDate;
	private int inventoryId; // FK
	private int customerId; // FK
	private String returnDate;
	private int staffId; // FK
	private String lastUpdate;
}
