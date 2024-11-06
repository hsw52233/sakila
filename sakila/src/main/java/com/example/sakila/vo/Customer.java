package com.example.sakila.vo;

import lombok.Data;

@Data
public class Customer {
	private int customerId; // PK
	private int storeId; // FK
	private String firstName;
	private String lastName; // FK
	private String email;
	private int addressId; // FK
	private int active;
	private String createDate;
	private String lastUpdate;
}
