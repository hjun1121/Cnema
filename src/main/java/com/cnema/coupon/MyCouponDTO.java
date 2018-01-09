package com.cnema.coupon;

import java.sql.Date;

public class MyCouponDTO {
	private int num;
	private String name;
	private String id;
	private Date v_date;
	private Date publish_date;
	private Date use_date;
	private int type;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getV_date() {
		return v_date;
	}
	public void setV_date(Date v_date) {
		this.v_date = v_date;
	}
	public Date getPublish_date() {
		return publish_date;
	}
	public void setPublish_date(Date publish_date) {
		this.publish_date = publish_date;
	}
	public Date getUse_date() {
		return use_date;
	}
	public void setUse_date(Date use_date) {
		this.use_date = use_date;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
}
