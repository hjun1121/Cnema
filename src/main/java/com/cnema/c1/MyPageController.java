package com.cnema.c1;

import java.text.SimpleDateFormat;
/*heeseong 코드*/
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnema.coupon.CoupongroupService;
import com.cnema.coupon.MyCouponDTO;
import com.cnema.coupon.MyCouponService;
import com.cnema.member.MemberDTO;
import com.cnema.member.MemberService;
import com.cnema.member.PointDTO;
import com.cnema.member.PointService;
import com.cnema.movie.MovieDTO;
import com.cnema.movie.MovieService;
import com.cnema.movie.ReviewDTO;
import com.cnema.movie.ReviewService;
import com.cnema.movie.WishDTO;
import com.cnema.movie.WishService;
import com.cnema.reserve.ReserveDTO;
import com.cnema.reserve.ReserveService;
import com.cnema.reserve.TicketPriceDTO;
import com.cnema.reserve.TicketPriceService;
import com.cnema.theater.ScheduleDTO;
import com.cnema.theater.ScheduleService;
import com.cnema.theater.ScreenDTO;
import com.cnema.theater.TheaterDTO;
import com.cnema.theater.TheaterService;
import com.cnema.util.ListData;

@Controller
@RequestMapping(value="/myPage/**")
public class MyPageController {
	@Inject
	private ReserveService reserveService;
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
	@Inject
	private CoupongroupService coupongroupService;
	
	private int count = 0;
	private int aCount = 0;
	private Calendar ca = Calendar.getInstance();
	private SimpleDateFormat sd = new SimpleDateFormat("YYYY년 MM월 DD일");
	private String today = sd.format(ca.getTime());
	
