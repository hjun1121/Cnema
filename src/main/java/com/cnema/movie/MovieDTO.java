package com.cnema.movie;

import java.sql.Date;

public class MovieDTO {

	private int movie_num;
	private String movie_name;
	private String fileName;
	private String oriName;
	private String teaser_url;
	private int reserve_rate;
	private int wish;
	private Date open_date;
	private int run_time;
	private int grade; //평점
	private int type;
	private String contents;
	private int age_limit;



	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public String getTeaser_url() {
		return teaser_url;
	}
	public void setTeaser_url(String teaser_url) {
		this.teaser_url = teaser_url;
	}
	public int getReserve_rate() {
		return reserve_rate;
	}
	public void setReserve_rate(int reserve_rate) {
		this.reserve_rate = reserve_rate;
	}
	public int getWish() {
		return wish;
	}
	public void setWish(int wish) {
		this.wish = wish;
	}
	public Date getOpen_date() {
		return open_date;
	}
	public void setOpen_date(Date open_date) {
		this.open_date = open_date;
	}
	public int getRun_time() {
		return run_time;
	}
	public void setRun_time(int run_time) {
		this.run_time = run_time;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getAge_limit() {
		return age_limit;
	}
	public void setAge_limit(int age_limit) {
		this.age_limit = age_limit;
	}
	
}
