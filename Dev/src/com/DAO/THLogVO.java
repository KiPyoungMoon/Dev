package com.DAO;

public class THLogVO {
	private String temperature;
	private String humidity;
	
	public THLogVO(String temperature, String humidity) {
		this.temperature = temperature;
		this.humidity = humidity;
	}

	public String getTemperature() {
		return temperature;
	}

	public String getHumidity() {
		return humidity;
	}
	
}
