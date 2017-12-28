package com.cnema.theater;

public class ScreenDTO {
	private int screen_num;
	private int t_num;
	private int floor;
	
	public int getNum() {
		return t_num;
	}
	public void setNum(int t_num) {
		this.t_num = t_num;
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
