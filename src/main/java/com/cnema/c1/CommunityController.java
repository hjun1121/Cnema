package com.cnema.c1;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cnema.community.CommunityService;
import com.cnema.community.PageDTO;
import com.cnema.member.MemberDTO;

@Controller
@RequestMapping(value = "/community/*")
public class CommunityController {
	
	@Inject
	private CommunityService communityService;
	
	
	//pageInsert
	@RequestMapping(value = "pageInsert")
	public ModelAndView pageInsert(ModelAndView mv, HttpSession session) throws Exception {
		
		
		return mv;
	}
	
	
	//mainPage
	@RequestMapping(value = "mainPage")
	public ModelAndView mainPage(ModelAndView mv, HttpSession session) throws Exception {
		String id = "";
		List<PageDTO> pageList = null;
		List<PageDTO> recommendPage = null;
		try {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			id = memberDTO.getId();
			pageList = communityService.selectPageList(id);
			recommendPage = communityService.selectRecommendPage();
			mv.addObject("recommendPage", recommendPage);
			mv.addObject("pageList", pageList);
		} catch (Exception e) {
		}
		
		return mv;
	}

}
