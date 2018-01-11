package com.cnema.c1;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnema.member.MemberDTO;
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
	
	@RequestMapping(value="quickReserveGo", method=RequestMethod.GET)
	public ModelAndView quickReserveGo(RedirectAttributes rd, ReserveDTO reserveDTO, Reserve2DTO reserve2DTO, HttpSession session){
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

		
		TicketPriceDTO ticketPriceDTO = new TicketPriceDTO();
		ticketPriceDTO.setTp_num(tp_num);
		ticketPriceDTO.setPeople(reserve2DTO.getpCount());
		ticketPriceDTO.setAdult_num(reserve2DTO.getAdult_num());
		ticketPriceDTO.setTeen_num(reserve2DTO.getTeen_num());
		ticketPriceDTO.setTotal_price(reserve2DTO.getPrice());
		ticketPriceDTO.setC_num(1);
		ticketPriceDTO.setPrice(reserve2DTO.getPrice());
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
	
	@RequestMapping(value="quickReserve3", method=RequestMethod.GET)
	public void quickReserve3(Model model, ReserveDTO reserveDTO, Reserve2DTO reserve2DTO){
		MovieDTO movieDTO = null;
		TheaterDTO theaterDTO = null;
		ScheduleDTO scheduleDTO = null;
		ScreenDTO screenDTO = null;
		try {
			movieDTO = movieService.selectOne(reserveDTO.getMovie_num());
			theaterDTO = theaterService.selectOne(reserveDTO.getTheater_num());
			scheduleDTO = scheduleService.scheduleOne(reserveDTO.getSchedule_num());
			screenDTO = scheduleService.screenOne(scheduleDTO.getScreen_num());			
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
	}
	
	@RequestMapping(value="quickReserve2", method=RequestMethod.GET)
	public void quickReserve2(Model model, ReserveDTO reserveDTO){
		MovieDTO movieDTO = null;
		TheaterDTO theaterDTO = null;
		ScheduleDTO scheduleDTO = null;
		ScreenDTO screenDTO = null;
		try {
			movieDTO = movieService.selectOne(reserveDTO.getMovie_num());
			theaterDTO = theaterService.selectOne(reserveDTO.getTheater_num());
			scheduleDTO = scheduleService.scheduleOne(reserveDTO.getSchedule_num());
			screenDTO = scheduleService.screenOne(scheduleDTO.getScreen_num());			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("screenDTO", screenDTO);
		model.addAttribute("day", reserveDTO.getDay_num());
		model.addAttribute("theater", theaterDTO);
		model.addAttribute("movie", movieDTO);
		model.addAttribute("reserve", reserveDTO);
		
	}
	
	@RequestMapping(value="quickReserve", method=RequestMethod.GET)
	public void quickReserve(Model model, String area, String kind){
		
		if(area == null){
			area="서울";
		}
		
		List<MovieDTO> movieList = null;
		List<TheaterDTO> theaterList = null;
		List<DayDTO> dayList = null;
		try {
			movieList = movieService.movieList(kind);
			theaterList = theaterService.locationList(area);
			dayList = theaterService.dayList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("location", theaterList);
		model.addAttribute("movie", movieList);
		model.addAttribute("dayList", dayList);
	}
	
	@RequestMapping(value="scheduleList")
	public void scheduleList(){
		
	}
}
