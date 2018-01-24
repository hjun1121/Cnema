package com.cnema.c1;

import java.util.ArrayList;
import java.util.List;

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
@RequestMapping(value = "/community2/*")
public class CommunityController {
	@Inject
	private CommunityService communityService;
	
	//communityMain
	@RequestMapping(value="communityMain", method=RequestMethod.GET)
	public ModelAndView communityMain(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<PageDTO> pageList = new ArrayList<>();
		List<PageDTO> recommendPage = new ArrayList<>();
		recommendPage = communityService.recommendPageList("");
		try {
			MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
			if(memberDTO.getId() != null) {
				pageList = communityService.myPageList(memberDTO.getId(),"");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("recommendPage", recommendPage);
		mv.addObject("pageList", pageList);
		mv.setViewName("community2/communityMain");
		return mv;
	}
	
	@RequestMapping(value="pageRecomList",method=RequestMethod.GET)
	public ModelAndView pageRecomList(HttpSession session,String search) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(search==null){
			search="";
		}
		
		List<PageDTO> pageList = new ArrayList<>();
		List<PageDTO> myPageList = new ArrayList<>();
		List<PageDTO> recomPageList = new ArrayList<>();
		
 		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		pageList = communityService.recommendPageList(search);
		myPageList = communityService.myPageList(memberDTO.getId(),"");
		recomPageList = communityService.recommendPageList("");
		
		mv.addObject("search", search);
		mv.addObject("recommendPage", recomPageList);
		mv.addObject("myPageList", myPageList);
		mv.addObject("pageList", pageList);
		mv.setViewName("community2/pageRecomList");
		return mv;
	}
	
	@RequestMapping(value="pageInsertList",method=RequestMethod.GET)
	public ModelAndView pageInsertList(HttpSession session,String search) throws Exception{
		ModelAndView mv = new ModelAndView();
		if(search==null){
			search="";
		}
		
		List<PageDTO> pageList = new ArrayList<>();
		List<PageDTO> myPageList = new ArrayList<>();
		List<PageDTO> recomPageList = new ArrayList<>();
		
 		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		pageList = communityService.myPageList(memberDTO.getId(),search);
		myPageList = communityService.myPageList(memberDTO.getId(),"");
		recomPageList = communityService.recommendPageList("");
		
		mv.addObject("search", search);
		mv.addObject("recommendPage", recomPageList);
		mv.addObject("myPageList", myPageList);
		mv.addObject("pageList", pageList);
		mv.setViewName("community2/pageInsertList");
		return mv;
	}
}
