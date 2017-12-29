package com.cnema.c1;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
			// TODO Auto-generated catch block
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="myPageView", method=RequestMethod.GET)
	public void selectOne(String id){
		try {
			MemberDTO memberDTO = memberService.selectOne(id);
			System.out.println(memberDTO.getPw());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
}
