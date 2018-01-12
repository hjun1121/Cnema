package com.cnema.c1;

import java.util.List;
import java.util.Scanner;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping(value="mainPage", method=RequestMethod.GET)
	public ModelAndView mainPage(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("ssd");
		String id = "";
		List<PageDTO> pageList = null;
		List<PageDTO> recommendPage = null;
		try {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			id = memberDTO.getId();
			pageList = communityService.selectPageList(id);
			recommendPage = communityService.selectRecommendPage();
			
//			for(PageDTO pageDTO : pageList) {
//				System.out.println(pageDTO.getPage_name());
//			}
			
			mv.addObject("recommendPage", recommendPage);
			mv.addObject("pageList", pageList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName("community/mainPage");
		return mv;
	}

}
