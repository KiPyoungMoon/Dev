package com.DAO;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class timeVO {
	private String time;
	private String day;
	private String fullTime;

	public timeVO() {
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = dayTime.format(new Date(time));
		System.out.println("str >> " + str);
		String[] timeArr = str.split(" ");
		
		this.fullTime = str;
		this.day = timeArr[0];
		this.time = timeArr[1];

		for (int i = 0; i < timeArr.length; i++) {
			System.out.println("timeArr >> " + timeArr[i]);

		}
	}

	public String getTime() {
		return time;
	}

	public String getDay() {
		return day;
	}
	
	public String getfullTime() {
		return fullTime;
	}
	
}
