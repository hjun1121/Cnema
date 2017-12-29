package com.cnema.c1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
<<<<<<< HEAD
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnema.coupon.MyCouponDTO;
import com.cnema.member.MemberDTO;
import com.cnema.movie.MovieDTO;
=======
>>>>>>> 7fd5c7a548766b0d0d6c04021eccbf3f8e3fe80a
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
		System.out.println(movieDTO.getM_name());
		
		mv.addObject("movie", movieDTO);
		mv.setViewName("movie/movieView");


		return mv;
	}
	
//	//selectOne
//	@RequestMapping(value="noticeView")
//	public ModelAndView selectOne(ModelAndView mv, int num, RedirectAttributes rd) throws Exception{
//		BoardDTO boardDTO = null;
//		
//			boardDTO = noticeService.selectOne(num);
//		
//		
//		if(boardDTO != null){
//			mv.addObject("view", boardDTO);
//			mv.setViewName("board/boardView");
//		}else{
//			rd.addFlashAttribute("message","해당 번호의 게시물이 존재하지 않습니다.");
//			mv.setViewName("redirect:./noticeList");
//		}
//		mv.addObject("board", "notice");
//		
//		return mv;
//	}
	

	//insert
	
	//delete
	
	//update

	
}
