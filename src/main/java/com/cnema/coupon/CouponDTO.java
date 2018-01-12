package com.cnema.coupon;

public class CouponDTO {
	private String name;
	private int type;
	private String price;
	private int v_day;
	private int cType;
	
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
	public int getcType() {
		return cType;
	}
	public void setcType(int cType) {
		this.cType = cType;
	}
}
