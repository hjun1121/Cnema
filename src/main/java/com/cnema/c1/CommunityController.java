package com.cnema.c1;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

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
import com.cnema.community.PageMemberDTO;
import com.cnema.member.MemberDTO;

@Controller
@RequestMapping(value = "/community/*")
public class CommunityController {
	
	@Inject
	private CommunityService communityService;
	
	
	//pageMain
	@RequestMapping(value = "pageMain", method=RequestMethod.GET)
	public void pageMain() {
		
	}
	
	//pageMain
	@RequestMapping(value = "pageMain", method=RequestMethod.POST)
	public ModelAndView pageMain(HttpSession session, int page_num) throws Exception {
		ModelAndView mv = new ModelAndView();
		String id = "";
		PageMemberDTO memberCheck = null;
		try {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			id = memberDTO.getId();
			if(id != null) {
				memberCheck = communityService.memberCheck(page_num, id);
			}
			if(memberCheck != null) {
				mv.addObject("memberCheck", true);
			} else {
				mv.addObject("memberCheck", false);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		PageDTO pageDTO = communityService.selectPageOne(page_num); //페이지 정보 가져오기
		List<PageMemberDTO> pageMember = communityService.selectPageMemberList(page_num);


		mv.addObject("page", pageDTO);
		mv.addObject("pageMember", pageMember);
		mv.setViewName("community/pageMain");
		
		return mv;
	}
	
	
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
	public ModelAndView communityMain(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		String id = "";
		List<PageDTO> pageList = null;
		List<PageDTO> recommendPage = null;
		recommendPage = communityService.selectRecommendPage();
		mv.addObject("recommendPage", recommendPage);
		try {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			id = memberDTO.getId();
			
			if(id != null) {
				pageList = communityService.selectPageList(id);
				mv.addObject("pageList", pageList);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("community/communityMain");
		return mv;
	}

}
