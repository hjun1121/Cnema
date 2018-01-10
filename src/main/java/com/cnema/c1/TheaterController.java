package com.cnema.c1;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cnema.movie.MovieDTO;
import com.cnema.movie.MovieService;
import com.cnema.reserve.ReserveDTO;
import com.cnema.theater.DayDTO;
import com.cnema.theater.ScheduleDTO;
import com.cnema.theater.ScheduleService;
import com.cnema.theater.ScreenDTO;
import com.cnema.theater.TheaterDTO;
import com.cnema.theater.TheaterService;

@Controller
@RequestMapping(value="theater/**")
public class TheaterController {
	
	@Inject
	private TheaterService theaterService;
	@Inject
	private MovieService movieService;
	@Inject
	private ScheduleService scheduleService;
	
	@RequestMapping(value="quickReserve2", method=RequestMethod.GET)
	public void quickReserve2(Model model, ReserveDTO reserveDTO){
		MovieDTO movieDTO = null;
		TheaterDTO theaterDTO = null;
		ScheduleDTO scheduleDTO = null;
		ScreenDTO screenDTO = null;
		try {
			movieDTO = movieService.selectOne(reserveDTO.getMovie_num());
			theaterDTO = theaterService.selectOne(reserveDTO.getTheater_num());
			scheduleDTO = scheduleService.scheduleOne(reserveDTO.getSchedule_num());
			screenDTO = scheduleService.screenOne(scheduleDTO.getScreen_num());			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("screenDTO", screenDTO);
		model.addAttribute("day", reserveDTO.getDay_num());
		model.addAttribute("theater", theaterDTO);
		model.addAttribute("movie", movieDTO);
		model.addAttribute("reserve", reserveDTO);
		
	}
	
	@RequestMapping(value="quickReserve", method=RequestMethod.GET)
	public void quickReserve(Model model, String area, String kind){
		
		if(area == null){
			area="서울";
		}
		
		List<MovieDTO> movieList = null;
		List<TheaterDTO> theaterList = null;
		List<DayDTO> dayList = null;
		try {
			movieList = movieService.movieList(kind);
			theaterList = theaterService.locationList(area);
			dayList = theaterService.dayList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("location", theaterList);
		model.addAttribute("movie", movieList);
		model.addAttribute("dayList", dayList);
	}
	
	@RequestMapping(value="scheduleList")
	public void scheduleList(){
		
	}
}
