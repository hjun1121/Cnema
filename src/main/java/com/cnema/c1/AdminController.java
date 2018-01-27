package com.cnema.c1;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.cnema.member.PointService;
import com.cnema.movie.MovieDTO;
import com.cnema.movie.MovieService;
import com.cnema.qna.QnaService;
import com.cnema.theater.DayDTO;
import com.cnema.theater.ScheduleDTO;
import com.cnema.theater.ScheduleService;
import com.cnema.theater.ScreenDTO;
import com.cnema.theater.TheaterDTO;
import com.cnema.theater.TheaterService;
import com.cnema.util.ListData;
import com.cnema.util.TimeChange;

/*heeseong 코드*/
@Controller
@RequestMapping(value = "/admin/**")
public class AdminController {
	@Inject
	private MovieService movieService;
	@Inject
	private TheaterService theaterService;
	@Inject
	private ScheduleService scheduleService;
	@Inject
	private MemberService memberService;
	@Inject
	private MyCouponService myCouponService;
	@Inject
	private CouponService couponService;
	@Inject
	private CoupongroupService coupongroupService;
	@Inject
	private PointService pointService;
	@Inject
	private TimeChange timeChange;
	@Inject
	private QnaService qnaService;
	
	private int count = 0;
	private int aCount = 0;
	private Calendar ca = Calendar.getInstance();
	private SimpleDateFormat sd = new SimpleDateFormat("YYYY년 MM월 DD일");
	private String today = sd.format(ca.getTime());
	
