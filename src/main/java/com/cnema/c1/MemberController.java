package com.cnema.c1;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnema.member.MemberDTO;
import com.cnema.member.MemberService;

@Controller
@RequestMapping(value="/member/**")
public class MemberController {
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value="memberLogout")
	public void logout(HttpSession session){
		session.invalidate();
	}
	
	@RequestMapping(value="memberLogin", method=RequestMethod.GET)
	public void login(){
		
	}
	
	@RequestMapping(value="memberLogin", method=RequestMethod.POST)
	public void login(MemberDTO memberDTO){
		try {
			memberService.login(memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	
	@RequestMapping(value="myPageView", method=RequestMethod.GET)
	public ModelAndView selectOne(String id,ModelAndView mv,RedirectAttributes rd){
		MemberDTO memberDTO = null;
		id="hseong";
		try {
			memberDTO = memberService.selectOne(id);
			System.out.println(memberDTO.getName());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(memberDTO != null){
			mv.addObject("myInfo",memberDTO);
			mv.setViewName("member/myPageView");
		}else{
			rd.addFlashAttribute("message","로그인이 필요합니다.");
			mv.setViewName("redirect:../home");
		}
		return mv;
	}
}
