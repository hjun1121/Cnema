package com.cnema.c1;

/*heeseong 코드*/
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnema.coupon.MyCouponDTO;
import com.cnema.coupon.MyCouponService;
import com.cnema.member.MemberDTO;
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
@RequestMapping(value="/myPage/**")
public class MyPageController {
	@Inject
	private ReserveService reserveService;
	@Inject
	private ScheduleService scheduleService;
	@Inject
	private TicketPriceService ticketPriceService;
	@Inject
	private MovieService movieService;
	@Inject
	private WishService wishService;
	@Inject
	private PointService pointService;
	@Inject
	private MyCouponService myCouponService;
	
	@RequestMapping(value="movieHistory",method=RequestMethod.GET)
	public ModelAndView movieHistory(HttpSession session, RedirectAttributes rd,String kind){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		/*if(kind == null) {
			kind = "2018";
		}*/
		ModelAndView mv = new ModelAndView();
		ScheduleDTO scheduleDTO = null;
		TicketPriceDTO ticketPriceDTO = null;
		MovieDTO movieDTO = null;
		
		List<ReserveDTO> rList = new ArrayList<ReserveDTO>();
		List<ScheduleDTO> schList = new ArrayList<ScheduleDTO>();
		List<TicketPriceDTO> tpList = new ArrayList<TicketPriceDTO>();
		List<MovieDTO> mrList = new ArrayList<MovieDTO>();
		try {
			/*rList = reserveService.reserveList(id,kind);*/
			rList = reserveService.reserveList(memberDTO.getId());
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
		
		List<Object> reserveList = new ArrayList<Object>();
		reserveList.add(rList);
		reserveList.add(schList);
		reserveList.add(tpList);
		reserveList.add(mrList);
		
		mv.addObject("allList", reserveList);
		mv.setViewName("myPage/movieHistory");
		return mv;
	}
	
	@RequestMapping(value="movieHistory",method=RequestMethod.POST)
	public ModelAndView movieHistory(int reserve_num, RedirectAttributes rd){
		int result = 0;
		try {
			result = reserveService.reserveDel(reserve_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ModelAndView mv = new ModelAndView();
		if(result>0){
			rd.addFlashAttribute("message", "예매 내역 삭제 성공");
			mv.setViewName("redirect:../");
		}else{
			rd.addFlashAttribute("message", "예매 내역 삭제 실패");
			mv.setViewName("redirect:../");
		}
		return mv;
	}
	
	@RequestMapping(value="wishList",method=RequestMethod.GET)
	public ModelAndView wishList(HttpSession session,RedirectAttributes rd){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		MovieDTO movieDTO = null;
		List<WishDTO> wList = new ArrayList<WishDTO>();
		List<MovieDTO> mwList = new ArrayList<MovieDTO>();
		try {
			wList = wishService.wishList(memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		for(int size=0;size<wList.size();size++){
			try {
				movieDTO = movieService.movieInfo(wList.get(size).getMovie_num());
				mwList.add(movieDTO);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		mv.addObject("mwList", mwList);
		mv.setViewName("myPage/wishList");
		return mv;
	}
	
	@RequestMapping(value="pointHistory", method=RequestMethod.GET)
	public ModelAndView pointHistory(HttpSession session){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		List<PointDTO> pList = new ArrayList<PointDTO>();
		try {
			pList = pointService.pointList(memberDTO.getId(),"2017-12-05","2018-01-05");
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("pList",pList);
		mv.setViewName("myPage/pointHistory");
		return mv;
	}
	
	@RequestMapping(value="pointHistory", method=RequestMethod.POST)
	public ModelAndView pointHistory(HttpSession session, String testDatepicker1, String testDatepicker2){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		List<PointDTO> pList = new ArrayList<PointDTO>();
		try {
			pList = pointService.pointList(memberDTO.getId(), testDatepicker1,testDatepicker2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("pList",pList);
		mv.setViewName("myPage/pointHistory");
		return mv;
	}
	
	@RequestMapping(value="couponHistory", method=RequestMethod.GET)
	public ModelAndView couponHistory(HttpSession session){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		List<MyCouponDTO> mcList = new ArrayList<MyCouponDTO>();
		try {
			mcList = myCouponService.myCouponAList(memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("mcList",mcList);
		
		mv.setViewName("myPage/couponHistory");
		return mv;
	}
	@RequestMapping(value="couponHistory", method=RequestMethod.POST)
	public ModelAndView couponHistory(HttpSession session,String type){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		List<MyCouponDTO> mcList = new ArrayList<MyCouponDTO>();
		try {
			mcList = myCouponService.myCouponList(memberDTO.getId(),type);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("mcList",mcList);
		
		mv.setViewName("myPage/couponHistory");
		return mv;
	}
	
	@RequestMapping(value="withdrawal", method=RequestMethod.GET)
	public ModelAndView widhdrawal(HttpSession session){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
	
		mv.addObject("member",memberDTO);
		
		mv.setViewName("myPage/withdrawal");
		return mv;
	}
	
	@RequestMapping(value="widhdrawal", method=RequestMethod.POST)
	public ModelAndView widhdrawal(HttpSession session,String pwd){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		System.out.println(pwd);
		mv.addObject("memberDTO",memberDTO);
		
		mv.setViewName("myPage/widhdrawal");
		return mv;
	}
	
}
