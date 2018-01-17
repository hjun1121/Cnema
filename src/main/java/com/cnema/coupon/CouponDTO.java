package com.cnema.coupon;

public class CouponDTO {
	private String name;
	private int type;
	private String price;
	private int v_day;
	private int c_num;
	
	private String v_date;
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getV_day() {
		return v_day;
	}

	public void setV_day(int v_day) {
		this.v_day = v_day;
	}

	public int getC_num() {
		return c_num;
	}

	public void setC_num(int c_num) {
		this.c_num = c_num;
	}

	public String getV_date() {
		return v_date;
	}

	public void setV_date(String v_date) {
		this.v_date = v_date;
	}
}
