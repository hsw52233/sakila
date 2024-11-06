package com.example.sakila.vo;

import lombok.Data;

@Data
public class Country {
	private int countryId; // PK
	private String country;
	private String lastUpdate;
}
