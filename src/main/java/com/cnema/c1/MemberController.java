package com.cnema.c1;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.sun.java.swing.plaf.motif.resources.motif;

@Controller
@RequestMapping(value="/member/**")
public class MemberController {
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
	@Inject
	private WishService wishService;
	@Inject
	private PointService pointService;
	@Inject
	private MyCouponService myCouponService;
	
	/*kim*/
	@RequestMapping(value="idFind", method=RequestMethod.GET)
	public void idFind(){
		
	}
	
	@RequestMapping(value="pwFind", method=RequestMethod.GET)
	public void pwFind(){
		
	}
	
	@RequestMapping(value="memberLogout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:../";
	}
	
	@RequestMapping(value="memberLogin", method=RequestMethod.GET)
	public void login(){
		InetAddress addr = null;
		try {
			addr = InetAddress.getLocalHost();
			String ip = addr.toString();
			ip = ip.substring(ip.lastIndexOf("/")+1);
			
			System.out.println(ip);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="memberLogin", method=RequestMethod.POST)
	public ModelAndView login(MemberDTO memberDTO, HttpSession session, RedirectAttributes rd, ModelAndView mv){
		MemberDTO member = null;
		try {
			member = memberService.login(memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		if(member != null){
			session.setAttribute("member", member);
			mv.setViewName("redirect:../");
		}else{
			mv.setViewName("redirect:../member/memberLogin");
		}

		return mv;
	}

	@RequestMapping(value="memberJoin", method=RequestMethod.GET)
	public void join(){
	}

	@RequestMapping(value="memberJoin", method=RequestMethod.POST)
	public ModelAndView join(MemberDTO memberDTO, HttpSession session, RedirectAttributes rd){
		int result = 0;
		try {
			result = memberService.join(memberDTO, session);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView();
		if(result>0){
			rd.addFlashAttribute("message", "회원가입 성공");
			mv.setViewName("redirect:../");
		}else{
			rd.addFlashAttribute("message", "회원가입 실패");
			mv.setViewName("redirect:../");
		}
		return mv;
	}
	
	/*heeseong*/
	@RequestMapping(value="myPageView", method=RequestMethod.GET)
	public ModelAndView selectOne(String id,RedirectAttributes rd){
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = null;
		ScheduleDTO scheduleDTO = null;
		TicketPriceDTO ticketPriceDTO = null;
		MovieDTO movieDTO = null;
		
		List<ReserveDTO> rList = new ArrayList<ReserveDTO>();
		List<ScheduleDTO> schList = new ArrayList<ScheduleDTO>();
		List<TicketPriceDTO> tpList = new ArrayList<TicketPriceDTO>();
		List<MovieDTO> mrList = new ArrayList<MovieDTO>();
		List<WishDTO> wList = new ArrayList<WishDTO>();
		List<MovieDTO> mwList = new ArrayList<MovieDTO>();
		List<PointDTO> pList = new ArrayList<PointDTO>();
		List<MovieDTO> mList = new ArrayList<MovieDTO>();
		List<MemberDTO> memList = new ArrayList<MemberDTO>();
		List<MyCouponDTO> mcList = new ArrayList<MyCouponDTO>();
		try {
			memberDTO = memberService.memberInfo(id);
			rList = reserveService.reserveList(id);
			pList = pointService.pointList(id);
			mList = movieService.movieAList();
			memList = memberService.memberList();
			mcList = myCouponService.myCouponList(id);
			for(int size=0;size<rList.size();size++){
				scheduleDTO = scheduleService.scheduleInfo(rList.get(size).getSchedule_num());
				ticketPriceDTO = ticketPriceService.ticketPInfo(rList.get(size).getTp_num());
				movieDTO = movieService.movieInfo(rList.get(size).getMovie_num());
				schList.add(scheduleDTO);
				tpList.add(ticketPriceDTO);
				mrList.add(movieDTO);
			}
			wList = wishService.wishList(id);
			for(int size=0;size<wList.size();size++){
				movieDTO = movieService.movieInfo(wList.get(size).getMovie_num());
				mwList.add(movieDTO);
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
			mv.addObject("mwList", mwList);
			mv.addObject("pList",pList);
			mv.addObject("mList",mList);
			mv.addObject("memList",memList);
			mv.addObject("mcList",mcList);
			
			mv.setViewName("member/myPageView");
		}else{
			rd.addFlashAttribute("message","로그인이 필요합니다.");
			mv.setViewName("redirect:../");
		}
		return mv;
	}
}