	@RequestMapping(value="myInfoCheck",method=RequestMethod.GET)
	public ModelAndView myInfoCheck(HttpSession session){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		try {
			count = myCouponService.couponCount(memberDTO.getId());
			aCount = myCouponService.couponACount(memberDTO.getId());
			mv.addObject("id",memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("count", count);
		mv.addObject("aCount", aCount);
		mv.addObject("today", today);
		mv.addObject("myInfo", memberDTO);
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
			try {
				count = myCouponService.couponCount(memberDTO.getId());
				aCount = myCouponService.couponACount(memberDTO.getId());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			mv.addObject("count", count);
			mv.addObject("aCount", aCount);
			mv.addObject("today", today);
			mv.addObject("p", p);
			mv.addObject("e", e);
			mv.addObject("myInfo", memberDTO);
			mv.setViewName("myPage/myInfo");
		}else{
			mv.addObject("message", "비밀번호가 다릅니다.");
			mv.addObject("path", "./myPage/myInfoCheck");
			mv.setViewName("common/messagePath");
		}
		return mv;
	}
	
	@RequestMapping(value="myInfoRevision",method=RequestMethod.POST)
	public ModelAndView myInfoRevision(HttpSession session,MemberDTO memberDTO,RedirectAttributes rd){
		ModelAndView mv = new ModelAndView();
		int result = 0;
		
		try {
			result = memberService.myInfoRevision(memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(result>0){
			mv.addObject("message", "회원정보 수정 완료하였습니다.");
			mv.addObject("path", "./myPage/myInfoCheck");
			mv.setViewName("common/messagePath");
			MemberDTO memberDTO2 = (MemberDTO)session.getAttribute("member");
			memberDTO2.setPw(memberDTO.getPw());
			memberDTO2.setPhone(memberDTO.getPhone());
			memberDTO2.setPostCode(memberDTO.getPostCode());
			memberDTO2.setAddr1(memberDTO.getAddr1());
			memberDTO2.setAddr2(memberDTO.getAddr2());
			memberDTO2.setEmail(memberDTO.getEmail());
			
			session.setAttribute("member", memberDTO2);
		}else{
			mv.addObject("message", "회원 정보 수정 실패하였습니다.");
			mv.addObject("path", "./myPage/myInfoCheck");
			mv.setViewName("common/messagePath");
		}
		return mv;
	}
	
	@RequestMapping(value="movieHistory",method=RequestMethod.GET)
	public ModelAndView movieHistory(HttpSession session, RedirectAttributes rd,String kind,ListData listData, @RequestParam(defaultValue="1", required=false)int curPage){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		if(kind==null){ kind="no"; }
		
		List<WishDTO> wList = new ArrayList<>();
		int reserveLeftbar = 0;
		int wishLeftbar = 0;
		try {
			mv = reserveService.reserveList(memberDTO.getId(), kind, listData);
			reserveLeftbar = reserveService.reserveLeftbar(memberDTO.getId());
			wishLeftbar = wishService.wishLeftbar(memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("curPage", curPage);
		mv.addObject("page", listData);
		mv.addObject("kind",kind);
		mv.addObject("wList",wList);
		mv.addObject("reserveLeftbar", reserveLeftbar);
		mv.addObject("wishLeftbar", wishLeftbar);
		mv.setViewName("myPage/movieHistory");
		return mv;
	}
	
	@RequestMapping(value="movieRemove",method=RequestMethod.GET)
	public ModelAndView movieHistory(@RequestParam(defaultValue="-1", required=false)int tp_num, RedirectAttributes rd){
		int result = 0;
		try {
			result = reserveService.reserveDel(tp_num);
			result = ticketPriceService.ticketRemove(tp_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ModelAndView mv = new ModelAndView();
		if(result>0){
			mv.addObject("message", "예매 내역 삭제 성공하였습니다.");
			mv.addObject("path", "./myPage/movieHistory");
			mv.setViewName("common/messagePath");
		}else{
			mv.addObject("message", "예매 내역 삭제 실패하였습니다.");
			mv.addObject("path", "./myPage/movieHistory");
			mv.setViewName("common/messagePath");
		}
		return mv;
	}
	
	@RequestMapping(value="movieReview",method=RequestMethod.GET)
	public ModelAndView movieReview(@RequestParam(defaultValue="-1", required=false)int movie_num){
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
	
	@RequestMapping(value="movieReviewView",method=RequestMethod.GET)
	public ModelAndView movieReviewView(@RequestParam(defaultValue="-1", required=false)int movie_num,HttpSession session){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		MovieDTO movieDTO = null;
		ReviewDTO reviewDTO = null;
		try {
			movieDTO = movieService.movieInfo(movie_num);
			reviewDTO = reviewService.reviewInfo(movie_num,memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("movieDTO", movieDTO);
		mv.addObject("myInfo", memberDTO);
		mv.addObject("reviewDTO", reviewDTO);
		mv.setViewName("myPage/movieReviewView");
		
		return mv;
	}
	@RequestMapping(value="movieReviewDel",method=RequestMethod.POST)
	public ModelAndView movieReviewDel(@RequestParam(defaultValue="-1", required=false)int movie_num,RedirectAttributes rd,HttpSession session){
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		int result = 0;
		try {
			result = reviewService.reviewRemove(movie_num,memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result>0){
			rd.addAttribute("message", "영화 리뷰 삭제 성공하였습니다.");
			mv.setViewName("redirect:../common/resultClose");
		}else{
			rd.addAttribute("message", "영화 리뷰 삭제 실패하였습니다.");
			mv.setViewName("redirect:../common/resultClose");
		}
		
		return mv;
	}
	
	@RequestMapping(value="movieReview",method=RequestMethod.POST)
	public ModelAndView movieReview(@RequestParam(defaultValue="-1", required=false)int movie_num,String review,RedirectAttributes rd,HttpSession session){
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		int result = 0;
		try {
			result = reviewService.reviewInsert(movie_num,memberDTO.getId(),review);
			result = memberService.pointUpdate(100, memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result>0){
			rd.addAttribute("message", "영화 리뷰 작성 성공하였습니다.");
			mv.setViewName("redirect:../common/resultClose");
		}else{
			rd.addAttribute("message", "영화 리뷰 작성 실패하였습니다.");
			mv.setViewName("redirect:../common/resultClose");
		}
		
		return mv;
	}
	
	@RequestMapping(value="wishList",method=RequestMethod.GET)
	public ModelAndView wishList(String kind, HttpSession session,RedirectAttributes rd,ListData listData, @RequestParam(defaultValue="1", required=false)int curPage){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		List<ReserveDTO> rList = new ArrayList<>();
		if(kind==null){ kind="reg_date"; }
		
		int reserveLeftbar = 0;
		int wishLeftbar = 0;
		try {
			mv = wishService.wishList(memberDTO.getId(), kind, listData);
			reserveLeftbar = reserveService.reserveLeftbar(memberDTO.getId());
			wishLeftbar = wishService.wishLeftbar(memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("reserveLeftbar", reserveLeftbar);
		mv.addObject("wishLeftbar", wishLeftbar);
		mv.addObject("curPage", curPage);
		mv.addObject("page", listData);
		mv.addObject("kind", kind);
		mv.addObject("rList", rList);
		mv.setViewName("myPage/wishList");
		return mv;
	}
	@RequestMapping(value="wishListDel",method=RequestMethod.GET)
	public ModelAndView wishListDel(@RequestParam(defaultValue="-1", required=false)int wish_num,RedirectAttributes rd){
		int result = 0;
		try {
			result = wishService.wishListDelete(wish_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		ModelAndView mv = new ModelAndView();
		if(result>0){
			mv.addObject("message", "위시리스트 삭제 성공하였습니다.");
			mv.addObject("path", "./myPage/wishList");
			mv.setViewName("common/messagePath");
		}else{
			mv.addObject("message", "위시리스트 삭제 실패하였습니다.");
			mv.addObject("path", "./myPage/wishList");
			mv.setViewName("common/messagePath");
		}
		return mv;
	}
	
	@RequestMapping(value="pointHistory", method=RequestMethod.GET)
	public ModelAndView pointHistory(HttpSession session, String testDatepicker1, String testDatepicker2,ListData listData, @RequestParam(defaultValue="1", required=false)int curPage){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c1 = Calendar.getInstance();
        String strToday = sdf.format(c1.getTime());
		if(testDatepicker1==null){
			testDatepicker1="2000-01-01";
		}
		if(testDatepicker2==null){
			testDatepicker2=strToday;
		}
		try {
			mv = pointService.pointList(memberDTO.getId(), testDatepicker1, testDatepicker2, listData);
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
		mv.addObject("testDatepicker1", testDatepicker1);
		mv.addObject("testDatepicker2", testDatepicker2);
		mv.setViewName("myPage/pointHistory");
		return mv;
	}
	
	@RequestMapping(value="couponHistory", method=RequestMethod.GET)
	public ModelAndView couponHistory(HttpSession session,String type,String testDatepicker1, String testDatepicker2,ListData listData, @RequestParam(defaultValue="1", required=false)int curPage){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();

		if(type==null){ type="11"; }
		
		try {
			myCouponService.dateUpdate(memberDTO.getId());
			count = myCouponService.couponCount(memberDTO.getId());
			aCount = myCouponService.couponACount(memberDTO.getId());
			mv = myCouponService.myCouponHistoryList(memberDTO.getId(), type, listData);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("curPage", curPage);
		mv.addObject("page", listData);
		mv.addObject("type", type);
		mv.addObject("count", count);
		mv.addObject("aCount", aCount);
		mv.addObject("today", today);
		mv.addObject("myInfo", memberDTO);
		
		mv.setViewName("myPage/couponHistory");
		return mv;
	}
	@RequestMapping(value="couponHistory2", method=RequestMethod.GET)
	public ModelAndView couponHistory2(HttpSession session,String type,String testDatepicker1, String testDatepicker2,ListData listData, @RequestParam(defaultValue="1", required=false)int curPage){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Calendar c1 = Calendar.getInstance();
        String strToday = sdf.format(c1.getTime());

		if(type==null){ type="12"; }
		if(testDatepicker1==null){ testDatepicker1="2000-01-01"; }
		if(testDatepicker2==null){ testDatepicker2=strToday; }
		
		try {
			myCouponService.dateUpdate(memberDTO.getId());
			count = myCouponService.couponCount(memberDTO.getId());
			aCount = myCouponService.couponACount(memberDTO.getId());
			mv = myCouponService.myCouponDList(memberDTO.getId(), testDatepicker1, testDatepicker2,listData);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("curPage", curPage);
		mv.addObject("page", listData);
		mv.addObject("count", count);
		mv.addObject("aCount", aCount);
		mv.addObject("today", today);
		mv.addObject("myInfo", memberDTO);
		mv.addObject("testDatepicker1", testDatepicker1);
		mv.addObject("testDatepicker2", testDatepicker2);
		
		mv.setViewName("myPage/couponHistory2");
		return mv;
	}
	
	@RequestMapping(value="withdrawalCheck", method=RequestMethod.GET)
	public ModelAndView withdrawalCheck(HttpSession session){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		
		try {
			count = myCouponService.couponCount(memberDTO.getId());
			aCount = myCouponService.couponACount(memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("myInfo",memberDTO);
		mv.addObject("count", count);
		mv.addObject("aCount", aCount);
		mv.addObject("today", today);
		mv.setViewName("myPage/withdrawalCheck");
		return mv;
	}
	
	@RequestMapping(value="withdrawalCheck", method=RequestMethod.POST)
	public ModelAndView withdrawalCheck(HttpSession session,String pwd){
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		try {
			count = myCouponService.couponCount(memberDTO.getId());
			aCount = myCouponService.couponACount(memberDTO.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("myInfo",memberDTO);
		mv.addObject("count", count);
		mv.addObject("aCount", aCount);
		mv.addObject("today", today);
		mv.setViewName("myPage/withdrawal");
		return mv;
	}
	
	@RequestMapping(value="withdrawal", method=RequestMethod.POST)
	public ModelAndView widhdrawal(String id,RedirectAttributes rd, HttpSession session){
		int result = 0;
		try {
			result = memberService.withdrawal(id);
			result = myCouponService.withdrawal(id);
			result = coupongroupService.withdrawal(id);
			result = pointService.withdrawal(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView mv = new ModelAndView();
		
		if(result>0){
			session.invalidate();
			mv.addObject("message", "회원 탈퇴 성공하였습니다.");
			mv.addObject("path", "../../home");
			mv.setViewName("common/messagePath");
		}else{
			mv.addObject("message", "회원 탈퇴 실패하였습니다.");
			mv.addObject("path", "../member/myPageView");
			mv.setViewName("common/messagePath");
		}
		return mv;
	}
}
