package com.cnema.c1;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnema.coupon.MyCouponDTO;
import com.cnema.coupon.MyCouponService;
import com.cnema.member.MemberDTO;
import com.cnema.member.MemberService;
import com.cnema.member.PointDTO;
import com.cnema.member.PointService;
import com.cnema.movie.MovieDTO;
import com.cnema.movie.MovieService;
import com.cnema.movie.WishDTO;
import com.cnema.movie.WishService;
import com.cnema.reserve.ReserveDTO;
import com.cnema.reserve.ReserveService;
import com.cnema.reserve.TicketPriceDTO;
import com.cnema.reserve.TicketPriceService;
import com.cnema.theater.ScheduleDTO;
import com.cnema.theater.ScheduleService;

@Controller
@RequestMapping(value="myPage/**")
public class MyPageController {
	@Inject
	private MemberService memberService;
	@Inject
	private ReserveService reserveService;
	@Inject
	private ScheduleService scheduleService;
	@Inject
	private TicketPriceService ticketPriceService;
	@Inject
	private MovieService movieService;
	
	@RequestMapping(value="movieHistory",method=RequestMethod.GET)
	public ModelAndView movieHistory(String id, RedirectAttributes rd){
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = null;
		ScheduleDTO scheduleDTO = null;
		TicketPriceDTO ticketPriceDTO = null;
		MovieDTO movieDTO = null;
		
		List<ReserveDTO> rList = new ArrayList<ReserveDTO>();
		List<ScheduleDTO> schList = new ArrayList<ScheduleDTO>();
		List<TicketPriceDTO> tpList = new ArrayList<TicketPriceDTO>();
		List<MovieDTO> mrList = new ArrayList<MovieDTO>();
		try {
			memberDTO = memberService.memberInfo(id);
			rList = reserveService.reserveList(id);
			for(int size=0;size<rList.size();size++){
				scheduleDTO = scheduleService.scheduleInfo(rList.get(size).getSchedule_num());
				ticketPriceDTO = ticketPriceService.ticketPInfo(rList.get(size).getTp_num());
				movieDTO = movieService.movieInfo(rList.get(size).getMovie_num());
				schList.add(scheduleDTO);
				tpList.add(ticketPriceDTO);
				mrList.add(movieDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(int num = 0;num<rList.size();num++){
			try {
				scheduleDTO = scheduleService.scheduleInfo(rList.get(num).getSchedule_num());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(memberDTO != null){
			mv.addObject("myInfo",memberDTO);
			List<Object> reserveList = new ArrayList<>();
			reserveList.add(rList);
			reserveList.add(schList);
			reserveList.add(tpList);
			reserveList.add(mrList);
			mv.addObject("allList", reserveList);
			
			mv.setViewName("myPage/movieHistory");
		}else{
			rd.addFlashAttribute("message","로그인이 필요합니다.");
			mv.setViewName("redirect:../");
		}
		return mv;
	}
	
}
