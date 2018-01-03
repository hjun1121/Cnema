package com.cnema.theater;

public class ScreenDTO {
	private int screen_num;
	private int theater_num;
	private int floor;

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
