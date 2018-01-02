package com.cnema.c1;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cnema.movie.MovieDTO;
import com.cnema.movie.MovieService;
import com.cnema.theater.TheaterDTO;
import com.cnema.theater.TheaterService;

@Controller
@RequestMapping(value="theater/**")
public class TheaterController {
	
	@Inject
	private TheaterService theaterService;
	@Inject
	private MovieService movieService;
	@RequestMapping(value="quickReserve", method=RequestMethod.GET)
	public void quickReserve(Model model, String area){
		
		if(area == null){
			area="서울";
		}
		List<MovieDTO> movieList = null;
		List<TheaterDTO> theaterList = null;
		try {
			movieList = movieService.movieList();
			theaterList = theaterService.locationList(area);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("location", theaterList);
		model.addAttribute("movie", movieList);
		
	}
	
	@RequestMapping(value="scheduleList")
	public void scheduleList(){
		
	}
}
