package com.cnema.c1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnema.coupon.MyCouponDTO;
import com.cnema.member.MemberDTO;
import com.cnema.movie.MovieDTO;
import com.cnema.movie.MovieService;

@Controller
@RequestMapping(value="/movie/**")
public class MovieController {

	@Inject
	private MovieService movieService;
	
	//selectOne
	@RequestMapping(value="movie_view")
	public ModelAndView selectOne(String id,ModelAndView mv,RedirectAttributes rd) throws Exception {
		MovieDTO movieDTO = null;
		int num = 1;
		movieDTO = movieService.selectOne(num);
		System.out.println(movieDTO.getM_name());
		
		mv.addObject("movie", movieDTO);
		mv.setViewName("movie/movieView");

		return mv;
	}
	
	//insert
	
	//delete
	
	//update

	
}
