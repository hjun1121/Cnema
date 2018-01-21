package com.cnema.c1;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnema.coupon.MyCouponDTO;
import com.cnema.coupon.MyCouponService;
import com.cnema.member.MemberDTO;
import com.cnema.member.MemberService;
import com.cnema.member.PointService;
import com.cnema.movie.MovieDTO;
import com.cnema.movie.MovieService;
import com.cnema.reserve.Reserve2DTO;
import com.cnema.reserve.ReserveDTO;
import com.cnema.reserve.ReserveService;
import com.cnema.reserve.TicketPriceDTO;
import com.cnema.reserve.TicketPriceService;
import com.cnema.theater.DayDTO;
import com.cnema.theater.ScheduleDTO;
import com.cnema.theater.ScheduleService;
import com.cnema.theater.ScreenDTO;
import com.cnema.theater.TheaterDTO;
import com.cnema.theater.TheaterService;

@Controller
@RequestMapping(value="theater/**")
public class TheaterController {
	
	@Inject
	private TheaterService theaterService;
	@Inject
	private MovieService movieService;
	@Inject
	private ScheduleService scheduleService;
	@Inject
	private TicketPriceService ticketPriceService;
	@Inject
	private ReserveService reserveService;
	@Inject
	private MyCouponService myCouponService;
	@Inject
	private MemberService memberService;
	@Inject
	private PointService pointService;
	
	
	@RequestMapping(value="quickReservePay", method=RequestMethod.POST)
	public void quickReservePay(Model model,ReserveDTO reserveDTO, TicketPriceDTO ticketPriceDTO,HttpSession session){
		MovieDTO movieDTO= null;
		String movie =null;
		try {
			movieDTO = movieService.selectOne(reserveDTO.getMovie_num());
			movie = movieDTO.getMovie_name();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("reserve", reserveDTO);
		model.addAttribute("ticketPrice", ticketPriceDTO);
		model.addAttribute("movie", movie);
	}
	
	@RequestMapping(value="quickReserveGo", method=RequestMethod.POST)
	public ModelAndView quickReserveGo(RedirectAttributes rd, ReserveDTO reserveDTO, TicketPriceDTO ticketPriceDTO, HttpSession session){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		int tp_num=0;
		ScheduleDTO scheduleDTO =null; 
		try {
			tp_num = ticketPriceService.nextval();
			scheduleDTO = scheduleService.scheduleOne(reserveDTO.getSchedule_num());
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	
		reserveDTO.setScreen_num(scheduleDTO.getScreen_num());
		reserveDTO.setTp_num(tp_num);
		reserveDTO.setId(memberDTO.getId());

		
		//TicketPriceDTO ticketPriceDTO = new TicketPriceDTO();
		ticketPriceDTO.setTp_num(tp_num);
		ticketPriceDTO.setCode("asd");
		ticketPriceDTO.setId(memberDTO.getId());
		int result = 0;
		
		ModelAndView mv = new ModelAndView();
		try {
			result = ticketPriceService.tpInsert(ticketPriceDTO);
			
			for(int seat : reserveDTO.getSeat_num()){
				reserveDTO.setSeat(seat);
				reserveService.reserveInsert(reserveDTO);
				
			}
			double getPoint = 0;
			int price = ticketPriceDTO.getPrice();
			if(price>=10){
				getPoint = price*0.1;
			}else{
				getPoint = 0;
			}
			memberService.qrPointUpdate(ticketPriceDTO.getPoint(), (int)getPoint, memberDTO.getId());
			myCouponService.qrCouponUpdate(ticketPriceDTO.getC_num(), memberDTO.getId());
			
			if(ticketPriceDTO.getPoint()>0){
				pointService.usePoint(memberDTO.getId(),"영화 구매 사용",ticketPriceDTO.getPoint());
			}
			if(getPoint>0){
				pointService.getPoint(memberDTO.getId(),"영화 구매 적립", (int)getPoint);
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String message="예매 실패";
		if(result>0){
			message="예매 성공";
		}
		mv.addObject("message", message);
		mv.setViewName("common/result");
		return mv;
	}
	
	@RequestMapping(value="quickReserve3", method=RequestMethod.POST)
	public void quickReserve3(Model model, ReserveDTO reserveDTO, Reserve2DTO reserve2DTO, HttpSession session){
		MovieDTO movieDTO = null;
		TheaterDTO theaterDTO = null;
		ScheduleDTO scheduleDTO = null;
		ScreenDTO screenDTO = null;
		MemberDTO memberDTO = null;
		List<MyCouponDTO> couponList = null;
		try {
			memberDTO = (MemberDTO)session.getAttribute("member");
			movieDTO = movieService.selectOne(reserveDTO.getMovie_num());
			theaterDTO = theaterService.selectOne(reserveDTO.getTheater_num());
			scheduleDTO = scheduleService.scheduleOne(reserveDTO.getSchedule_num());
			screenDTO = scheduleService.screenOne(scheduleDTO.getScreen_num());		
			couponList = myCouponService.myCouponList(memberDTO.getId(), "11");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("screenDTO", screenDTO);
		model.addAttribute("day", reserveDTO.getDay_num());
		model.addAttribute("theater", theaterDTO);
		model.addAttribute("movie", movieDTO);
		model.addAttribute("reserve", reserveDTO);
		model.addAttribute("seat_num", reserveDTO.getSeat_num());
		model.addAttribute("reserve2", reserve2DTO);
		model.addAttribute("coupon", couponList);
	}
	
	@RequestMapping(value="quickReserve2", method=RequestMethod.POST)
	public void quickReserve2(Model model, ReserveDTO reserveDTO){
		MovieDTO movieDTO = null;
		TheaterDTO theaterDTO = null;
		ScheduleDTO scheduleDTO = null;
		ScreenDTO screenDTO = null;
		List<Integer> seatCheck =null;
		
		try {
			movieDTO = movieService.selectOne(reserveDTO.getMovie_num());
			theaterDTO = theaterService.selectOne(reserveDTO.getTheater_num());
			scheduleDTO = scheduleService.scheduleOne(reserveDTO.getSchedule_num());
			screenDTO = scheduleService.screenOne(scheduleDTO.getScreen_num());		
			seatCheck = reserveService.seatCheck(scheduleDTO.getScreen_num(), reserveDTO.getSchedule_num());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("screenDTO", screenDTO);
		model.addAttribute("day", reserveDTO.getDay_num());
		model.addAttribute("theater", theaterDTO);
		model.addAttribute("movie", movieDTO);
		model.addAttribute("reserve", reserveDTO);
		model.addAttribute("seatCheck", seatCheck);
	}
	
	@RequestMapping(value="quickReserve", method=RequestMethod.GET)
	public void quickReserve(Model model, String areaName, @RequestParam(defaultValue="0", required=false)int movie_num, @RequestParam(defaultValue="0", required=false)int theater_num, String day_num, @RequestParam(defaultValue="0", required=false)int schedule_num){
		if(areaName == null){
			areaName="서울";
		}
		List<TheaterDTO> areaList = null;
		List<MovieDTO> movieList = null;
		List<TheaterDTO> theaterList = null;
		List<DayDTO> dayList = null;
		try {
			areaList = theaterService.qrAreaList();
			movieList = movieService.qrMovieList();
			theaterList = theaterService.locationList(areaName);
			dayList = theaterService.dayList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("areaName", areaName);
		model.addAttribute("movie_num", movie_num);
		model.addAttribute("theater_num", theater_num);
		model.addAttribute("day_num", day_num);
		model.addAttribute("schedule_num", schedule_num);
		
		model.addAttribute("areaList", areaList);
		model.addAttribute("location", theaterList);
		model.addAttribute("movie", movieList);
		model.addAttribute("dayList", dayList);
	}
	
	
	//SL 시작
	@RequestMapping(value="scheduleList", method=RequestMethod.GET)
	public void scheduleList(Model model, String areaName, @RequestParam(defaultValue="1", required=false)int theater_num, String day){
		List<DayDTO> dayList = null;
		List<TheaterDTO> areaList = null;
		List<TheaterDTO> locationList = null;
		List<MovieDTO> movieList = new ArrayList<>();
		if(areaName==null){
			areaName="서울";
		}
		try {
			dayList = theaterService.dayList();
			areaList = theaterService.areaList();
			locationList = theaterService.locationList(areaName);
			
			if(day==null){
				day = dayList.get(0).getDay_num().toString();
			}
			//그날있는 영화 번호들
			List<Integer> movieNumList = scheduleService.movieNumList(theater_num, day);
			for(Integer i : movieNumList){
				MovieDTO movieDTO = movieService.selectOne(i);
				List<Integer> screenNumList = scheduleService.screenNumList(theater_num, day, i);
				//System.out.println(screenNumList.size()); //screenNum 모음
				
				List<List<ScheduleDTO>> sll = new ArrayList<>();
				for(Integer s : screenNumList){
					//영화관에 그 날에 그 영화에 그 관 스케줄 들
					List<ScheduleDTO> sl = scheduleService.movieSchedule(theater_num, day, i, s);
					for(ScheduleDTO scheduleDTO : sl){
						//System.out.println(scheduleDTO.getIn_time());
					}
					sll.add(sl);
					movieDTO.setsList(sll);
					//System.out.println("=========");
				}
				
				//System.out.println("@@");
				//그 영화의 스케쥴
				
				movieList.add(movieDTO);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("areaList", areaList);
		model.addAttribute("areaName", areaName);
		model.addAttribute("theater_num", theater_num);
		model.addAttribute("locationList", locationList);
		model.addAttribute("dayList", dayList);
		model.addAttribute("movieList", movieList);

	}
}
