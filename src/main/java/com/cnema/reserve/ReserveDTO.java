package com.cnema.reserve;

import java.sql.Date;

import com.cnema.movie.MovieDTO;
import com.cnema.theater.ScheduleDTO;

public class ReserveDTO {
	private int reserve_num;
	private int theater_num;
	private int screen_num;
	private int schedule_num;
	private String seat_num;
	private int movie_num;
	private String id;
	private int age_type;
	private int tp_num;
	private Date reg_date;
	
	private ScheduleDTO scheduleDTO;
	private TicketPriceDTO ticketPriceDTO;
	private MovieDTO movieDTO;
	
	public int getReserve_num() {
		return reserve_num;
	}
	public void setReserve_num(int reserve_num) {
		this.reserve_num = reserve_num;
	}
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
	public int getSchedule_num() {
		return schedule_num;
	}
	public void setSchedule_num(int schedule_num) {
		this.schedule_num = schedule_num;
	}
	public String getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(String seat_num) {
		this.seat_num = seat_num;
	}
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getAge_type() {
		return age_type;
	}
	public void setAge_type(int age_type) {
		this.age_type = age_type;
	}
	public int getTp_num() {
		return tp_num;
	}
	public void setTp_num(int tp_num) {
		this.tp_num = tp_num;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public ScheduleDTO getScheduleDTO() {
		return scheduleDTO;
	}
	public void setScheduleDTO(ScheduleDTO scheduleDTO) {
		this.scheduleDTO = scheduleDTO;
	}
	public TicketPriceDTO getTicketPriceDTO() {
		return ticketPriceDTO;
	}
	public void setTicketPriceDTO(TicketPriceDTO ticketPriceDTO) {
		this.ticketPriceDTO = ticketPriceDTO;
	}
	public MovieDTO getMovieDTO() {
		return movieDTO;
	}
	public void setMovieDTO(MovieDTO movieDTO) {
		this.movieDTO = movieDTO;
	}
}
