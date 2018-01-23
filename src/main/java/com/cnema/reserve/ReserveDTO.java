package com.cnema.reserve;

import java.util.List;

import com.cnema.movie.MovieDTO;
import com.cnema.movie.ReviewDTO;
import com.cnema.theater.ScheduleDTO;
import com.cnema.theater.ScreenDTO;
import com.cnema.theater.TheaterDTO;

public class ReserveDTO {
	private int reserve_num;
	private int theater_num;
	private int screen_num;
	private int schedule_num;
	private List<Integer> seat_num;
	private int movie_num;
	private String id;
	private int tp_num;
	private int seat;
	private String day_num;
	
	private ScheduleDTO scheduleDTO;
	private TicketPriceDTO ticketPriceDTO;
	private MovieDTO movieDTO;
	private TheaterDTO theaterDTO;
	private ScreenDTO screenDTO;
	private int count;//리뷰갯수
	private ReviewDTO reviewDTO;
	
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
	public List<Integer> getSeat_num() {
		return seat_num;
	}
	public void setSeat_num(List<Integer> seat_num) {
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
	public int getTp_num() {
		return tp_num;
	}
	public void setTp_num(int tp_num) {
		this.tp_num = tp_num;
	}
	public int getSeat() {
		return seat;
	}
	public void setSeat(int seat) {
		this.seat = seat;
	}
	public String getDay_num() {
		return day_num;
	}
	public void setDay_num(String day_num) {
		this.day_num = day_num;
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
	public TheaterDTO getTheaterDTO() {
		return theaterDTO;
	}
	public void setTheaterDTO(TheaterDTO theaterDTO) {
		this.theaterDTO = theaterDTO;
	}
	public ScreenDTO getScreenDTO() {
		return screenDTO;
	}
	public void setScreenDTO(ScreenDTO screenDTO) {
		this.screenDTO = screenDTO;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public ReviewDTO getReviewDTO() {
		return reviewDTO;
	}
	public void setReviewDTO(ReviewDTO reviewDTO) {
		this.reviewDTO = reviewDTO;
	}
}
