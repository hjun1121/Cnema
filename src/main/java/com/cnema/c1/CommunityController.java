package com.cnema.c1;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cnema.community.CommunityService;
import com.cnema.community.PageDTO;
import com.cnema.member.MemberDTO;

@Controller
@RequestMapping(value = "/community/*")
public class CommunityController {
	
	@Inject
	private CommunityService communityService;
	
	
	
	//pageInsert
	@RequestMapping(value = "pageInsert", method=RequestMethod.GET)
	public void pageInsert() {
		
	}
	
	//pageInsert
	@RequestMapping(value = "pageInsert", method=RequestMethod.POST)
	public ModelAndView pageInsert(PageDTO pageDTO, HttpSession session, RedirectAttributes rd) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		try {
			result = communityService.pageInsert(pageDTO, session);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		if(result > 0) {
			rd.addFlashAttribute("message", "페이지 만들기 성공");
			mv.setViewName("redirect:../");
		} else {
			rd.addFlashAttribute("message", "페이지 만들기 실패");
			mv.setViewName("redirect:../");
		}
		
		return mv;
	}
	
	
	//communityMain
	@RequestMapping(value="communityMain", method=RequestMethod.GET)
	public ModelAndView mainPage(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		String id = "";
		List<PageDTO> pageList = null;
		List<PageDTO> recommendPage = null;
		try {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			id = memberDTO.getId();
			recommendPage = communityService.selectRecommendPage();
			pageList = communityService.selectPageList(id);
			System.out.println("id : " + id);
			System.out.println("가입페이지 : " + pageList.size());
			System.out.println("추천페이지 : " + recommendPage.size());

			mv.addObject("recommendPage", recommendPage);
			mv.addObject("pageList", pageList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName("community/communityMain");
		return mv;
	}

}
