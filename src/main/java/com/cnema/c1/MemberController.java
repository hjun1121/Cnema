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

import com.cnema.member.MemberDTO;
import com.cnema.member.MemberService;
import com.cnema.reserve.ReserveDTO;
import com.cnema.reserve.ReserveService;
import com.cnema.reserve.TicketPriceDTO;
import com.cnema.reserve.TicketPriceService;
import com.cnema.theater.ScheduleDTO;
import com.cnema.theater.ScheduleService;

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
		
		List<ReserveDTO> rList = new ArrayList<ReserveDTO>();
		List<ScheduleDTO> schList = new ArrayList<ScheduleDTO>();
		List<TicketPriceDTO> tpList = new ArrayList<TicketPriceDTO>();
		try {
			memberDTO = memberService.memberInfo(id);
			rList = reserveService.reserveList(id);
			for(int size=0;size<rList.size();size++){
				scheduleDTO = scheduleService.scheduleInfo(rList.get(size).getSchedule_num());
				ticketPriceDTO = ticketPriceService.ticketPInfo(rList.get(size).getTp_num());
				System.out.println("people"+ticketPriceDTO.getPeople());
				schList.add(scheduleDTO);
				tpList.add(ticketPriceDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(memberDTO != null){
			mv.addObject("myInfo",memberDTO);
			
			List<Object> list = new ArrayList<>();
			list.add(rList);
			list.add(schList);
			list.add(tpList);
			
			mv.addObject("allList", list);
			
			mv.setViewName("member/myPageView");
		}else{
			rd.addFlashAttribute("message","로그인이 필요합니다.");
			mv.setViewName("redirect:../");
		}
		return mv;
	}
}
