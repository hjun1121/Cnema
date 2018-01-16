package com.cnema.theater;

import java.sql.Date;

public class ScheduleDTO {
	private int schedule_num;
	private int screen_num;
	private int movie_num;
	private String in_time;
	private String out_time;
	private Date day;
	
	private int seatcheck;
	
	public int getSeatcheck() {
		return seatcheck;
	}
	public void setSeatcheck(int seatcheck) {
		this.seatcheck = seatcheck;
	}
	public int getSchedule_num() {
		return schedule_num;
	}
	public void setSchedule_num(int schedule_num) {
		this.schedule_num = schedule_num;
	}
	public int getScreen_num() {
		return screen_num;
	}
	public void setScreen_num(int screen_num) {
		this.screen_num = screen_num;
	}
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public String getIn_time() {
		return in_time;
	}
	public void setIn_time(String in_time) {
		this.in_time = in_time;
	}
	public String getOut_time() {
		return out_time;
	}
	public void setOut_time(String out_time) {
		this.out_time = out_time;
	}
	public Date getDay() {
		return day;
	}
	public void setDay(Date day) {
		this.day = day;
	}
	

}