	@RequestMapping(value="myQnaList")
	public ModelAndView myQnaList(ListData listData,HttpSession session)  {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		int type = 0;
				
			try {
				type =memberDTO.getType();
				count = myCouponService.couponCount(memberDTO.getId());
				aCount = myCouponService.couponACount(memberDTO.getId());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		if(type==20){
	
			try {
				mv = qnaService.selectList(listData);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
		else{
			try {
				mv=qnaService.selectMyList(memberDTO.getId());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
			
			
		mv.addObject("count", count);
		mv.addObject("aCount", aCount);
		mv.addObject("today", today);
		mv.addObject("myInfo", memberDTO);
		
		
		return mv;
		
	}
	
	
	@RequestMapping(value = "movieList", method = RequestMethod.GET)
	public ModelAndView movieList(HttpSession session, String kind, String search) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		List<MovieDTO> movieList = new ArrayList<>();
		if (search == null) {
			search = "";
		}
		try {
			if (kind == null) {
				movieList = movieService.movieList("","");
			} else {
				if (kind.equals("title")) {
					movieList = movieService.movieList(kind, search);
				}
				if (kind.equals("actor")) {
					movieList = movieService.movieList(kind, search);
				}
			}
			count = myCouponService.couponCount(memberDTO.getId());
			aCount = myCouponService.couponACount(memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("count", count);
		mv.addObject("aCount", aCount);
		mv.addObject("today", today);
		mv.addObject("myInfo", memberDTO);
		mv.addObject("kind", kind);
		mv.addObject("search", search);
		mv.addObject("movieList", movieList);
		mv.setViewName("admin/movieList");
		return mv;
	}

	@RequestMapping(value = "movieView", method = RequestMethod.GET)
	public ModelAndView movieView(@RequestParam(defaultValue="-1", required=false)int movie_num,HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		MovieDTO movieDTO = null;
		try {
			movieDTO = movieService.movieInfo(movie_num);
			count = myCouponService.couponCount(memberDTO.getId());
			aCount = myCouponService.couponACount(memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("count", count);
		mv.addObject("aCount", aCount);
		mv.addObject("today", today);
		mv.addObject("myInfo", memberDTO);
		mv.addObject("movieDTO", movieDTO);
		mv.setViewName("admin/movieView");
		return mv;
	}

	@RequestMapping(value = "movieRevision", method = RequestMethod.POST)
	public ModelAndView movieRevision(MovieDTO movieDTO, RedirectAttributes rd) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		try {
			result = movieService.movieRevision(movieDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (result > 0) {
			mv.addObject("message", "영화 정보 수정 완료하였습니다.");
			mv.addObject("path", "./admin/movieList");
			mv.setViewName("common/messagePath");
		} else {
			mv.addObject("message", "영화 정보 수정 실패하였습니다.");
			mv.addObject("path", "./admin/movieList");
			mv.setViewName("common/messagePath");
		}
		return mv;
	}

	@RequestMapping(value = "theaterList", method = RequestMethod.GET)
	public ModelAndView theaterList(HttpSession session, String kind, String search, ListData listData, @RequestParam(defaultValue="1", required=false)int curPage) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		if (search == null) {
			search = "";
		}
		try {
			if (kind == null) {
				mv=theaterService.theaterList("", "", listData);
			} else {
				mv=theaterService.theaterList(kind, search, listData);
			}
			count = myCouponService.couponCount(memberDTO.getId());
			aCount = myCouponService.couponACount(memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("curPage", curPage);
		mv.addObject("page", listData);
		mv.addObject("count", count);
		mv.addObject("aCount", aCount);
		mv.addObject("today", today);
		mv.addObject("myInfo", memberDTO);
		mv.addObject("kind", kind);
		mv.addObject("search", search);
		mv.setViewName("admin/theaterList");
		return mv;
	}

	@RequestMapping(value = "theaterView", method = RequestMethod.GET)
	public ModelAndView theaterView(@RequestParam(defaultValue="-1", required=false)int theater_num,HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		
		TheaterDTO theaterDTO = null;
		try {
			theaterDTO = theaterService.theaterInfo(theater_num);
			count = myCouponService.couponCount(memberDTO.getId());
			aCount = myCouponService.couponACount(memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("count", count);
		mv.addObject("aCount", aCount);
		mv.addObject("today", today);
		mv.addObject("myInfo", memberDTO);
		mv.addObject("theaterDTO", theaterDTO);
		mv.setViewName("admin/theaterView");
		return mv;
	}

	@RequestMapping(value = "theaterRevision", method = RequestMethod.POST)
	public ModelAndView theaterRevision(TheaterDTO theaterDTO, RedirectAttributes rd) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		try {
			result = theaterService.theaterRevision(theaterDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (result > 0) {
			mv.addObject("message", "극장 정보 수정 완료하였습니다.");
			mv.addObject("path", "./admin/theaterList");
			mv.setViewName("common/messagePath");
		} else {
			mv.addObject("message", "극장 정보 수정 실패하였습니다.");
			mv.addObject("path", "./admin/theaterList");
			mv.setViewName("common/messagePath");
		}
		return mv;
	}

	@RequestMapping(value = "theaterRemove", method = RequestMethod.GET)
	public ModelAndView theaterRemove(@RequestParam(defaultValue="-1", required=false)int theater_num, RedirectAttributes rd) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		ScreenDTO screenDTO = null;
		try {
			screenDTO = scheduleService.screenInfo(theater_num);
			result = theaterService.theaterRemove(theater_num);
			result = scheduleService.screenRemove(theater_num);
			result = scheduleService.scheduleRemove(screenDTO.getScreen_num());
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (result > 0) {
			mv.addObject("message", "극장 삭제 성공하였습니다.");
			mv.addObject("path", "./admin/theaterList");
			mv.setViewName("common/messagePath");
		} else {
			mv.addObject("message", "극장 삭제 실패하였습니다.");
			mv.addObject("path", "./admin/theaterList");
			mv.setViewName("common/messagePath");
		}
		return mv;
	}

	@RequestMapping(value = "theaterInsert", method = RequestMethod.GET)
	public ModelAndView theaterInsert(HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		try {
			count = myCouponService.couponCount(memberDTO.getId());
			aCount = myCouponService.couponACount(memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("count", count);
		mv.addObject("aCount", aCount);
		mv.addObject("today", today);
		mv.addObject("myInfo", memberDTO);
		mv.setViewName("admin/theaterInsert");
		return mv;
	}

	@RequestMapping(value = "theaterInsert", method = RequestMethod.POST)
	public ModelAndView theaterInsert(TheaterDTO theaterDTO, RedirectAttributes rd) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		try {
			result = theaterService.theaterInsert(theaterDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (result > 0) {
			mv.addObject("message", "극장 입력 성공하였습니다.");
			mv.addObject("path", "./admin/theaterList");
			mv.setViewName("common/messagePath");
		} else {
			mv.addObject("message", "극장 입력 실패하였습니다.");
			mv.addObject("path", "./admin/theaterList");
			mv.setViewName("common/messagePath");
		}
		return mv;
	}

	@RequestMapping(value = "movieInsert", method = RequestMethod.GET)
	public ModelAndView movieInsert(HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		mv.addObject("myInfo", memberDTO);
		mv.setViewName("admin/movieInsert");
		return mv;
	}

	@RequestMapping(value = "movieInsert", method = RequestMethod.POST)
	public ModelAndView movieInsert(MovieDTO movieDTO, HttpSession session, RedirectAttributes rd) {
		int result = 0;
		try {
			result = movieService.movieInsert(movieDTO, session);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView();
		if (result > 0) {
			mv.addObject("message", "영화 입력 성공하였습니다.");
			mv.addObject("path", "./admin/movieList");
			mv.setViewName("common/messagePath");
		} else {
			mv.addObject("message", "영화 입력 실패하였습니다.");
			mv.addObject("path", "./admin/movieList");
			mv.setViewName("common/messagePath");
		}

		return mv;
	}
	
	@RequestMapping(value = "screenList", method = RequestMethod.GET)
	public ModelAndView screenList(HttpSession session,@RequestParam(defaultValue="-1", required=false)int theater_num,ListData listData, @RequestParam(defaultValue="1", required=false)int curPage) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		List<ScreenDTO> sList = new ArrayList<>();
		TheaterDTO theaterDTO = null;
		try {
			/*if(theater_num!=-1){
				sList = scheduleService.screenList(theater_num);
				mv.addObject("theater_num", theater_num);
			}else{
				sList = scheduleService.screenAList();
				mv.addObject("theater_num", -1);
			}*/
			/*for(ScreenDTO screenDTO : sList){
				theaterDTO = theaterService.selectOne(screenDTO.getTheater_num());
				screenDTO.setTheaterDTO(theaterDTO);
			}*/
			mv = scheduleService.screenAList(listData, theater_num);
			count = myCouponService.couponCount(memberDTO.getId());
			aCount = myCouponService.couponACount(memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("count", count);
		mv.addObject("aCount", aCount);
		mv.addObject("today", today);
		mv.addObject("myInfo", memberDTO);
		/*mv.addObject("sList", sList);*/
		return mv;
	}
	
	@RequestMapping(value="screenView", method = RequestMethod.GET)
	public ModelAndView screenView(HttpSession session,@RequestParam(defaultValue="-1", required=false)int screen_num){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		
		ScreenDTO screenDTO = null;
		TheaterDTO theaterDTO = null;
		try {
			screenDTO = scheduleService.screenOne(screen_num);
			theaterDTO = theaterService.theaterInfo(screenDTO.getTheater_num());
			screenDTO.setTheaterDTO(theaterDTO);
			count = myCouponService.couponCount(memberDTO.getId());
			aCount = myCouponService.couponACount(memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("count", count);
		mv.addObject("aCount", aCount);
		mv.addObject("today", today);
		mv.addObject("screenDTO", screenDTO);
		mv.addObject("myInfo", memberDTO);
		return mv;
	}
	
	@RequestMapping(value="screenRevision", method = RequestMethod.POST)
	public ModelAndView screenRevision(HttpSession session,ScreenDTO screenDTO,RedirectAttributes rd){
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		int result = 0;
		try {
			result = scheduleService.screenRevision(screenDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (result > 0) {
			mv.addObject("message", "영화관 수정 성공하였습니다.");
			mv.addObject("path", "./admin/screenList?theater_num=-1");
			mv.setViewName("common/messagePath");
		} else {
			mv.addObject("message", "영화관  수정 실패하였습니다.");
			mv.addObject("path", "./admin/screenList?theater_num=-1");
			mv.setViewName("common/messagePath");
		}
		mv.addObject("myInfo", memberDTO);
		return mv;
	}
	
	@RequestMapping(value="screenRemove", method = RequestMethod.GET)
	public ModelAndView screenRemove(@RequestParam(defaultValue="-1", required=false)int screen_num,RedirectAttributes rd){
		ModelAndView mv = new ModelAndView();
		
		int result = 0;
		try {
			result = scheduleService.screenRemove(screen_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (result > 0) {
			mv.addObject("message", "영화관 삭제 성공하였습니다.");
			mv.addObject("path", "./admin/screenList?theater_num=-1");
			mv.setViewName("common/messagePath");
		} else {
			mv.addObject("message", "영화관  삭제 실패하였습니다.");
			mv.addObject("path", "./admin/screenList?theater_num=-1");
			mv.setViewName("common/messagePath");;
		}
		return mv;
	}
	
	@RequestMapping(value = "screenInsert", method = RequestMethod.GET)
	public void screenInsert(HttpSession session,Model model,@RequestParam(defaultValue="-1", required=false)int theater_num) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		List<TheaterDTO> areaList = null;
		TheaterDTO theaterDTO = null;
		try {
			areaList = theaterService.areaList();
			if(theater_num!=-1){
				theaterDTO = theaterService.selectOne(theater_num);
				model.addAttribute("theaterDTO", theaterDTO);
			}else{
				
			}
			count = myCouponService.couponCount(memberDTO.getId());
			aCount = myCouponService.couponACount(memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("count", count);
		model.addAttribute("aCount", aCount);
		model.addAttribute("today", today);
		model.addAttribute("myInfo", memberDTO);
		model.addAttribute("areaList", areaList);
	}

	@RequestMapping(value = "screenInsert", method = RequestMethod.POST)
	public ModelAndView screenInsert(ScreenDTO screenDTO, RedirectAttributes rd) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		try {
			result = scheduleService.screenInsert(screenDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (result > 0) {
			mv.addObject("message", "영화관 입력 성공하였습니다.");
			mv.addObject("path", "./admin/screenList?theater_num=-1");
			mv.setViewName("common/messagePath");
		} else {
			mv.addObject("message", "영화관 입력 실패하였습니다.");
			mv.addObject("path", "./admin/screenList?theater_num=-1");
			mv.setViewName("common/messagePath");
		}
		return mv;

	}
	
	@RequestMapping(value = "scheduleList", method = RequestMethod.GET)
	public ModelAndView scheduleList(HttpSession session,ListData listData, @RequestParam(defaultValue="1", required=false)int curPage) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		try {
			mv=scheduleService.scheduleAList(listData);
			count = myCouponService.couponCount(memberDTO.getId());
			aCount = myCouponService.couponACount(memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("curPage", curPage);
		mv.addObject("page", listData);
		
		mv.addObject("count", count);
		mv.addObject("count", count);
		mv.addObject("aCount", aCount);
		mv.addObject("today", today);
		mv.addObject("myInfo", memberDTO);
		mv.setViewName("admin/scheduleList");
		return mv;
	}

	@RequestMapping(value = "scheduleInsert", method = RequestMethod.GET)
	public void scheduleInsert(Model model,HttpSession session) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		List<TheaterDTO> areaList = null;
		List<MovieDTO> movieList = null;
		List<DayDTO> dayList = null;
		try {
			areaList = theaterService.areaList();
			movieList = movieService.qrMovieList();
			dayList = theaterService.dayList();
			count = myCouponService.couponCount(memberDTO.getId());
			aCount = myCouponService.couponACount(memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("count", count);
		model.addAttribute("aCount", aCount);
		model.addAttribute("today", today);
		model.addAttribute("areaList", areaList);
		model.addAttribute("movieList", movieList);
		model.addAttribute("myInfo", memberDTO);
		model.addAttribute("dayList", dayList);
	}

	@RequestMapping(value = "scheduleInsert", method = RequestMethod.POST)
	public ModelAndView scheduleInsert(ScheduleDTO scheduleDTO, @RequestParam(defaultValue="-1", required=false)int count, @RequestParam(defaultValue="-1", required=false)int next_time, RedirectAttributes rd) {
		ModelAndView mv = new ModelAndView();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String day = sd.format(scheduleDTO.getDay());
		int result = 0;
		for (int i = 1; i <= count; i++) {
			int next = 0;
			if (i == 1) {
				next = 0;
			} else {
				next = next_time;
			}
			String in_time = timeChange.getInTime(day, scheduleDTO.getIn_time(), next);
			scheduleDTO.setIn_time(in_time);

			String out_time = timeChange.getOutTime(day, scheduleDTO.getIn_time(), scheduleDTO.getMovie_num());
			scheduleDTO.setOut_time(out_time);
			try {
				result = scheduleService.scheduleInsert(scheduleDTO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (result > 0) {
			mv.addObject("message", "영화 스케줄 입력 성공하였습니다.");
			mv.addObject("path", "./admin/scheduleList");
			mv.setViewName("common/messagePath");
		} else {
			mv.addObject("message", "영화 스케줄 입력 실패하였습니다.");
			mv.addObject("path", "./admin/scheduleList");
			mv.setViewName("common/messagePath");
		}
		return mv;
	}

	@RequestMapping(value = "scheduleView", method = RequestMethod.GET)
	public ModelAndView scheduleView(HttpSession session,@RequestParam(defaultValue="-1", required=false)int schedule_num) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		ScheduleDTO scheduleDTO = null;
		List<DayDTO> dayList = null;
		try {
			scheduleDTO = scheduleService.scheduleInfo(schedule_num);
			dayList = theaterService.dayList();
			count = myCouponService.couponCount(memberDTO.getId());
			aCount = myCouponService.couponACount(memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("count", count);
		mv.addObject("aCount", aCount);
		mv.addObject("today", today);
		mv.addObject("selectDay", scheduleDTO.getDay());
		mv.addObject("scheduleDTO", scheduleDTO);
		mv.addObject("myInfo", memberDTO);
		mv.addObject("dayList", dayList);
		mv.setViewName("admin/scheduleView");
		return mv;
	}

	@RequestMapping(value = "scheduleRevision", method = RequestMethod.POST)
	public ModelAndView scheduleRevision(ScheduleDTO scheduleDTO, RedirectAttributes rd) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		try {
			result = scheduleService.scheduleRevision(scheduleDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			rd.addAttribute("message", "영화 상영시간표 수정 성공하였습니다.");
			mv.addObject("path", "./admin/scheduleList");
			mv.setViewName("common/messagePath");
		} else {
			rd.addAttribute("message", "영화 상영시간표 수정 실패하였습니다");
			mv.addObject("path", "./admin/scheduleList");
			mv.setViewName("common/messagePath");
		}
		return mv;
	}

	@RequestMapping(value = "scheduleRemove", method = RequestMethod.GET)
	public ModelAndView scheduleRemove(@RequestParam(defaultValue="-1", required=false)int schedule_num, RedirectAttributes rd) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		try {
			result = scheduleService.scheduleRemove(schedule_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			rd.addAttribute("message", "영화 상영시간표 삭제 성공하였습니다.");
			mv.addObject("path", "./admin/scheduleList");
			mv.setViewName("common/messagePath");
		} else {
			rd.addAttribute("message", "영화상영시간표 삭제 실패하였습니다.");
			mv.addObject("path", "./admin/scheduleList");
			mv.setViewName("common/messagePath");
		}
		return mv;
	}

	@RequestMapping(value = "couponList", method = RequestMethod.GET)
	public ModelAndView couponList(HttpSession session,String kind, String search) {
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		List<CouponDTO> cList = new ArrayList<>();
		if (search == null) {
			search = "";
		}
		if (kind == null) {
			try {
				cList = couponService.couponList("","");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				cList = couponService.couponList(kind, search);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		mv.addObject("myInfo", memberDTO);
		mv.addObject("kind", kind);
		mv.addObject("search", search);
		mv.addObject("cList", cList);
		mv.setViewName("admin/couponList");
		return mv;
	}

	@RequestMapping(value = "couponInsert", method = RequestMethod.GET)
	public void couponInsert() {
	}

	@RequestMapping(value = "couponInsert", method = RequestMethod.POST)
	public ModelAndView couponInsert(CouponDTO couponDTO, RedirectAttributes rd) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		try {
			result = couponService.couponInsert(couponDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			rd.addAttribute("message", "쿠폰 입력 성공하였습니다.");
			mv.addObject("path", "./admin/couponList");
			mv.setViewName("common/messagePath");
		} else {
			rd.addAttribute("message", "쿠폰 입력 실패하였습니다.");
			mv.addObject("path", "./admin/couponList");
			mv.setViewName("common/messagePath");
		}
		return mv;
	}

	/*@RequestMapping(value = "couponRevision", method = RequestMethod.GET)
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

	@RequestMapping(value = "couponRevision", method = RequestMethod.POST)
	public ModelAndView couponRevision(CouponDTO couponDTO, RedirectAttributes rd) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		try {
			result = couponService.couponRevision(couponDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			rd.addAttribute("message", "쿠폰 수정 성공");
			mv.setViewName("redirect:../");
		} else {
			rd.addAttribute("message", "쿠폰 수정 실패");
			mv.setViewName("redirect:../");
		}
		return mv;
	}*/

	@RequestMapping(value = "memberList", method = RequestMethod.GET)
	public ModelAndView memberList(@RequestParam(defaultValue="-1", required=false)int group_num, @RequestParam(defaultValue="-1", required=false)int sort) {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = null;
		List<MemberDTO> memList = new ArrayList<MemberDTO>();
		List<CoupongroupDTO> groupList = new ArrayList<>();
		List<CoupongroupDTO> gList = new ArrayList<>();
		List<CouponDTO> cList = new ArrayList<>();
		int number = 1;
		int result = 0;

		try {
			groupList = coupongroupService.groupList();
			cList = couponService.couponList("","");
			if (group_num == -1) {
				if(sort == 10){
					memList = memberService.memberList("birth");
				}else if(sort==20){
					memList = memberService.memberList("type");
				}else{
					memList = memberService.memberList("");     
				}
			} else {
				gList = coupongroupService.groupSList(group_num);
				for (int num = 0; num < gList.size(); num++) {
					memberDTO = memberService.memberInfo(gList.get(num).getId());
					memList.add(memberDTO);
				}
			}
			for (MemberDTO memberDTO2 : memList) {
				result = myCouponService.couponCount(memberDTO2.getId());
				mv.addObject("result" + number, result);
				number++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		mv.addObject("cList", cList);
		mv.addObject("groupList", groupList);
		mv.addObject("memList", memList);
		mv.setViewName("admin/memberList");
		return mv;
	}

	@RequestMapping(value = "couponGive", method = RequestMethod.GET)
	public ModelAndView couponGive(@RequestParam(defaultValue="-1", required=false)int c_num, @RequestParam(value = "groupVal[]") List<String> gList,
			RedirectAttributes rd) {
		ModelAndView mv = new ModelAndView();
		CouponDTO couponDTO = null;
		int result = 0;
		try {
			couponDTO = couponService.couponInfo(c_num);
			for (int num = 0; num < gList.size(); num++) {
				result = myCouponService.couponInsert(gList.get(num), couponDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			rd.addAttribute("message", "쿠폰 주기 성공하였습니다.");
			mv.addObject("path", "./admin/memberList?group_num=-1&sort=-1");
			mv.setViewName("common/messagePath");
		} else {
			rd.addAttribute("message", "쿠폰 주기 실패하였습니다.");
			mv.addObject("path", "./admin/memberList?group_num=-1&sort=-1");
			mv.setViewName("common/messagePath");
		}
		return mv;
	}

	@RequestMapping(value = "pointGive", method = RequestMethod.GET)
	public ModelAndView pointGive(@RequestParam(defaultValue="-1", required=false)int price, @RequestParam(value = "groupVal[]") List<String> gList,
			RedirectAttributes rd, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		int result = 0;
		try {
			for (int num = 0; num < gList.size(); num++) {
				result = pointService.pointInsert(price, gList.get(num));
				result = memberService.pointUpdate(price, gList.get(num));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			rd.addAttribute("message", "포인트 주기 성공하였습니다.");
			mv.addObject("path", "./admin/memberList?group_num=-1&sort=-1");
			mv.setViewName("common/messagePath");
			MemberDTO memberDTO2 = (MemberDTO) session.getAttribute("member");
			memberDTO.setA_point(memberDTO2.getA_point());
			memberDTO.setA_point(memberDTO2.getV_point());
			session.setAttribute("member", memberDTO);
		} else {
			rd.addAttribute("message", "포인트 주기 실패하였습니다.");
			mv.addObject("path", "./admin/memberList?group_num=-1&sort=-1");
			mv.setViewName("common/messagePath");
		}
		return mv;
	}

	@RequestMapping(value = "groupInsert", method = RequestMethod.GET)
	public ModelAndView groupInsert(@RequestParam(value = "groupVal[]") List<String> gList) {
		ModelAndView mv = new ModelAndView();

		Random ran = new Random();
		int number = ran.nextInt(100000);

		for (int num = 0; num < gList.size(); num++) {
			try {
				coupongroupService.groupInsert(gList.get(num), number);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		mv.setViewName("redirect:../admin/memberList");
		return mv;
	}

	@RequestMapping(value = "groupList", method = RequestMethod.GET)
	public ModelAndView groupList() {
		ModelAndView mv = new ModelAndView();
		List<CoupongroupDTO> groupList = new ArrayList<>();
		List<Object> groupCountList = new ArrayList<>();
		List<CoupongroupDTO> groupCount = new ArrayList<>();
		try {
			groupList = coupongroupService.groupList();
			for (int num = 0; num < groupList.size(); num++) {
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

	@RequestMapping(value = "groupRemove", method = RequestMethod.GET)
	public ModelAndView groupRemove(@RequestParam(defaultValue="-1", required=false)int group_num, RedirectAttributes rd) {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		try {
			if(group_num!=-1){
				result = coupongroupService.groupRemove(group_num);
			}else{
				result = coupongroupService.groupRemove(-1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (result > 0) {
			rd.addAttribute("message", "그룹 삭제 성공하였습니다.");
			mv.addObject("path", "./admin/memberList?group_num=-1&sort=-1");
			mv.setViewName("common/messagePath");
		} else {
			rd.addAttribute("message", "그룹 삭제 실패하였습니다.");
			mv.addObject("path", "./admin/memberList?group_num=-1&sort=-1");
			mv.setViewName("common/messagePath");
		}
		return mv;
	}
}
