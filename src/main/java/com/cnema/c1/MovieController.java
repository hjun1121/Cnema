package com.cnema.c1;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnema.member.MemberDTO;
import com.cnema.movie.MovieDTO;
import com.cnema.movie.MovieService;

@Controller
@RequestMapping(value = "/movie/*")
public class MovieController {

	@Inject
	private MovieService movieService;
	
	//selectOne
	@RequestMapping(value="movie_view")
	public ModelAndView selectOne(String id,ModelAndView mv,RedirectAttributes rd) throws Exception {
		MovieDTO movieDTO = null;
		int num = 1;
		movieDTO = movieService.selectOne(num);
		System.out.println(movieDTO.getMovie_name());
		
		mv.addObject("movie", movieDTO);
		mv.setViewName("movie/movieView");
		return mv;
	}
	//selectList
	@RequestMapping(value = "movieList")
	public ModelAndView selectList(ModelAndView mv) throws Exception {
		return mv;
	}
	
	//movieList
	@RequestMapping(value = "movie_chart", method=RequestMethod.GET)
	public ModelAndView movieList(String kind) throws Exception {
		ModelAndView mv = new ModelAndView();
		if(kind == null) {
			kind = "reserve_rate";
		}
		List<MovieDTO> ar = movieService.movieList(kind);
		mv.addObject("movie_list", ar);
		return mv;
	}
	
//	//insert
//	@RequestMapping(value="movie_chart", method=RequestMethod.GET)
//	public void insert() {
//	}
//	
//	@RequestMapping(value="movie_chart", method=RequestMethod.POST)
//	public ModelAndView insert(MovieDTO movieDTO, HttpSession session, RedirectAttributes rd) {
//		int result = 0;
//		try {
//			result = movieService.insert(movieDTO, session);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		ModelAndView mv = new ModelAndView();
//		if(result>0) {
//			rd.addFlashAttribute("message", "영화 insert 성공");
//			mv.setViewName("redirect:../");
//		} else {
//			rd.addFlashAttribute("message", "영화 insert 실패");
//			mv.setViewName("redirect:../");
//		}
//		
//		return mv;
//	}

	
	//delete
	
	//update

	
}
