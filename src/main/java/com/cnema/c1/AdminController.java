package com.cnema.c1;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.movie.MovieDTO;
import com.cnema.movie.MovieService;

/*heeseong 코드*/
@Controller
@RequestMapping(value="/admin/**")
public class AdminController {
	@Inject
	MovieService movieService;
	
	@RequestMapping(value="movieList",method=RequestMethod.GET)
	public ModelAndView movieList(){
		ModelAndView mv = new ModelAndView();
		List<MovieDTO> movieList = new ArrayList<>();
		try {
			movieList = movieService.movieAList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("movieList", movieList);
		mv.setViewName("admin/movieList");
		return mv;
	}
}
