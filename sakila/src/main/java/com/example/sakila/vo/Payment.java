package com.example.sakila.vo;

import lombok.Data;

@Data
public class Payment {
	private int paymentId; // PK
	private int customerId; // FK
	private int staffId; // FK
	private int rentalId; // FK
	private Double amount;
	private String paymentDate;
	private String lastUpdate;
}
