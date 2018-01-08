package com.cnema.c1;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.member.MemberDTO;
import com.cnema.member.MemberService;
import com.cnema.movie.MovieDTO;
import com.cnema.movie.MovieService;
import com.cnema.theater.ScheduleDTO;
import com.cnema.theater.ScheduleService;
import com.cnema.theater.ScreenDTO;
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
	@Inject
	private ScheduleService scheduleService;
	
	
	//movieWish
	@RequestMapping(value = "movie_wish", method=RequestMethod.POST)
	public ModelAndView movieWish(int movie_num, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String id = memberDTO.getId();
		int result = 0;
		result = movieService.movieWish(id, movie_num);
		if(result > 0) {
			mv.addObject("message", "성공");
		} else {
			mv.addObject("message", "실패");
		}
		mv.setViewName("ajax/movie_wish");

		return mv;
	}

	@RequestMapping(value="qrSeatList", method=RequestMethod.POST)
	public void qrSeatList(int schedule_num, Model model){
		
		ScheduleDTO scheduleDTO=null;
		ScreenDTO screenDTO = null;
		try {
			scheduleDTO = scheduleService.scheduleOne(schedule_num);
			screenDTO = scheduleService.screenOne(scheduleDTO.getScreen_num());
			model.addAttribute("screenDTO", screenDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
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
	
	@RequestMapping(value="qrDay", method=RequestMethod.POST)
	public String qrTheater(@RequestParam(defaultValue="2000-01-01", required=false)Date day, @RequestParam(defaultValue="0", required=false)int theater_num, Model model){
		TheaterDTO theaterDTO = null;
		try {
			theaterDTO = theaterService.selectOne(theater_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("day", day);
		model.addAttribute("theater", theaterDTO);
		return "ajax/qrTheater";
	}

	@RequestMapping(value="qrSchedule", method=RequestMethod.POST)
	public String qrTheater(int schedule_num ,@RequestParam(defaultValue="2000-01-01", required=false)Date day_num, @RequestParam(defaultValue="0", required=false)int theater_num, Model model){
		TheaterDTO theaterDTO = null;
		ScheduleDTO scheduleDTO = null;
		ScreenDTO screenDTO = null;
		
		try {
			theaterDTO = theaterService.selectOne(theater_num);
			scheduleDTO = scheduleService.scheduleOne(schedule_num);
			screenDTO = scheduleService.screenOne(scheduleDTO.getScreen_num());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("screen", screenDTO);
		model.addAttribute("day", day_num);
		model.addAttribute("theater", theaterDTO);
		
		return "ajax/qrTheater";
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
	
	@RequestMapping(value="qrScheduleList", method=RequestMethod.POST)
	public void qrSchedule(int theater_num, int movie_num, Date day_num, Model model){
		try {
			List<ScreenDTO> ar= scheduleService.screenList(theater_num);
			model.addAttribute("screenList", ar);
			for(ScreenDTO screenDTO : ar){
				List<ScheduleDTO> ar2 = scheduleService.scheduleList(screenDTO.getScreen_num(), day_num);
				screenDTO.setAr(ar2);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
