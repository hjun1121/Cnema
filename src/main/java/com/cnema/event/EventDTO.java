package com.cnema.event;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import com.cnema.board.BoardDTO;

public class EventDTO extends BoardDTO{
	private Date s_date;
	private Date e_date;
	private String type;
	private MultipartFile file;
	
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public Date getS_date() {
		return s_date;
	}
	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}
	public Date getE_date() {
		return e_date;
	}
	public void setE_date(Date e_date) {
		this.e_date = e_date;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
}
