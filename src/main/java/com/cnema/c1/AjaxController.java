package com.cnema.c1;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.member.MemberDTO;
import com.cnema.member.MemberService;
import com.cnema.movie.MovieDTO;
import com.cnema.movie.MovieService;
import com.cnema.theater.TheaterDTO;
import com.cnema.theater.TheaterService;

@Controller
@RequestMapping(value="/ajax/*")
public class AjaxController {

	@Inject
	private MemberService memberService;
	@Inject
	private TheaterService theaterService;
	@Inject
	private MovieService movieService;
	
	
	//movieWish
	@RequestMapping(value = "movie_wish", method=RequestMethod.POST)
	public ModelAndView movieWish(String id, int num) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		result = movieService.movieWish(id, num);
		if(result > 0) {
			mv.addObject("message", "성공");
		} else {
			mv.addObject("message", "실패");
		}
		mv.setViewName("ajax/movie_wish");

		return mv;
	}
	
	@RequestMapping(value="qrTheater", method=RequestMethod.POST)
	public void qrTheater(int theater_num, Model model){
		TheaterDTO theaterDTO = null;
		
		try {
			theaterDTO = theaterService.selectOne(theater_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("theater", theaterDTO);
		
		
	}
	
	@RequestMapping(value="qrMovie", method=RequestMethod.POST)
	public void qrMovie(int movie_num, Model model){
		MovieDTO movieDTO = null;
		try {
			movieDTO = movieService.selectOne(movie_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("movie", movieDTO);
		
	}
	
	@RequestMapping(value="idFind", method=RequestMethod.POST)
	public ModelAndView idFind(MemberDTO memberDTO){
		ModelAndView mv = new ModelAndView();
			List<MemberDTO> ar=null;
		try {
			ar = memberService.idFind(memberDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			mv.addObject("idList", ar);
			mv.setViewName("ajax/idFindList");
		return mv;
	}
	
	@RequestMapping(value="locationList", method=RequestMethod.POST)
	public ModelAndView locationList(String area){
		List<TheaterDTO> ar = null;;
		try {
			ar = theaterService.locationList(area);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("location", ar);
		mv.setViewName("ajax/locationList");
		
		return mv;
	}
	
	@RequestMapping(value="emailCheck", method=RequestMethod.POST)
	public String emailCheck(){
		return "ajax/emailCheck";
	}
	
	@RequestMapping(value="idCheck", method=RequestMethod.POST)
	public ModelAndView idCheck(String id){
		MemberDTO memberDTO =null;
		try {
			memberDTO = memberService.memberInfo(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ModelAndView mv = new ModelAndView();
		if(memberDTO == null){
			mv.addObject("result", "ok");
		}else{
			mv.addObject("result", "no");
		}
		mv.setViewName("ajax/idCheck");
		
		return mv;
	}
	
}
