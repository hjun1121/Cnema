package com.cnema.theater;

import java.util.List;

public class ScreenDTO {
	private int screen_num;
	private int theater_num;
	private int room_num;
	private int floor;
	private int x_num;
	private int y_num;
	private List<ScheduleDTO> ar;
	
	
	public List<ScheduleDTO> getAr() {
		return ar;
	}
	public void setAr(List<ScheduleDTO> ar) {
		this.ar = ar;
	}
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public int getX_num() {
		return x_num;
	}
	public void setX_num(int x_num) {
		this.x_num = x_num;
	}
	public int getY_num() {
		return y_num;
	}
	public void setY_num(int y_num) {
		this.y_num = y_num;
	}
	public int getTheater_num() {
		return theater_num;
	}
	public void setTheater_num(int theater_num) {
		this.theater_num = theater_num;
	}
	public int getScreen_num() {
		return screen_num;
	}
	public void setScreen_num(int screen_num) {
		this.screen_num = screen_num;
	}
	public int getFloor() {
		return floor;
	}
	public void setFloor(int floor) {
		this.floor = floor;
	}
}
