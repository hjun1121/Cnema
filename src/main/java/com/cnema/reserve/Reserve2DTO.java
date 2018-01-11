package com.cnema.reserve;

public class Reserve2DTO {

	private int adult_num;
	private int teen_num;
	private int pCount;
	private String people;
	private String seatName;
	private int price;
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getSeatName() {
		return seatName;
	}
	public void setSeatName(String seatName) {
		this.seatName = seatName;
	}
	public int getAdult_num() {
		return adult_num;
	}
	public void setAdult_num(int adult_num) {
		this.adult_num = adult_num;
	}
	public int getTeen_num() {
		return teen_num;
	}
	public void setTeen_num(int teen_num) {
		this.teen_num = teen_num;
	}
	public int getpCount() {
		return pCount;
	}
	public void setpCount(int pCount) {
		this.pCount = pCount;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	
}
