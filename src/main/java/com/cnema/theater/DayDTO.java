package com.cnema.theater;

import java.sql.Date;

public class DayDTO {

	private Date day_num;
	private int day;
	private String week;
	private int month;
	
	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public Date getDay_num() {
		return day_num;
	}

	public void setDay_num(Date day_num) {
		this.day_num = day_num;
	}
	
	
}
