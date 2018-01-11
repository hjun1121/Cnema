package com.cnema.reserve;

public class TicketPriceDTO {
	private int tp_num;
	private int people;
	private int adult_num;
	private int teen_num;
	private int total_price;
	private int c_num;
	private int point;
	private int price;
	
	
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
	public int getTp_num() {
		return tp_num;
	}
	public void setTp_num(int tp_num) {
		this.tp_num = tp_num;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getC_num() {
		return c_num;
	}
	public void setC_num(int c_num) {
		this.c_num = c_num;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
}
