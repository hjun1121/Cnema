package com.cnema.c1;

import java.util.ArrayList;
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

@Controller
@RequestMapping(value="/member/**")
public class MemberController {
	@Inject
	private MemberService memberService;
	@Inject
	private ReserveService reserveService;
	
	/*kim*/
	@RequestMapping(value="memberLogout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:../";
	}
	
	@RequestMapping(value="memberLogin", method=RequestMethod.GET)
	public void login(){
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
	public void join(MemberDTO memberDTO){
		try {
			memberService.join(memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*heeseong*/
	@RequestMapping(value="myPageView", method=RequestMethod.GET)
	public ModelAndView selectOne(String id,ModelAndView mv,RedirectAttributes rd){
		MemberDTO memberDTO = null;
		List<ReserveDTO> rList = new ArrayList<ReserveDTO>();
		try {
			memberDTO = memberService.memberInfo(id);
			rList = reserveService.reserveList(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("rList"+rList.get(0).getId());
		
		if(memberDTO != null){
			mv.addObject("myInfo",memberDTO);
			mv.addObject("rList",rList);
			mv.setViewName("member/myPageView");
		}else{
			rd.addFlashAttribute("message","로그인이 필요합니다.");
			mv.setViewName("redirect:../");
		}
		return mv;
	}
}
