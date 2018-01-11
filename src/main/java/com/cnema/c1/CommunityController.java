package com.cnema.c1;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.community.CommunityService;
import com.cnema.member.MemberDTO;

@Controller
@RequestMapping(value = "/community/*")
public class CommunityController {
	
	@Inject
	private CommunityService communityService;
	
	//mainPage
	@RequestMapping(value = "mainPage")
	public ModelAndView mainPage(ModelAndView mv, HttpSession session) throws Exception {
		String id = "";
		try {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			id = memberDTO.getId();
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return mv;
	}

}
