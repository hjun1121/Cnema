package com.cnema.member;

import java.sql.Date;

public class PointDTO {
	private int point_num;
	private String id;
	private String contents;
	private int point_price;
	private Date use_day;
	private int type;
	private String theater;
	
	public int getPoint_num() {
		return point_num;
	}
	public void setPoint_num(int point_num) {
		this.point_num = point_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getPoint_price() {
		return point_price;
	}
	public void setPoint_price(int point_price) {
		this.point_price = point_price;
	}
	public Date getUse_day() {
		return use_day;
	}
	public void setUse_day(Date use_day) {
		this.use_day = use_day;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getTheater() {
		return theater;
	}
	public void setTheater(String theater) {
		this.theater = theater;
	}
}
