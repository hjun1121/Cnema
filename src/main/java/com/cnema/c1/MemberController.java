package com.cnema.c1;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnema.coupon.MyCouponService;
import com.cnema.member.MemberDTO;
import com.cnema.member.MemberService;
import com.cnema.movie.MovieDTO;
import com.cnema.movie.MovieService;
import com.cnema.reserve.Reserve2DTO;
import com.cnema.reserve.ReserveDTO;
import com.cnema.reserve.ReserveService;
import com.cnema.reserve.TicketPriceDTO;
import com.cnema.reserve.TicketPriceService;
import com.cnema.util.EmailDAO;


@Controller
@RequestMapping(value="/member/**")
public class MemberController {
	@Inject
	private MemberService memberService;
	@Inject
	private MovieService movieService;
	@Inject
	private MyCouponService myCouponService;
	@Inject
	private ReserveService reserveService;
	@Inject
	private TicketPriceService ticketPriceService;
	@Inject
	private EmailDAO emailDAO;
	/*kim*/
	
	@RequestMapping(value="idFind", method=RequestMethod.GET)
	public void idFind(){
		
	}
	
	@RequestMapping(value="pwFind", method=RequestMethod.GET)
	public void pwFind(){
		
	}
	@RequestMapping(value="pwFind", method=RequestMethod.POST)
	public ModelAndView pwFind(MemberDTO memberDTO, RedirectAttributes rd){
		ModelAndView mv = new ModelAndView();
		String result = null;

		result = emailDAO.sendPw(memberDTO);
		if(result!=null){
			memberDTO.setPw(result);
			memberService.pwUpdate(memberDTO);
			
			rd.addFlashAttribute("message", "임시비밀번호 발송");
		}else{
			rd.addFlashAttribute("message", "인증 오류");
		}
		mv.setViewName("redirect:../../member/memberLogin");

		
		return mv;
	}
	
	@RequestMapping(value="joinAgree", method=RequestMethod.GET)
	public void joinAgree(){
		
	}
	
	@RequestMapping(value="memberLogout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:../";
	}
	
	@RequestMapping(value="memberLogin", method=RequestMethod.GET)
	public void login(String path, Model model, ReserveDTO reserveDTO, Reserve2DTO reserve2DTO){
		InetAddress addr = null;
		try {
			addr = InetAddress.getLocalHost();
			String ip = addr.toString();
			ip = ip.substring(ip.lastIndexOf("/")+1);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("reserve2", reserve2DTO);
		model.addAttribute("reserve", reserveDTO);
		model.addAttribute("seat_num", reserveDTO.getSeat_num());
		model.addAttribute("path", path);
	}
	
	@RequestMapping(value="memberLogin", method=RequestMethod.POST)
	public ModelAndView login(@RequestParam(defaultValue="0", required=false)int num, String path,MemberDTO memberDTO, HttpSession session, RedirectAttributes rd, ReserveDTO reserveDTO, Reserve2DTO reserve2DTO){
		ModelAndView mv = new ModelAndView();
		MemberDTO member = null;
		try {
			member = memberService.login(memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(member != null){
			session.setAttribute("member", member);
			
			if(path !=null){
				if(path.equals("theater/quickReserve3")){
					mv.addObject("reserve", reserveDTO);
					mv.addObject("reserve2", reserve2DTO);
					mv.addObject("seat_num", reserveDTO.getSeat_num());
					mv.addObject("path", path);
					mv.setViewName("common/reserve");
				}else{
					rd.addFlashAttribute("num", num);
					mv.setViewName("redirect:../"+path);
				}
				
			}else{
				mv.setViewName("redirect:../");
			}
			
		}else{
			mv.setViewName("redirect:../member/memberLogin");
		}

		return mv;
	}

	@RequestMapping(value="memberJoin", method=RequestMethod.GET)
	public ModelAndView join(HttpSession session){
		ModelAndView mv = new ModelAndView();
		String agree = (String)session.getAttribute("agree");
		if(agree.equals("ok")){
			mv.setViewName("member/memberJoin");
		}else{
			mv.setViewName("member/joinAgree");
		}
		return mv;
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
	public ModelAndView selectOne(HttpSession session,RedirectAttributes rd){
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		List<MovieDTO> mList = new ArrayList<MovieDTO>();
		List<ReserveDTO> rList = new ArrayList<>();
		int count = 0;
		int aCount = 0;
		
		Calendar ca = Calendar.getInstance();
		SimpleDateFormat sd = new SimpleDateFormat("YYYY년 MM월 DD일");
		String today = sd.format(ca.getTime());
		
		
		TicketPriceDTO ticketPriceDTO = null;
		MovieDTO movieDTO = null;
		
		try {
			mList = movieService.movieAList();
			rList = reserveService.selectList(memberDTO.getId());
			for(ReserveDTO reserveDTO : rList){
				ticketPriceDTO = ticketPriceService.ticketPInfo(reserveDTO.getTp_num());
				reserveDTO.setTicketPriceDTO(ticketPriceDTO);
				movieDTO = movieService.movieInfo(reserveDTO.getMovie_num());
				reserveDTO.setMovieDTO(movieDTO);
				
			}
			count = myCouponService.couponCount(memberDTO.getId());
			aCount = myCouponService.couponACount(memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(memberDTO != null){
			mv.addObject("myInfo",memberDTO);
			mv.addObject("mList",mList);
			mv.addObject("rList",rList);
			mv.addObject("count", count);
			mv.addObject("aCount", aCount);
			mv.addObject("today", today);
			
			mv.setViewName("member/myPageView");
		}else{
			rd.addFlashAttribute("message","로그인이 필요합니다.");
			mv.setViewName("redirect:../");
		}
		return mv;
	}
}
