package com.cnema.c1;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.RequestMethod;
=======
>>>>>>> parent of 2ba8889... 씨발럼
import org.springframework.web.servlet.ModelAndView;
<<<<<<< HEAD
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

<<<<<<< HEAD
import com.cnema.coupon.MyCouponDTO;
import com.cnema.member.MemberDTO;
import com.cnema.movie.MovieDTO;
=======
>>>>>>> 7fd5c7a548766b0d0d6c04021eccbf3f8e3fe80a
import com.cnema.movie.MovieService;
=======
import com.cnema.member.MemberDTO;
import com.cnema.movie.MovieDTO;
=======

>>>>>>> parent of 41279c7... Hi
import com.cnema.movie.MovieService;
import com.cnema.util.ListData;
>>>>>>> parent of 2ba8889... 씨발럼

@Controller
@RequestMapping(value = "/movie/*")
public class MovieController {

	@Inject
	private MovieService movieService;
	
<<<<<<< HEAD
	//selectOne
<<<<<<< HEAD
	@RequestMapping(value="movie_view")
	public ModelAndView selectOne(String id,ModelAndView mv,RedirectAttributes rd) throws Exception {
		MovieDTO movieDTO = null;
		int num = 1;
		movieDTO = movieService.selectOne(num);
		System.out.println(movieDTO.getM_name());
		
		mv.addObject("movie", movieDTO);
		mv.setViewName("movie/movieView");


=======
	@RequestMapping(value="noticeView")
	public ModelAndView selectOne(String id,ModelAndView mv,RedirectAttributes rd) throws Exception {
		MovieDTO movieDTO = null;
		
		
		MemberDTO memberDTO = null;
		id="hseong";
		try {
			//memberDTO = memberService.selectOne(id);
			System.out.println(memberDTO.getName());
		} catch (Exception e) {
			e.printStackTrace();
		}

		if(memberDTO != null){
			mv.addObject("myInfo",memberDTO);
			mv.setViewName("member/myPageView");
		}else{
			rd.addFlashAttribute("message","로그인이 필요합니다.");
			mv.setViewName("redirect:../home");
		}
		return mv;
	}
	
=======
	
	//selectList
	@RequestMapping(value = "movieList")
	public ModelAndView selectList(ModelAndView mv) throws Exception {
		mv = movieService.selectList();
		
>>>>>>> parent of 2ba8889... 씨발럼
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
	
<<<<<<< HEAD

=======
>>>>>>> parent of 41279c7... Hi
>>>>>>> parent of 2ba8889... 씨발럼
	//insert
	
	//delete
	
	//update

	
}
