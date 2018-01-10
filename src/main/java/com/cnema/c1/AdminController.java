package com.cnema.c1;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnema.movie.MovieDTO;
import com.cnema.movie.MovieService;
import com.cnema.theater.ScheduleDTO;
import com.cnema.theater.ScheduleService;
import com.cnema.theater.TheaterDTO;
import com.cnema.theater.TheaterService;

/*heeseong 코드*/
@Controller
@RequestMapping(value="/admin/**")
public class AdminController {
	@Inject
	MovieService movieService;
	@Inject
	TheaterService theaterService;
	@Inject
	ScheduleService scheduleService;
	
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
	
	@RequestMapping(value="theaterList",method=RequestMethod.GET)
	public ModelAndView theaterList(String kind,String search){
		ModelAndView mv = new ModelAndView();
		List<TheaterDTO> theaterList = new ArrayList<>();
		if(search==null){
			search="";
		}
		try {
			if(kind == null){
				theaterList = theaterService.theatherAList();
			}else{
				if(kind.equals("location")){
					theaterList = theaterService.thLocationList(search);
				}
				if(kind.equals("area")){
					theaterList = theaterService.thAreaList(search);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("theaterList", theaterList);
		mv.setViewName("admin/theaterList");
		return mv;
	}
	@RequestMapping(value="theaterView",method=RequestMethod.GET)
	public ModelAndView theaterView(int theater_num){
		ModelAndView mv = new ModelAndView();
		
		TheaterDTO theaterDTO = null;
		theaterDTO = theaterService.theaterInfo(theater_num);
		
		mv.addObject("theaterDTO",theaterDTO);
		mv.setViewName("admin/theaterView");
		return mv;
	}
	@RequestMapping(value="theaterRevision",method=RequestMethod.GET)
	public ModelAndView theaterRevision(int theater_num){
		ModelAndView mv = new ModelAndView();
		
		TheaterDTO theaterDTO = null;
		theaterDTO = theaterService.theaterInfo(theater_num);
		
		mv.addObject("theaterDTO",theaterDTO);
		mv.setViewName("admin/theaterRevision");
		return mv;
	}
	
	@RequestMapping(value="theaterRevision",method=RequestMethod.POST)
	public ModelAndView theaterRevision(TheaterDTO theaterDTO,RedirectAttributes rd){
		ModelAndView mv = new ModelAndView();
		int result = 0;
		result = theaterService.theaterRevision(theaterDTO);
		if(result>0) {
			rd.addFlashAttribute("message", "극장 수정 성공");
			mv.setViewName("redirect:../");
		} else {
			rd.addFlashAttribute("message", "극장 수정 실패");
			mv.setViewName("redirect:../");
		}
		return mv;
	}
	@RequestMapping(value="theaterRemove",method=RequestMethod.GET)
	public ModelAndView theaterRemove(int theater_num,RedirectAttributes rd){
		ModelAndView mv = new ModelAndView();
		int result = 0;
		result = theaterService.theaterRemove(theater_num);
		if(result>0) {
			rd.addFlashAttribute("message", "극장 삭제 성공");
			mv.setViewName("redirect:../");
		} else {
			rd.addFlashAttribute("message", "극장 삭제 실패");
			mv.setViewName("redirect:../");
		}
		return mv;
	}
	@RequestMapping(value="theaterInsert",method=RequestMethod.GET)
	public ModelAndView theaterInsert(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/theaterInsert");
		return mv;
	}
	@RequestMapping(value="theaterInsert",method=RequestMethod.POST)
	public ModelAndView theaterInsert(TheaterDTO theaterDTO,RedirectAttributes rd){
		ModelAndView mv = new ModelAndView();
		int result = 0;
		result = theaterService.theaterInsert(theaterDTO);
		if(result>0) {
			rd.addFlashAttribute("message", "극장 글쓰기 성공");
			mv.setViewName("redirect:../");
		} else {
			rd.addFlashAttribute("message", "극장 글쓰기 실패");
			mv.setViewName("redirect:../");
		}
		return mv;
	}
	
	@RequestMapping(value="movie_insert", method=RequestMethod.GET)
	public void insert() {
	}

	@RequestMapping(value="movie_insert", method=RequestMethod.POST)
	public ModelAndView insert(MovieDTO movieDTO, HttpSession session, RedirectAttributes rd) {
		int result = 0;
		try {
			result = movieService.insert(movieDTO, session);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView();
		if(result>0) {
			rd.addFlashAttribute("message", "영화 insert 성공");
			mv.setViewName("redirect:../");
		} else {
			rd.addFlashAttribute("message", "영화 insert 실패");
			mv.setViewName("redirect:../");
		}
		
		return mv;
	}
	
	@RequestMapping(value="scheduleList", method=RequestMethod.GET)
	public ModelAndView scheduleList() {
		ModelAndView mv = new ModelAndView();
		List<ScheduleDTO> sList = new ArrayList<>();
		sList = scheduleService.scheduleList();
		mv.addObject("sList", sList);
		mv.setViewName("admin/scheduleList");
		return mv;
	}
}
