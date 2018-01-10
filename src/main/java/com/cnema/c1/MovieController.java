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
import com.cnema.movie.ReviewDTO;
import com.cnema.movie.WishDTO;

@Controller
@RequestMapping(value = "/movie/*")
public class MovieController {

	@Inject
	private MovieService movieService;
	
	
	//selectOne
	@RequestMapping(value="movie_view", method=RequestMethod.GET)
	public ModelAndView selectOne(int movie_num, ModelAndView mv, HttpSession session, RedirectAttributes rd) throws Exception {
		MovieDTO movieDTO = null;
		movieDTO = movieService.selectOne(movie_num);
		String id = "";
		try {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			id = memberDTO.getId();
		} catch (Exception e) {
			// TODO: handle exception
		}

		if(id != null) {
			List<WishDTO> wish = movieService.wishList(id);
			mv.addObject("wish_list", wish);
		}
		
		//review
		List<ReviewDTO> review_ar = movieService.reviewList(movie_num);

		for(ReviewDTO reviewDTO : review_ar) {
			System.out.println(reviewDTO.getContents());
		}
		
		mv.addObject("review", review_ar);
		mv.addObject("movie", movieDTO);
		mv.addObject("movie_num", movie_num);
		mv.setViewName("movie/movie_view");
		return mv;
	}

	//selectList
	@RequestMapping(value = "movieList")
	public ModelAndView selectList(ModelAndView mv) throws Exception {
		return mv;
	}


	//movieList
	@RequestMapping(value = "movie_chart", method=RequestMethod.GET)
	public ModelAndView movieList(String kind, HttpSession session, RedirectAttributes rd) throws Exception {
		ModelAndView mv = new ModelAndView();
		String id = "";
		try {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			id = memberDTO.getId();
		} catch (Exception e) {
			// TODO: handle exception
		}

		List<MovieDTO> ar = movieService.movieList(kind);
		mv.addObject("movie_list", ar);
		if(id != null) {
			List<WishDTO> wish = movieService.wishList(id);
			mv.addObject("wish_list", wish);
			mv.addObject("kind", kind);
		}

		return mv;
	}

	//insert
	


	//delete
	
	//update

	
}
