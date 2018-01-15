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
import com.cnema.member.MemberService;
import com.cnema.member.PointDTO;
import com.cnema.member.PointService;
import com.cnema.movie.MovieDTO;
import com.cnema.movie.MovieService;
import com.cnema.movie.ReviewService;
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
	@Inject
	private MemberService memberService;
	@Inject
	private ReviewService reviewService;
	
	@RequestMapping(value="myInfoCheck",method=RequestMethod.GET)
	public ModelAndView myInfoCheck(HttpSession session){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		mv.addObject("id",memberDTO.getId());
		mv.setViewName("myPage/myInfoCheck");
		return mv;
	}
	
	@RequestMapping(value="myInfoCheck",method=RequestMethod.POST)
	public ModelAndView myInfoCheck(HttpSession session,String pwd,RedirectAttributes rd){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String phone = memberDTO.getPhone();
		String[] p = phone.split("-");
		
		String email = memberDTO.getEmail();
		String[] e = email.split("@");
		
		ModelAndView mv = new ModelAndView();
		if(memberDTO.getPw().equals(pwd)){
			mv.addObject("p", p);
			mv.addObject("e", e);
			mv.addObject("memberDTO", memberDTO);
			mv.setViewName("myPage/myInfo");
		}else{
			rd.addFlashAttribute("message", "비밀번호 실패!");
			mv.setViewName("redirect:../");
		}
		return mv;
	}
	
	@RequestMapping(value="myInfoRevision",method=RequestMethod.POST)
	public ModelAndView myInfoRevision(MemberDTO memberDTO,RedirectAttributes rd){
		ModelAndView mv = new ModelAndView();
		int result = 0;
		try {
			result = memberService.myInfoRevision(memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result>0){
			rd.addAttribute("message", "수정 성공");
			mv.setViewName("redirect:../");
		}else{
			rd.addAttribute("message", "수정 실패");
			mv.setViewName("redirect:../");
		}
		return mv;
	}
	
	@RequestMapping(value="movieHistory",method=RequestMethod.GET)
	public ModelAndView movieHistory(HttpSession session, RedirectAttributes rd,String kind){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		ScheduleDTO scheduleDTO = null;
		TicketPriceDTO ticketPriceDTO = null;
		MovieDTO movieDTO = null;
		List<ReserveDTO> rList = new ArrayList<ReserveDTO>();
		try {
			if(kind==null){
				rList = reserveService.reserveAList(memberDTO.getId());
			}else{
				rList = reserveService.reserveList(memberDTO.getId(),kind);
			}
			for(ReserveDTO reserveDTO : rList){
				scheduleDTO = scheduleService.scheduleInfo(reserveDTO.getSchedule_num());
				reserveDTO.setScheduleDTO(scheduleDTO);
				
				ticketPriceDTO = ticketPriceService.ticketPInfo(reserveDTO.getTp_num());
				reserveDTO.setTicketPriceDTO(ticketPriceDTO);
				
				movieDTO = movieService.movieInfo(reserveDTO.getMovie_num());
				reserveDTO.setMovieDTO(movieDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("kind",kind);
		mv.addObject("rList",rList);
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
	
	@RequestMapping(value="movieReview",method=RequestMethod.GET)
	public ModelAndView movieReview(int movie_num){
		ModelAndView mv = new ModelAndView();
		MovieDTO movieDTO = null;
		
		try {
			movieDTO = movieService.movieInfo(movie_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("movieDTO", movieDTO);
		mv.setViewName("myPage/movieReview");
		
		return mv;
	}
	@RequestMapping(value="movieReview",method=RequestMethod.POST)
	public ModelAndView movieReview(int movie_num,String review,RedirectAttributes rd,HttpSession session){
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		int result = 0;
		result = reviewService.reviewInsert(movie_num,memberDTO.getId(),review);
		
		if(result>0){
			rd.addAttribute("message", "리뷰 작성 성공");
			mv.setViewName("redirect:../common/resultClose");
		}else{
			rd.addAttribute("message", "리뷰 작성 실패");
			mv.setViewName("redirect:../common/resultClose");
		}
		
		return mv;
	}
	
	@RequestMapping(value="wishList",method=RequestMethod.GET)
	public ModelAndView wishList(String kind, HttpSession session,RedirectAttributes rd){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		MovieDTO movieDTO = null;
		List<WishDTO> wList = new ArrayList<WishDTO>();
		try {
			wList = wishService.wishList(memberDTO.getId());
			for(WishDTO wishDTO : wList ){
				movieDTO = movieService.movieInfo(wishDTO.getMovie_num());
				wishDTO.setMovieDTO(movieDTO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		if(kind == null){
			kind= "regist_date";
		}
		mv.addObject("kind", kind);
		mv.addObject("wList", wList);
		mv.setViewName("myPage/wishList");
		return mv;
	}
	@RequestMapping(value="wishList",method=RequestMethod.POST)
	public ModelAndView wishList(int wish_num,String sKind,RedirectAttributes rd){
		int result = 0;
		try {
			result = wishService.wishListDelete(wish_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ModelAndView mv = new ModelAndView();
		if(result>0){
			rd.addFlashAttribute("message", "위시리스트 삭제 성공");
			mv.setViewName("redirect:../");
		}else{
			rd.addFlashAttribute("message", "위시리스트 삭제 실패");
			mv.setViewName("redirect:../");
		}
		return mv;
	}
	
	@RequestMapping(value="pointHistory", method=RequestMethod.GET)
	public ModelAndView pointHistory(HttpSession session, String testDatepicker1, String testDatepicker2){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		List<PointDTO> pList = new ArrayList<PointDTO>();
		try {
			if(testDatepicker1==null && testDatepicker2==null){
				pList = pointService.pointAList(memberDTO.getId());
			}else{
				pList = pointService.pointList(memberDTO.getId(), testDatepicker1,testDatepicker2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("pList",pList);
		mv.addObject("testDatepicker1", testDatepicker1);
		mv.addObject("testDatepicker2", testDatepicker2);
		mv.setViewName("myPage/pointHistory");
		return mv;
	}
	
	@RequestMapping(value="couponHistory", method=RequestMethod.GET)
	public ModelAndView couponHistory(HttpSession session,String type,String testDatepicker1, String testDatepicker2){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		List<MyCouponDTO> mcList = new ArrayList<MyCouponDTO>();
		if(type==null){
			type="11";
		}
		try {
			myCouponService.dateUpdate(memberDTO.getId());
			mcList = myCouponService.myCouponList(memberDTO.getId(),type);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("type", type);
		mv.addObject("mcList",mcList);
		
		List<MyCouponDTO> cdList = new ArrayList<MyCouponDTO>();
		try {
			if(testDatepicker1==null&&testDatepicker2==null){
				cdList = myCouponService.myCouponAList(memberDTO.getId());
			}else{
				cdList = myCouponService.myCouponDList(memberDTO.getId(),testDatepicker1,testDatepicker2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("testDatepicker1", testDatepicker1);
		mv.addObject("testDatepicker2", testDatepicker2);
		mv.addObject("cdList",cdList);
		
		mv.setViewName("myPage/couponHistory");
		return mv;
	}
	
	@RequestMapping(value="withdrawalCheck", method=RequestMethod.GET)
	public ModelAndView withdrawalCheck(HttpSession session){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
	
		mv.addObject("member",memberDTO);
		
		mv.setViewName("myPage/withdrawalCheck");
		return mv;
	}
	
	@RequestMapping(value="withdrawalCheck", method=RequestMethod.POST)
	public ModelAndView withdrawalCheck(HttpSession session,String pwd){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		mv.addObject("memberDTO",memberDTO);
		
		mv.setViewName("myPage/withdrawal");
		return mv;
	}
	
	@RequestMapping(value="withdrawal", method=RequestMethod.POST)
	public ModelAndView widhdrawal(String id,RedirectAttributes rd, HttpSession session){
		int result = 0;
		try {
			result = memberService.withdrawal(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView();
		
		if(result>0){
			session.invalidate();
			rd.addFlashAttribute("message", "회원 탈퇴 성공");
			mv.setViewName("redirect:../");
		}else{
			rd.addFlashAttribute("message", "회원 탈퇴 실패");
			mv.setViewName("redirect:../");
		}
		return mv;
	}
}
