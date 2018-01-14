package com.cnema.c1;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnema.coupon.CouponDTO;
import com.cnema.coupon.CouponService;
import com.cnema.coupon.CoupongroupDTO;
import com.cnema.coupon.CoupongroupService;
import com.cnema.coupon.MyCouponService;
import com.cnema.member.MemberDTO;
import com.cnema.member.MemberService;
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
	@Inject
	MemberService memberService;
	@Inject
	MyCouponService myCouponService;
	@Inject
	CouponService couponService;
	@Inject
	CoupongroupService coupongroupService;
	
	@RequestMapping(value="movieList",method=RequestMethod.GET)
	public ModelAndView movieList(String kind,String search){
		ModelAndView mv = new ModelAndView();
		List<MovieDTO> movieList = new ArrayList<>();
		if(search==null){
			search="";
		}
		try {
			if(kind == null){
				movieList = movieService.movieAList();
			}else{
				if(kind.equals("title")){
					movieList = movieService.movieSearchList(kind,search);
				}
				if(kind.equals("type")){
					movieList = movieService.movieSearchList(kind,search);
				}
				if(kind.equals("actor")){
					movieList = movieService.movieSearchList(kind,search);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("kind", kind);
		mv.addObject("search", search);
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
					theaterList = theaterService.thSearchList(kind,search);
				}
				if(kind.equals("area")){
					theaterList = theaterService.thSearchList(kind,search);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("kind",kind);
		mv.addObject("search",search);
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
		sList = scheduleService.scheduleAList();
		mv.addObject("sList", sList);
		mv.setViewName("admin/scheduleList");
		return mv;
	}
	
	@RequestMapping(value="scheduleInsert", method=RequestMethod.GET)
	public void scheduleInsert() {
	}
	
	@RequestMapping(value="scheduleInsert", method=RequestMethod.POST)
	public void scheduleInsert(ScheduleDTO scheduleDTO,RedirectAttributes rd) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		result = scheduleService.scheduleInsert(scheduleDTO);
		
		if(result>0){
			rd.addAttribute("message", "글쓰기 성공");
			mv.setViewName("redirect:../");
		}else{
			rd.addAttribute("message", "글쓰기 실패");
			mv.setViewName("redirect:../");
		}
	}
	
	@RequestMapping(value="scheduleView", method=RequestMethod.GET)
	public ModelAndView scheduleView(int schedule_num) {
		ModelAndView mv = new ModelAndView();
		ScheduleDTO scheduleDTO = null;
		try {
			scheduleDTO = scheduleService.scheduleInfo(schedule_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("scheduleDTO", scheduleDTO);
		mv.setViewName("admin/scheduleView");
		return mv;
	}
	
	@RequestMapping(value="scheduleRevision", method=RequestMethod.POST)
	public ModelAndView scheduleRevision(ScheduleDTO scheduleDTO,RedirectAttributes rd) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		result = scheduleService.scheduleRevision(scheduleDTO);
		
		if(result>0){
			rd.addAttribute("message","상영시간표 수정 성공");
			mv.setViewName("redirect:../");
		}else{
			rd.addAttribute("message","상영시간표 수정 실패");
			mv.setViewName("redirect:../");
		}
		return mv;
	}
	
	@RequestMapping(value="scheduleRemove", method=RequestMethod.GET)
	public ModelAndView scheduleRemove(int schedule_num,RedirectAttributes rd) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		result = scheduleService.scheduleRemove(schedule_num);
		
		if(result>0){
			rd.addAttribute("message","상영시간표 삭제 성공");
			mv.setViewName("redirect:../");
		}else{
			rd.addAttribute("message","상영시간표 삭제 실패");
			mv.setViewName("redirect:../");
		}
		return mv;
	}
	
	@RequestMapping(value="couponList", method=RequestMethod.GET)
	public ModelAndView couponList(String kind, String search) {
		ModelAndView mv = new ModelAndView();
		List<CouponDTO> cList = new ArrayList<>();
		if(search == null){
			search="";
		}
		if(kind==null){
			try {
				cList = couponService.couponList();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else{
			try {
				cList = couponService.couponSList(kind,search);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		mv.addObject("kind", kind);
		mv.addObject("search", search);
		mv.addObject("cList", cList);
		mv.setViewName("admin/couponList");
		return mv;
	}
	
	@RequestMapping(value="couponInsert", method=RequestMethod.GET)
	public void couponInsert() {
	}
	
	@RequestMapping(value="couponInsert", method=RequestMethod.POST)
	public ModelAndView couponInsert(CouponDTO couponDTO,RedirectAttributes rd) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		try {
			result = couponService.couponInsert(couponDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result>0){
			rd.addAttribute("message", "쿠폰 글쓰기 성공");
			mv.setViewName("redirect:../");
		}else{
			rd.addAttribute("message", "쿠폰 글쓰기 실패");
			mv.setViewName("redirect:../");
		}
		return mv;
	}
	
	@RequestMapping(value="couponRevision", method=RequestMethod.GET)
	public ModelAndView couponRevision(String name) {
		ModelAndView mv = new ModelAndView();
		CouponDTO couponDTO = null;
		try {
			couponDTO = couponService.couponRevisionInfo(name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("couponDTO", couponDTO);
		mv.addObject("type", couponDTO.getType());
		mv.setViewName("admin/couponView");
		return mv;
	}
	
	@RequestMapping(value="couponRevision", method=RequestMethod.POST)
	public ModelAndView couponRevision(CouponDTO couponDTO,RedirectAttributes rd) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		try {
			result = couponService.couponRevision(couponDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result>0){
			rd.addAttribute("message","쿠폰 수정 성공");
			mv.setViewName("redirect:../");
		}else{
			rd.addAttribute("message","쿠폰 수정 실패");
			mv.setViewName("redirect:../");
		}
		return mv;
	}
	
	@RequestMapping(value="memberList", method=RequestMethod.GET)
	public ModelAndView memberList(int group_num) {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = null;
		List<MemberDTO> memList = new ArrayList<MemberDTO>();
		List<CoupongroupDTO> groupList = new ArrayList<>();
		List<CoupongroupDTO> gList = new ArrayList<>();
		int number = 1;
		int result = 0;
		
		
		try {
			groupList = coupongroupService.groupList();
			if(group_num==-1){
				memList = memberService.memberList();
			}else{
				for(int num=0;num<2;num++){
					gList = coupongroupService.groupSList(group_num);
					memberDTO = memberService.memberInfo(gList.get(num).getId());
					memList.add(memberDTO);
				}
			}
			for(MemberDTO memberDTO2 : memList){
				result = myCouponService.couponCount(memberDTO2.getId());
				mv.addObject("result"+number, result);
				number++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("groupList", groupList);
		mv.addObject("memList", memList);
		mv.setViewName("admin/memberList");
		return mv;
	}
	
	/*@RequestMapping(value="couponGive",method=RequestMethod.GET)
	public ModelAndView couponGive(HttpSession session,int ctype){
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		CouponDTO couponDTO = null;
		
		List<MemberDTO> memList = new ArrayList<MemberDTO>();
		List<MyCouponDTO> mcList = new ArrayList<>();
		try {
			memList = memberService.memberCList(ctype);
			couponDTO = couponService.couponInfo(ctype);
			mcList = myCouponService.myCouponAList(memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(MemberDTO memberDTO2 : memList){
			try {
				myCouponService.couponInsert(memberDTO2,couponDTO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		mv.addObject("memList", memList);
		mv.setViewName("admin/memberList");
		return mv;
	}*/
	
	@RequestMapping(value="groupInsert",method=RequestMethod.POST)
	public ModelAndView groupInsert(@RequestParam(value="groupVal[]")List<String> gList){
		ModelAndView mv = new ModelAndView();
		
		Random ran = new Random();
		int number = ran.nextInt(100000);
		
		for(int num=0;num<gList.size();num++){
			try {
				coupongroupService.groupInsert(gList.get(num),number);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return mv;
	}
	
	@RequestMapping(value="groupList",method=RequestMethod.GET)
	public ModelAndView groupList(){
		ModelAndView mv = new ModelAndView();
		List<CoupongroupDTO> groupList = new ArrayList<>();
		List<Object> groupCountList = new ArrayList<>();
		List<CoupongroupDTO> groupCount = new ArrayList<>();
		try {
			groupList = coupongroupService.groupList();
			for(int num=0;num<groupList.size();num++){
				groupCount = coupongroupService.groupSList(groupList.get(num).getGroup_num());
				groupCountList.add(groupCount.size());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("groupCountList", groupCountList);
		mv.addObject("groupList", groupList);
		mv.setViewName("admin/groupList");
		return mv;
	}
	
	@RequestMapping(value="groupRemove",method=RequestMethod.POST)
	public ModelAndView groupRemove(int group_num, RedirectAttributes rd){
		ModelAndView mv = new ModelAndView();
		int result = 0;
		try {
			result = coupongroupService.groupRemove(group_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result>0){
			rd.addAttribute("message","그룹 삭제 성공");
			mv.setViewName("redirect:../");
		}else{
			rd.addAttribute("message","그룹 삭제 실패");
			mv.setViewName("redirect:../");
		}
		return mv;
	}
}
