package com.cnema.c1;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@RequestMapping(value="movieView",method=RequestMethod.GET)
	public ModelAndView movieView(int movie_num){
		ModelAndView mv = new ModelAndView();
		MovieDTO movieDTO = null;
		try {
			movieDTO = movieService.movieInfo(movie_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("movieDTO", movieDTO);
		mv.setViewName("admin/movieView");
		return mv;
	}
	
	@RequestMapping(value="movieRevision",method=RequestMethod.GET)
	public ModelAndView movieRevision(int movie_num){
		ModelAndView mv = new ModelAndView();
		MovieDTO movieDTO = null;
		try {
			movieDTO = movieService.movieInfo(movie_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("movieDTO", movieDTO);
		mv.setViewName("admin/movieRevision");
		return mv;
	}
	
	@RequestMapping(value="movieRevision",method=RequestMethod.POST)
	public ModelAndView movieRevision(MovieDTO movieDTO,RedirectAttributes rd){
		ModelAndView mv = new ModelAndView();
		int result = 0;
		try {
			result = movieService.movieRevision(movieDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result>0) {
			rd.addFlashAttribute("message", "영화 수정 성공");
			mv.setViewName("redirect:../");
		} else {
			rd.addFlashAttribute("message", "영화 수정 실패");
			mv.setViewName("redirect:../");
		}
		return mv;
	}
}
